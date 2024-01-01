import os
import json
import shutil
import re

def read_config(file_name):
    if os.path.isabs(file_name):
        # If the file_name is an absolute path, use it directly
        config_path = file_name
    else:
        # Otherwise, construct the full path
        script_dir = os.path.dirname(os.path.realpath(__file__))
        config_path = os.path.join(script_dir, file_name)

    # Read and parse the JSON configuration file
    with open(config_path, 'r') as file:
        config = json.load(file)

    return config

def remove_simulation_files(operator_config):
    # Construct the expected file name pattern based on the operator_config

    if operator_config['bitSize'] == 32:
        wE, wF = 8, 23
    elif operator_config['bitSize'] == 64:
        wE, wF = 11, 52

    # Construct a regex pattern based on the operator_config
    pattern = rf"TestBench_{re.escape(operator_config['name'])}_.*\.fst$"

    # Compile the regex pattern
    regex = re.compile(pattern)

    #Remove the file that contains the test vectors for the simulation.
    print("Removing file: test.input")
    os.remove("test.input")
    print("Removing directory: work")
    shutil.rmtree('work')

    # Flag to track if any files were removed
    file_removed = False

    # List all files in the current directory
    for file in os.listdir('.'):
        # Check if the file matches the regex pattern
        if regex.match(file):
            print(f"Removing file: {file}")  # Print the name of the file
            os.remove(file)
            file_removed = True
    
    if not file_removed:
        print("No simulation files to remove.")

def combine_vhdl_files(file_paths, combined_file_path):
    print("Combining VHDL files..")
    with open(combined_file_path, 'w') as combined_file:
        for file_path in file_paths:
            with open(file_path, 'r') as vhdl_file:
                # Read the content of the VHDL file
                content = vhdl_file.read()
                # Write the content to the combined file
                combined_file.write(content)
                # Optionally, write a separator or newline for readability
                combined_file.write('\n\n')
        
    # Remove the original VHDL files
    for file_path in file_paths:
        print("Removing file: " + file_path)
        os.remove(file_path)