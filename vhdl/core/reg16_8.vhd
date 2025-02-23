----------------------------------------------------------------------------------
-- Company: WVU
-- Engineer: -Student: Charles Dunn
-- 
-- Create Date:    16:21:42 11/20/2024 
-- Design Name: 
-- Module Name:    reg16_8 - Behavioral 
-- Project Name: The 16 bit TPU
-- Target Devices: Spartan ^ FPGA
-- Tool versions: 
-- Description: A little primitive FPGA project of a shitty 16 bit CPU
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg16_8 is
    Port ( I_clk : in  STD_LOGIC;
           I_en : in  STD_LOGIC;
           I_dataD : in  STD_LOGIC_VECTOR (15 downto 0);
           O_dataA : out  STD_LOGIC_VECTOR (15 downto 0);
           O_dataB : out  STD_LOGIC_VECTOR (15 downto 0);
           I_selA : in  STD_LOGIC_VECTOR (2 downto 0);
           I_selB : in  STD_LOGIC_VECTOR (2 downto 0);
           --I_selC : in  STD_LOGIC_VECTOR (2 downto 0);
           I_selD : in  STD_LOGIC_VECTOR (2 downto 0);
           I_we : in  STD_LOGIC);
end reg16_8;

architecture Behavioral of reg16_8 is
	type store_t is array (0 to 7) of std_logic_vector(15 downto 0);
	signal regs: store_t := (others => X"0000");
begin
	process(I_clk)
	begin
		if rising_edge(I_clk) and I_en='1' then
		-- do the stuff we need to do
		O_dataA <= regs(to_integer(unsigned(I_selA)));
		O_dataB <= regs(to_integer(unsigned(I_selB)));
		if (I_we = '1') then
			regs(to_integer(unsigned(I_selD))) <= I_dataD;
		end if;
		
		end if;
	end process;
end Behavioral;

