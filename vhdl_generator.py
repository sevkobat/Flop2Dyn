import subprocess
import re
import os
from file_manager import remove_simulation_files

def generate_vhdl(
        operator_config, 
        num_test_vectors, 
        vhdl_output_dir, 
        flopoco_executable_path, 
        clean_simulation_files, 
        operators_info):
    # Use subprocess to call FloPoCo with the parameters from operator_config
    # Check if 'pipelineStages' is provided and use it if necessary
    # Construct the FloPoCo command based on the operator_config
    # Determine wE and wF based on bitSize
    if operator_config['bitSize'] == 32:
        wE, wF = 8, 23
    elif operator_config['bitSize'] == 64:
        wE, wF = 11, 52
    else:
        raise ValueError("Unsupported bit size")
    
    # Get the FloPoCo operator name from the mapping
    flopoco_operator_name = operators_info.get(operator_config['name']).get('flopoco_name')
    if not flopoco_operator_name:
        raise ValueError(f"Unsupported operator name: {operator_config['name']}")

    # Construct the FloPoCo command based on the operator_config
    command = [
        flopoco_executable_path, 
        flopoco_operator_name, 
        f'wE={wE}', 
        f'wF={wF}', 
        f'frequency={operator_config["targetFrequencyMHz"]}',
        f'name={operator_config["name"]}'
    ]

    # Modify command to include testbench generation
    command.append("Testbench")
    command.append(f"n={num_test_vectors}")

    # Execute the command and capture the output
    process = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    output = process.stdout

    # You can also capture and process any errors: IN THIS CASE errors contains the informative command line output
    errors = process.stderr

    # Extract the simulation command
    simulation_command_match = re.search(r"To run the simulation using nvc.*--stop-time=\d+ns", errors, re.DOTALL)
    simulation_command = simulation_command_match.group(0).split('\n')[1].strip() if simulation_command_match else None

    #if simulation_command:
        # Run the simulation command
        #os.system(simulation_command)

    if simulation_command:
        simulation_result = subprocess.run(simulation_command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        simulation_output = simulation_result.stdout + simulation_result.stderr

        # Check for success indicators in the simulation output
        if "0 error(s)" in simulation_output and "End of simulation" in simulation_output:
            print("Simulation completed successfully.")
            if clean_simulation_files:
                remove_simulation_files(operator_config)
        else:
            print("Simulation may have encountered errors.")
            # You can also log the full simulation output for debugging
            print(simulation_output)

    # Find all occurrences of pipeline depth
    pipeline_depth_matches = re.findall(r'Pipeline depth = (\d+)', errors)

    # Select the last occurrence if there are any, otherwise set to None
    pipeline_depth = int(pipeline_depth_matches[-1]) if pipeline_depth_matches else None

    # Remove the testbench from the VHDL file and rename the generated VHDL file to prevent overwriting
    original_vhdl_path = 'flopoco.vhdl'
    new_vhdl_name = f"{operator_config['name']}_{operator_config['bitSize']}bit.vhd"
    new_vhdl_path = os.path.join(vhdl_output_dir, new_vhdl_name)

    with open(original_vhdl_path, 'r') as vhdl_file:
        lines = vhdl_file.readlines()

    # Find the start of the testbench and remove it
    testbench_start_identifier = "TestBench_"
    testbench_start = next((i for i, line in enumerate(lines) if testbench_start_identifier in line), None) - 1
    if testbench_start is not None:
        lines = lines[:testbench_start]

    with open(new_vhdl_path, 'w') as vhdl_file:
        vhdl_file.writelines(lines)

    # Remove the original file
    os.remove(original_vhdl_path)

    # Return a dictionary with the information extracted and any files generated
    return {
        'output': output,
        'pipeline_depth': pipeline_depth,
        'errors': errors,
        'vhdl_file_path': new_vhdl_path,
        'simulation_command': simulation_command
    }