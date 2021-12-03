----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/02/2021 02:15:57 PM
-- Design Name: 
-- Module Name: Main_Encryption_Module - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
library keyschedule;
use IEEE.STD_LOGIC_1164.ALL;
use keyschedule.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Main_Encryption_Module is
    generic(depth : integer := 24;
            width : integer := 16);
    Port ( RGB_IN : in STD_LOGIC_VECTOR (depth-1 downto 0);
           HSYNC_IN : in STD_LOGIC;
           VSYNC_IN : in STD_LOGIC;
           VDE_IN : in STD_LOGIC;
           RESET : in STD_LOGIC;
           CLK : in STD_LOGIC;
           RGB_OUT : out STD_LOGIC_VECTOR (depth-1 downto 0);
           HSYNC_OUT : out STD_LOGIC;
           VSYNC_OUT : out STD_LOGIC;
           VDE_OUT : out STD_LOGIC);
end Main_Encryption_Module;

architecture Behavioral of Main_Encryption_Module is

component FSM_Transmitter is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           EN : in STD_LOGIC;
           LOAD : out STD_LOGIC;
           START : out STD_LOGIC;
           COMPUTE : out STD_LOGIC);
end component;

component shiftNbitRL is
    generic (N : integer := 8);
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           EN : in STD_LOGIC;
           LOAD : in STD_LOGIC;
           D : in STD_LOGIC;
           DATA_IN : in STD_LOGIC_VECTOR (N-1 downto 0);
           Q : out STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (N-1 downto 0));
end component;

component regNbit is
    generic (N : integer := 8);
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           EN : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (N-1 downto 0);
           Q : out STD_LOGIC_VECTOR (N-1 downto 0));
end component;


component top_level_encryption is
    Port ( i_expanded_key : in std_logic_vector(4223 downto 0);
           i_reset : in std_logic;
           i_start: in std_logic;
           i_pixel_clk : in std_logic;
           i_plaintext : in std_logic_vector(127 downto 0);
           o_data_ready : out std_logic;
           o_ciphertext : out std_logic_vector(127 downto 0));
end component;

signal RGB_int : STD_LOGIC_VECTOR (depth-1 downto 0);
signal RX_buffer_int : STD_LOGIC_VECTOR (depth*width-1 downto 0);
signal encoder_input : STD_LOGIC_VECTOR (depth*width-1 downto 0);
signal encoder_output : STD_LOGIC_VECTOR (depth*width-1 downto 0);
signal TX_buffer_int : STD_LOGIC_VECTOR (depth*width-1 downto 0);

signal load_int : STD_LOGIC;
signal start_int : STD_LOGIC;
signal compute_int : STD_LOGIC;
signal ready_int : STD_LOGIC;

signal encryption_key_int : STD_LOGIC_VECTOR(127 downto 0);
signal padded_key_int : STD_LOGIC_VECTOR(255 downto 0);
signal expanded_key_int : STD_LOGIC_VECTOR(4223 downto 0);
signal data_ready_1 : STD_LOGIC;
signal data_ready_2 : STD_LOGIC;
signal data_ready_3 : STD_LOGIC;

begin

encryption_key_int <= (others => '0');

keypad : entity keyschedule.key_padding
    Port Map ( i_key => encryption_key_int,
               o_pad_key => padded_key_int);
               
keyexpansion : entity keyschedule.key_expansion
    Port Map ( i_pad_key => padded_key_int,
               o_expand_key => expanded_key_int);

-- Il faut 1 buffer de 1 bit par bit de pixel 
-- (generate 24)
delay_buffer :  regNbit
    Generic Map (N => 24)
    Port Map (  CLK => CLK,
                RST => HSYNC_IN,
                EN => VDE_IN,
                D => RGB_IN,
                Q => RGB_int);

-- Il faut 1 buffer de 16 bit par bit de pixel 
-- (generate 24)
shift_start : 
    for i in depth-1 downto 0 generate 
    shift_RX_X : shiftNbitRL
        Generic Map (N => width)
        Port Map (  CLK => CLK,
                    RST => HSYNC_IN,
                    EN => VDE_IN,
                    LOAD => '0',
                    D => RGB_int(i),
                    DATA_IN => (others => '0'),
                    Q => open,
                    DATA_OUT => RX_buffer_int((i+1)*width - 1 downto i*width)); -- vers buffer d entree
    end generate;

