----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2021 11:02:56 AM
-- Design Name: 
-- Module Name: inverse_ip - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inverse_ip is
    Port ( i_B32 : in STD_LOGIC_VECTOR (127 downto 0);
           o_ciphertext : out STD_LOGIC_VECTOR (127 downto 0));
end inverse_ip;

architecture Behavioral of inverse_ip is

begin

-- Permutation finale


o_ciphertext(0) <= i_B32(0);
o_ciphertext(1) <= i_B32(4);
o_ciphertext(2) <= i_B32(8);
o_ciphertext(3) <= i_B32(12);
o_ciphertext(4) <= i_B32(16);
o_ciphertext(5) <= i_B32(20);
o_ciphertext(6) <= i_B32(24);
o_ciphertext(7) <= i_B32(28);
o_ciphertext(8) <= i_B32(32);
o_ciphertext(9) <= i_B32(36);
o_ciphertext(10) <= i_B32(40);
o_ciphertext(11) <= i_B32(44);
o_ciphertext(12) <= i_B32(48);
o_ciphertext(13) <= i_B32(52);
o_ciphertext(14) <= i_B32(56);
o_ciphertext(15) <= i_B32(60);
o_ciphertext(16) <= i_B32(64);
o_ciphertext(17) <= i_B32(68);
o_ciphertext(18) <= i_B32(72);
o_ciphertext(19) <= i_B32(76);
o_ciphertext(20) <= i_B32(80);
o_ciphertext(21) <= i_B32(84);
o_ciphertext(22) <= i_B32(88);
o_ciphertext(23) <= i_B32(92);
o_ciphertext(24) <= i_B32(96);
o_ciphertext(25) <= i_B32(100);
o_ciphertext(26) <= i_B32(104);
o_ciphertext(27) <= i_B32(108);
o_ciphertext(28) <= i_B32(112);
o_ciphertext(29) <= i_B32(116);
o_ciphertext(30) <= i_B32(120);
o_ciphertext(31) <= i_B32(124);
o_ciphertext(32) <= i_B32(1);
o_ciphertext(33) <= i_B32(5);
o_ciphertext(34) <= i_B32(9);
o_ciphertext(35) <= i_B32(13);
o_ciphertext(36) <= i_B32(17);
o_ciphertext(37) <= i_B32(21);
o_ciphertext(38) <= i_B32(25);
o_ciphertext(39) <= i_B32(29);
o_ciphertext(40) <= i_B32(33);
o_ciphertext(41) <= i_B32(37);
o_ciphertext(42) <= i_B32(41);
o_ciphertext(43) <= i_B32(45);
o_ciphertext(44) <= i_B32(49);
o_ciphertext(45) <= i_B32(53);
o_ciphertext(46) <= i_B32(57);
o_ciphertext(47) <= i_B32(61);
o_ciphertext(48) <= i_B32(65);
o_ciphertext(49) <= i_B32(69);
o_ciphertext(50) <= i_B32(73);
o_ciphertext(51) <= i_B32(77);
o_ciphertext(52) <= i_B32(81);
o_ciphertext(53) <= i_B32(85);
o_ciphertext(54) <= i_B32(89);
o_ciphertext(55) <= i_B32(93);
o_ciphertext(56) <= i_B32(97);
o_ciphertext(57) <= i_B32(101);
o_ciphertext(58) <= i_B32(105);
o_ciphertext(59) <= i_B32(109);
o_ciphertext(60) <= i_B32(113);
o_ciphertext(61) <= i_B32(117);
o_ciphertext(62) <= i_B32(121);
o_ciphertext(63) <= i_B32(125);
o_ciphertext(64) <= i_B32(2);
o_ciphertext(65) <= i_B32(6);
o_ciphertext(66) <= i_B32(10);
o_ciphertext(67) <= i_B32(14);
o_ciphertext(68) <= i_B32(18);
o_ciphertext(69) <= i_B32(22);
o_ciphertext(70) <= i_B32(26);
o_ciphertext(71) <= i_B32(30);
o_ciphertext(72) <= i_B32(34);
o_ciphertext(73) <= i_B32(38);
o_ciphertext(74) <= i_B32(42);
o_ciphertext(75) <= i_B32(46);
o_ciphertext(76) <= i_B32(50);
o_ciphertext(77) <= i_B32(54);
o_ciphertext(78) <= i_B32(58);
o_ciphertext(79) <= i_B32(62);
o_ciphertext(80) <= i_B32(66);
o_ciphertext(81) <= i_B32(70);
o_ciphertext(82) <= i_B32(74);
o_ciphertext(83) <= i_B32(78);
o_ciphertext(84) <= i_B32(82);
o_ciphertext(85) <= i_B32(86);
o_ciphertext(86) <= i_B32(90);
o_ciphertext(87) <= i_B32(94);
o_ciphertext(88) <= i_B32(98);
o_ciphertext(89) <= i_B32(102);
o_ciphertext(90) <= i_B32(106);
o_ciphertext(91) <= i_B32(110);
o_ciphertext(92) <= i_B32(114);
o_ciphertext(93) <= i_B32(118);
o_ciphertext(94) <= i_B32(122);
o_ciphertext(95) <= i_B32(126);
o_ciphertext(96) <= i_B32(3);
o_ciphertext(97) <= i_B32(7);
o_ciphertext(98) <= i_B32(11);
o_ciphertext(99) <= i_B32(15);
o_ciphertext(100) <= i_B32(19);
o_ciphertext(101) <= i_B32(23);
o_ciphertext(102) <= i_B32(27);
o_ciphertext(103) <= i_B32(31);
o_ciphertext(104) <= i_B32(35);
o_ciphertext(105) <= i_B32(39);
o_ciphertext(106) <= i_B32(43);
o_ciphertext(107) <= i_B32(47);
o_ciphertext(108) <= i_B32(51);
o_ciphertext(109) <= i_B32(55);
o_ciphertext(110) <= i_B32(59);
o_ciphertext(111) <= i_B32(63);
o_ciphertext(112) <= i_B32(67);
o_ciphertext(113) <= i_B32(71);
o_ciphertext(114) <= i_B32(75);
o_ciphertext(115) <= i_B32(79);
o_ciphertext(116) <= i_B32(83);
o_ciphertext(117) <= i_B32(87);
o_ciphertext(118) <= i_B32(91);
o_ciphertext(119) <= i_B32(95);
o_ciphertext(120) <= i_B32(99);
o_ciphertext(121) <= i_B32(103);
o_ciphertext(122) <= i_B32(107);
o_ciphertext(123) <= i_B32(111);
o_ciphertext(124) <= i_B32(115);
o_ciphertext(125) <= i_B32(119);
o_ciphertext(126) <= i_B32(123);
o_ciphertext(127) <= i_B32(127);

end Behavioral;
