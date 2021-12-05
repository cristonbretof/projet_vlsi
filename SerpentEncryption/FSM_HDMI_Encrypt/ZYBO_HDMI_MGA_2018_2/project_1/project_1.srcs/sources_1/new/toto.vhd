----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/04/2021 12:55:24 PM
-- Design Name: 
-- Module Name: pixel16 - Behavioral
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
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity toto is
    Port ( RGB_IN : in STD_LOGIC_VECTOR (23 downto 0);
           VSYNC_IN : in STD_LOGIC;
           HSYNC_IN : in STD_LOGIC;
           VDE_IN : in STD_LOGIC;
           CLK: in STD_LOGIC;
           RESET: in STD_LOGIC;
           RGB_OUT : out STD_LOGIC_VECTOR (23 downto 0);
           VSYNC_OUT : out STD_LOGIC;
           HSYNC_OUT : out STD_LOGIC;
           VDE_OUT : out STD_LOGIC);
end toto;

architecture Behavioral of toto is

--component top_level_encryption is
--    Port ( i_expanded_key : in std_logic_vector(4223 downto 0);
--           i_reset : in std_logic;
--           i_start: in std_logic;
--           i_pixel_clk : in std_logic;
--           i_plaintext : in std_logic_vector(127 downto 0);
--           o_data_ready : out std_logic;
--           o_ciphertext : out std_logic_vector(127 downto 0));
--end component;

type fsm is (loading, first_encrypt, running);
type pixel is record
    rgb: STD_LOGIC_VECTOR (23 downto 0);
    vsync: STD_LOGIC;
    HSYNC: STD_LOGIC;
    VDE: STD_LOGIC;
end record pixel;

type pixel16 is array (0 to 15) of pixel;

signal pixels_in : pixel16;
signal pixels_int: pixel16;
signal pixels_int_encrypted: pixel16;
signal pixels_out: pixel16;
signal pixel_in: pixel;
signal state : fsm;
signal counter: STD_LOGIC_VECTOR(7 downto 0);
signal pixel_int_buffer: STD_LOGIC_VECTOR(383 downto 0);
signal pixel_int_buffer_encrypted: STD_LOGIC_VECTOR(383 downto 0);
signal start_int: std_logic;
signal data_ready_1: STD_LOGIC;
signal data_ready_2: STD_LOGIC;
signal data_ready_3: STD_LOGIC;
signal data_ready: STD_LOGIC;



begin

pixel_in.rgb <= RGB_IN;
pixel_in.vsync <= VSYNC_IN;
pixel_in.hsync <= HSYNC_IN;
pixel_in.vde <= VDE_IN;
data_ready <= data_ready_1 AND data_ready_2 AND data_ready_3;


--encrypter1 : top_level_encryption
--        Port Map ( i_expanded_key => (others => '0'),
--                   i_reset => RESET,
--                   i_start => start_int,
--                   i_pixel_clk => CLK,
--                   i_plaintext => pixel_int_buffer(383 downto 256),
--                   o_data_ready => data_ready_1,
--                   o_ciphertext => pixel_int_buffer_encrypted(383 downto 256));

--encrypter2 : top_level_encryption
--        Port Map ( i_expanded_key => (others => '0'),
--                  i_reset => RESET,
--                  i_start => start_int,
--                  i_pixel_clk => CLK,
--                  i_plaintext => pixel_int_buffer(255 downto 128),
--                  o_data_ready => data_ready_2,
--                  o_ciphertext => pixel_int_buffer_encrypted(255 downto 128));

--encrypter3 : top_level_encryption
--        Port Map ( i_expanded_key => (others => '0'),
--                 i_reset => RESET,
--                 i_start => start_int,
--                 i_pixel_clk => CLK,
--                 i_plaintext => pixel_int_buffer(127 downto 0),
--                 o_data_ready => data_ready_3,
--                 o_ciphertext => pixel_int_buffer_encrypted(127 downto 0));



process(RGB_IN, VSYNC_IN, VDE_IN, CLK, RESET)
begin
    if reset = '1' then
        RGB_OUT <= x"000000";
        state <= loading;
        VSYNC_OUT <= '0';
        HSYNC_OUT <= '0';
        VDE_OUT <= '0';
        counter <= x"00";
    elsif rising_edge(CLK) then
        case state is
            when loading => 
                for i in 15 downto 1 loop
                    pixels_in(i)    <=  pixels_in(i-1);    
                end loop;
                pixels_in(0) <= pixel_in;
                RGB_OUT <= x"000000";
                VSYNC_OUT <= '0';
                HSYNC_OUT <= '0';
                VDE_OUT <= '0';
                counter <= counter + 1;
                if counter >= 15 then
                    pixels_int <= pixels_in;
                    start_int <= '1';
                    state <= first_encrypt;
                    counter <= x"00";
                end if;
                
            when first_encrypt =>
                -- shift pixels
                for i in 15 downto 1 loop
                    pixels_in(i)    <=  pixels_in(i-1);    
                end loop;
                pixels_in(0) <= pixel_in;
                
                for i in 0 to 15 loop
                    pixel_int_buffer(24*i + 23 downto 24*i) <= pixels_int(i).rgb;
                end loop;
                
                RGB_OUT <= x"000000";
                VSYNC_OUT <= '0';
                HSYNC_OUT <= '0';
                VDE_OUT <= '0';
                counter <= counter + 1;
                
                if counter >= 15 then
                    pixels_out <= pixels_int;
                    pixels_int <= pixels_in;
                    start_int <= '1';
                    state <= first_encrypt;
                    counter <= x"00";
                    state <= running;
                end if;
                
                
            when running =>
                for i in 15 downto 1 loop
                    pixels_in(i)    <=  pixels_in(i-1);   
                    pixels_out(i) <= pixels_out(i-1);
                end loop;
                pixels_in(0) <= pixel_in;
                
                for i in 0 to 15 loop
                    pixel_int_buffer(24*i + 23 downto 24*i) <= pixels_int(i).rgb;
                end loop;
                
                RGB_OUT <= pixels_out(15).rgb;
                VSYNC_OUT <= pixels_out(15).vsync;
                HSYNC_OUT <= pixels_out(15).hsync;
                VDE_OUT <= pixels_out(15).vde;
                counter <= counter + 1;
                
                if counter >= 15 then
                    pixels_out <= pixels_int;
                    pixels_int <= pixels_in;
                    start_int <= '1';
                    state <= first_encrypt;
                    counter <= x"00";
                    state <= running;
                end if;
            end case;
      end if;
end process;



end Behavioral;