-- Il faut 1 buffer de 16 bit par bit de pixel 
-- (generate 24)                
shift_end :
    for i in depth-1 downto 0 generate 
    shift_TX_X : shiftNbitRL
        Generic Map (N => width)
        Port Map (  CLK => CLK,
                    RST => HSYNC_IN,
                    EN => VDE_IN,
                    LOAD => load_int, -- Load signal
                    D => '0',
                    DATA_IN => TX_buffer_int((i+1)*width - 1 downto i*width),
                    Q => RGB_OUT(i),
                    DATA_OUT => open);
    end generate;

--word_int_mux <= (word_int2 + cbc_int) when start_int = '1' else word_out;
                 
-- Il faut un buffer de 384 bits
input_buffer : regNbit
    Generic Map (N => 384)
    Port Map (  CLK => CLK,
                RST => HSYNC_IN,
                EN => load_int,
                D => RX_buffer_int,
                Q => encoder_input);

-- Il faut un buffer de 384 bits
output_buffer : regNbit
    Generic Map (N => 384)
    Port Map (  CLK => CLK,
                RST => HSYNC_IN,
                EN => ready_int,
                D => encoder_output,
                Q => TX_buffer_int);
                
ready_int <= data_ready_1 and data_ready_2 and data_ready_3;

--cbc_vector : regNbit
--    Generic Map (N => 16)
--    Port Map (  CLK => CLK,
--                RST => rst_int,
--                EN => load_int,
--                D => word_out,
--                Q => cbc_int);

inst_fsm : FSM_Transmitter
        Port Map (  CLK => CLK,
                    RST => RESET,
                    EN => VDE_IN,
                    LOAD => load_int,
                    START => start_int,
                    COMPUTE => compute_int);

VSYNCBuffer1 : shiftNbitRL
        Generic Map (N => 2*width+2)
        Port Map (
            CLK => CLK,
            RST => RESET,
            EN => '1',
            LOAD => '0',
            D => VSYNC_IN,
            DATA_IN => (others => '0'),
            Q => VSYNC_OUT,
            DATA_OUT => open);

HSYNCBuffer1 : shiftNbitRL
        Generic Map (N => 2*width+2)
        Port Map (
            CLK => CLK,
            RST => RESET,
            EN => '1',
            LOAD => '0',
            D => HSYNC_IN,
            DATA_IN => (others => '0'),
            Q => HSYNC_OUT,
            DATA_OUT => open);

VDEBuffer1 : shiftNbitRL
        Generic Map (N => 2*width+2)
        Port Map (
            CLK => CLK,
            RST => RESET,
            EN => '1',
            LOAD => '0',
            D => VDE_IN,
            DATA_IN => (others => '0'),
            Q => VDE_OUT,
            DATA_OUT => open);

encrypter1 : top_level_encryption
        Port Map ( i_expanded_key => expanded_key_int,
                   i_reset => RESET,
                   i_start => compute_int,
                   i_pixel_clk => CLK,
                   i_plaintext => encoder_input(383 downto 256),
                   o_data_ready => data_ready_1,
                   o_ciphertext => encoder_output(383 downto 256));

encrypter2 : top_level_encryption
        Port Map ( i_expanded_key => expanded_key_int,
                  i_reset => RESET,
                  i_start => compute_int,
                  i_pixel_clk => CLK,
                  i_plaintext => encoder_input(255 downto 128),
                  o_data_ready => data_ready_2,
                  o_ciphertext => encoder_output(255 downto 128));

encrypter3 : top_level_encryption
        Port Map ( i_expanded_key => expanded_key_int,
                 i_reset => RESET,
                 i_start => compute_int,
                 i_pixel_clk => CLK,
                 i_plaintext => encoder_input(127 downto 0),
                 o_data_ready => data_ready_3,
                 o_ciphertext => encoder_output(127 downto 0));
end Behavioral;
