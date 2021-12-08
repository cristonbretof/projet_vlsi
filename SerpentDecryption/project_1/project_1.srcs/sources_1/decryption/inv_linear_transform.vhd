----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2021 01:17:49 PM
-- Design Name: 
-- Module Name: inv_linear_transform - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inv_linear_transform is
    Port ( i_Bk : in STD_LOGIC_VECTOR(127 downto 0);
           o_X : out STD_LOGIC_VECTOR(127 downto 0));
end inv_linear_transform;

architecture Behavioral of inv_linear_transform is
-- Vecteur initiaux
signal X0 : STD_LOGIC_VECTOR(31 downto 0);
signal X1 : STD_LOGIC_VECTOR(31 downto 0);
signal X2 : STD_LOGIC_VECTOR(31 downto 0);
signal X3 : STD_LOGIC_VECTOR(31 downto 0);

-- Shift circulaires
signal X0_shift1 : STD_LOGIC_VECTOR(31 downto 0);
signal X2_shift1 : STD_LOGIC_VECTOR(31 downto 0);

signal X1_shift2 : STD_LOGIC_VECTOR(31 downto 0);
signal X3_shift2 : STD_LOGIC_VECTOR(31 downto 0);

signal X0_shift3 : STD_LOGIC_VECTOR(31 downto 0);
signal X2_shift3 : STD_LOGIC_VECTOR(31 downto 0);

-- Opérations linéaires
signal X1_op2 : STD_LOGIC_VECTOR(31 downto 0);
signal X3_op2 : STD_LOGIC_VECTOR(31 downto 0);

signal X0_op1 : STD_LOGIC_VECTOR(31 downto 0);
signal X2_op1 : STD_LOGIC_VECTOR(31 downto 0);


begin

-- Construire les éléments Xi
X0 <= i_Bk(31 downto 0);
X1 <= i_Bk(63 downto 32);
X2 <= i_Bk(95 downto 64);
X3 <= i_Bk(127 downto 96);

X2_shift1 <= std_logic_vector(rotate_right(unsigned(X2), 22));
X0_shift1 <= std_logic_vector(rotate_right(unsigned(X0), 5));

X0_op1 <= X0_shift1 xor X1 xor X3;
X2_op1 <= X2_shift1 xor X3 xor std_logic_vector(shift_left(unsigned(X1), 7));

X1_shift2 <= std_logic_vector(rotate_right(unsigned(X1), 1));
X3_shift2 <= std_logic_vector(rotate_right(unsigned(X3), 7));

X1_op2 <= X1_shift2 xor X0_op1 xor X2_op1;
X3_op2 <= X2_op1 xor X3_shift2 xor std_logic_vector(shift_left(unsigned(X0_op1), 3));

X0_shift3 <= std_logic_vector(rotate_right(unsigned(X0_op1), 13));
X2_shift3 <= std_logic_vector(rotate_right(unsigned(X2_op1), 3));

o_X(31 downto 0) <= X0_shift3;
o_X(63 downto 32) <= X1_op2;
o_X(95 downto 64) <= X2_shift3;
o_X(127 downto 96) <= X3_op2;

end Behavioral;
