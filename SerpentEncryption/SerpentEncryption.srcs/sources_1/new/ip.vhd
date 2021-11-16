----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2021 11:02:56 AM
-- Design Name: 
-- Module Name: ip - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ip is
    Port ( i_plaintext : in STD_LOGIC_VECTOR (127 downto 0);
           o_B0 : out STD_LOGIC_VECTOR (127 downto 0));
end ip;

architecture Behavioral of ip is

begin

-- Permutation initiale
o_B0(0) <= i_plaintext(0);
o_B0(1) <= i_plaintext(32);
o_B0(2) <= i_plaintext(64);
o_B0(3) <= i_plaintext(96);
o_B0(4) <= i_plaintext(1);
o_B0(5) <= i_plaintext(33);
o_B0(6) <= i_plaintext(65);
o_B0(7) <= i_plaintext(97);
o_B0(8) <= i_plaintext(2);
o_B0(9) <= i_plaintext(34);
o_B0(10) <= i_plaintext(66);
o_B0(11) <= i_plaintext(98);
o_B0(12) <= i_plaintext(3);
o_B0(13) <= i_plaintext(35);
o_B0(14) <= i_plaintext(67);
o_B0(15) <= i_plaintext(99);
o_B0(16) <= i_plaintext(4);
o_B0(17) <= i_plaintext(36);
o_B0(18) <= i_plaintext(68);
o_B0(19) <= i_plaintext(100);
o_B0(20) <= i_plaintext(5);
o_B0(21) <= i_plaintext(37);
o_B0(22) <= i_plaintext(69);
o_B0(23) <= i_plaintext(101);
o_B0(24) <= i_plaintext(6);
o_B0(25) <= i_plaintext(38);
o_B0(26) <= i_plaintext(70);
o_B0(27) <= i_plaintext(102);
o_B0(28) <= i_plaintext(7);
o_B0(29) <= i_plaintext(39);
o_B0(30) <= i_plaintext(71);
o_B0(31) <= i_plaintext(103);
o_B0(32) <= i_plaintext(8);
o_B0(33) <= i_plaintext(40);
o_B0(34) <= i_plaintext(72);
o_B0(35) <= i_plaintext(104);
o_B0(36) <= i_plaintext(9);
o_B0(37) <= i_plaintext(41);
o_B0(38) <= i_plaintext(73);
o_B0(39) <= i_plaintext(105);
o_B0(40) <= i_plaintext(10);
o_B0(41) <= i_plaintext(42);
o_B0(42) <= i_plaintext(74);
o_B0(43) <= i_plaintext(106);
o_B0(44) <= i_plaintext(11);
o_B0(45) <= i_plaintext(43);
o_B0(46) <= i_plaintext(75);
o_B0(47) <= i_plaintext(107);
o_B0(48) <= i_plaintext(12);
o_B0(49) <= i_plaintext(44);
o_B0(50) <= i_plaintext(76);
o_B0(51) <= i_plaintext(108);
o_B0(52) <= i_plaintext(13);
o_B0(53) <= i_plaintext(45);
o_B0(54) <= i_plaintext(77);
o_B0(55) <= i_plaintext(109);
o_B0(56) <= i_plaintext(14);
o_B0(57) <= i_plaintext(46);
o_B0(58) <= i_plaintext(78);
o_B0(59) <= i_plaintext(110);
o_B0(60) <= i_plaintext(15);
o_B0(61) <= i_plaintext(47);
o_B0(62) <= i_plaintext(79);
o_B0(63) <= i_plaintext(111);
o_B0(64) <= i_plaintext(16);
o_B0(65) <= i_plaintext(48);
o_B0(66) <= i_plaintext(80);
o_B0(67) <= i_plaintext(112);
o_B0(68) <= i_plaintext(17);
o_B0(69) <= i_plaintext(49);
o_B0(70) <= i_plaintext(81);
o_B0(71) <= i_plaintext(113);
o_B0(72) <= i_plaintext(18);
o_B0(73) <= i_plaintext(50);
o_B0(74) <= i_plaintext(82);
o_B0(75) <= i_plaintext(114);
o_B0(76) <= i_plaintext(19);
o_B0(77) <= i_plaintext(51);
o_B0(78) <= i_plaintext(83);
o_B0(79) <= i_plaintext(115);
o_B0(80) <= i_plaintext(20);
o_B0(81) <= i_plaintext(52);
o_B0(82) <= i_plaintext(84);
o_B0(83) <= i_plaintext(116);
o_B0(84) <= i_plaintext(21);
o_B0(85) <= i_plaintext(53);
o_B0(86) <= i_plaintext(85);
o_B0(87) <= i_plaintext(117);
o_B0(88) <= i_plaintext(22);
o_B0(89) <= i_plaintext(54);
o_B0(90) <= i_plaintext(86);
o_B0(91) <= i_plaintext(118);
o_B0(92) <= i_plaintext(23);
o_B0(93) <= i_plaintext(55);
o_B0(94) <= i_plaintext(87);
o_B0(95) <= i_plaintext(119);
o_B0(96) <= i_plaintext(24);
o_B0(97) <= i_plaintext(56);
o_B0(98) <= i_plaintext(88);
o_B0(99) <= i_plaintext(120);
o_B0(100) <= i_plaintext(25);
o_B0(101) <= i_plaintext(57);
o_B0(102) <= i_plaintext(89);
o_B0(103) <= i_plaintext(121);
o_B0(104) <= i_plaintext(26);
o_B0(105) <= i_plaintext(58);
o_B0(106) <= i_plaintext(90);
o_B0(107) <= i_plaintext(122);
o_B0(108) <= i_plaintext(27);
o_B0(109) <= i_plaintext(59);
o_B0(110) <= i_plaintext(91);
o_B0(111) <= i_plaintext(123);
o_B0(112) <= i_plaintext(28);
o_B0(113) <= i_plaintext(60);
o_B0(114) <= i_plaintext(92);
o_B0(115) <= i_plaintext(124);
o_B0(116) <= i_plaintext(29);
o_B0(117) <= i_plaintext(61);
o_B0(118) <= i_plaintext(93);
o_B0(119) <= i_plaintext(125);
o_B0(120) <= i_plaintext(30);
o_B0(121) <= i_plaintext(62);
o_B0(122) <= i_plaintext(94);
o_B0(123) <= i_plaintext(126);
o_B0(124) <= i_plaintext(31);
o_B0(125) <= i_plaintext(63);
o_B0(126) <= i_plaintext(95);
o_B0(127) <= i_plaintext(127);

end Behavioral;
