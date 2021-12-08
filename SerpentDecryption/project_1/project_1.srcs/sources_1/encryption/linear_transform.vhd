----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2021 11:02:56 AM
-- Design Name: 
-- Module Name: linear_transform - Behavioral
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

entity linear_transform is
    Port ( i_X : in STD_LOGIC_VECTOR(127 downto 0);
           o_Bk : out STD_LOGIC_VECTOR(127 downto 0));
end linear_transform;

architecture Behavioral of linear_transform is

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

-- Opérations linaires
signal X1_op1 : STD_LOGIC_VECTOR(31 downto 0);
signal X3_op1 : STD_LOGIC_VECTOR(31 downto 0);

signal X0_op2 : STD_LOGIC_VECTOR(31 downto 0);
signal X2_op2 : STD_LOGIC_VECTOR(31 downto 0);

begin

-- Construire les éléments Xi
X0 <= i_X(31 downto 0);
X1 <= i_X(63 downto 32);
X2 <= i_X(95 downto 64);
X3 <= i_X(127 downto 96);

-- Transformations linéaires

-- Shift 1
X0_shift1 <= std_logic_vector(rotate_left(unsigned(X0), 13));
X2_shift1 <= std_logic_vector(rotate_left(unsigned(X2), 3));

-- Opérations 1
X1_op1 <= X1 xor X0_shift1 xor X2_shift1;
X3_op1 <= X3 xor X2_shift1 xor std_logic_vector(shift_left(unsigned(X0_shift1), 3));

-- Shift 2
X1_shift2 <= std_logic_vector(rotate_left(unsigned(X1_op1), 1));
X3_shift2 <= std_logic_vector(rotate_left(unsigned(X3_op1), 7));

-- Opérations 2
X0_op2 <= X0_shift1 xor X1_shift2 xor X3_shift2;
X2_op2 <= X2_shift1 xor X3_shift2 xor std_logic_vector(shift_left(unsigned(X1_shift2), 7));

-- Shift 3
X0_shift3 <= std_logic_vector(rotate_left(unsigned(X0_op2), 5));
X2_shift3 <= std_logic_vector(rotate_left(unsigned(X2_op2), 22));

-- Reconstruire la sortie
o_Bk(31 downto 0) <= X0_shift3;
o_Bk(63 downto 32) <= X1_shift2;
o_Bk(95 downto 64) <= X2_shift3;
o_Bk(127 downto 96) <= X3_shift2;

end Behavioral;
