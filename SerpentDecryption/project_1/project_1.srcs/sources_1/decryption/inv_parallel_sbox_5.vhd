library IEEE;
library inv_sbox;
use IEEE.STD_LOGIC_1164.ALL;
use inv_sbox.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity inv_parallel_sbox_5 is
    Port ( i_para_box_data : in STD_LOGIC_VECTOR (127 downto 0);
           o_para_box_data : out STD_LOGIC_VECTOR (127 downto 0));
end inv_parallel_sbox_5;

architecture Behavioral of inv_parallel_sbox_5 is

begin

gen_inv_parallel_sbox5 : for i in 0 to 31 generate

parabox5 : entity inv_sbox.inv_sbox_5
    Port Map( i_data => i_para_box_data(127-(4*i) downto 124-(4*i)),
           o_data => o_para_box_data(127-(4*i) downto 124-(4*i)));
           
end generate gen_inv_parallel_sbox5;

end Behavioral;