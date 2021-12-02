----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/25/2021 05:04:49 PM
-- Design Name: 
-- Module Name: FSM_Transmitter - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM_Transmitter is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           EN : in STD_LOGIC;
           LOAD : out STD_LOGIC;
           START : out STD_LOGIC;
           COMPUTE : out STD_LOGIC);
           
end FSM_Transmitter;

architecture Behavioral of FSM_Transmitter is

type states is (standby, loading, start_encoding, encoding, waiting);

signal FSM_state : states;
signal counter : STD_LOGIC_VECTOR (7 downto 0);

begin

process (RST, CLK, EN) begin
    if RST = '1' then
        LOAD <= '0';
        START <= '0';
        COMPUTE <= '0';
        counter <= (others => '0');
        FSM_state <= standby;
    elsif (CLK'event and CLK = '1') then
        case FSM_state is
        when standby =>
            LOAD <= '0';
            START <= '0';
            COMPUTE <= '0';
            counter <= (others => '0');
            if EN = '1' then
                FSM_state <= start_encoding;
            else 
                FSM_state <= standby;
            end if;
            
        when start_encoding =>
            LOAD <= '0';
            START <= '1';
            COMPUTE <= '1';
            counter <= counter + 1;
            FSM_state <= encoding;
            
        when encoding =>
            LOAD <= '0';
            START <= '0';
            COMPUTE <= '1';
            counter <= counter + 1;
            if counter = 4 then
                FSM_state <= waiting;
            else 
                FSM_state <= encoding;
            end if;
        
        when waiting =>
            LOAD <= '0';
            START <= '0';
            COMPUTE <= '0';
            counter <= counter + 1;
            if counter = 14 then
                FSM_state <= loading;
            else 
                FSM_state <= waiting;
            end if;
         
        when loading =>
            LOAD <= '1';
            START <= '0';
            COMPUTE <= '0';
            counter <= (others => '0');
            FSM_state <= start_encoding;
            
         end case;
     end if;
end process;

end Behavioral;
