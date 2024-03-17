-----------------------------------------------------------------------
-- FloatingPointPower, version 0.0
-----------------------------------------------------------------------

Library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.customTypes.all;

entity powf_op is
Generic (
 INPUTS: integer := 2; 
 OUTPUTS: integer := 1; 
 DATA_SIZE_IN: integer := 32; 
 DATA_SIZE_OUT: integer := 32
);
port (
  clk : IN STD_LOGIC;
  rst : IN STD_LOGIC;
  pValidArray : IN std_logic_vector(1 downto 0);
  nReadyArray : in std_logic_vector(0 downto 0);
  validArray : out std_logic_vector(0 downto 0);
  readyArray : OUT std_logic_vector(1 downto 0);
  dataInArray : in data_array (1 downto 0)(DATA_SIZE_IN-1 downto 0);
  dataOutArray : out data_array (0 downto 0)(DATA_SIZE_OUT-1 downto 0));
end entity;

architecture arch of powf_op is
    component FloatingPointPower is
        port (
            clk, ce : in std_logic;
            X : in  std_logic_vector(33 downto 0);
            Y : in  std_logic_vector(33 downto 0);
            R : out  std_logic_vector(33 downto 0)
        );
    end component;

    signal join_valid : STD_LOGIC;

    signal buff_valid, oehb_valid, oehb_ready : STD_LOGIC;
    signal oehb_dataOut, oehb_datain : std_logic_vector(0 downto 0);

    --intermediate input signals for float conversion
    signal X_in, Y_in : std_logic_vector(33 downto 0);

    --intermidiate output signal(s) for float conversion
    signal R_out : std_logic_vector(33 downto 0);

    

    begin


        join: entity work.join(arch) generic map(2)
        port map( pValidArray,
                oehb_ready,
                join_valid,
                readyArray);

        buff: entity work.delay_buffer(arch) generic map(8)
        port map(clk,
                rst,
                join_valid,
                oehb_ready,
                buff_valid);

        oehb: entity work.OEHB(arch) generic map (1, 1, 1, 1)
                port map (
                --inputspValidArray
                    clk => clk,
                    rst => rst,
                    pValidArray(0)  => buff_valid, -- real or speculatef condition (determined by merge1)
                    nReadyArray(0) => nReadyArray(0),
                    validArray(0) => validArray(0),
                --outputs
                    readyArray(0) => oehb_ready,
                    dataInArray(0) => oehb_datain,
                    dataOutArray(0) => oehb_dataOut
                );

        ieee2nfloat_0: entity work.InputIEEE_32bit(arch)
                port map (
                    --input
                    X => dataInArray(0),
                    --output
                    R => X_in
                );

        ieee2nfloat_1: entity work.InputIEEE_32bit(arch)
                port map (
                    --input
                    X => dataInArray(1),
                    --output
                    R => Y_in
                );

        

        nfloat2ieee : entity work.OutputIEEE_32bit(arch)
                port map (
                    --input
                    X => R_out,
                    --ouput
                    R => dataOutArray(0)
                );

        operator :  component FloatingPointPower
        port map (
            clk   => clk,
            ce => oehb_ready,
            X  => X_in,
            Y  => Y_in,
            R  => R_out
        );
end architecture;
