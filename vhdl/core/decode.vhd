----------------------------------------------------------------------------------
-- Company: WVU	
-- Engineer: --Student: Charles Dunn
-- 
-- Create Date:    12:05:36 11/21/2024 
-- Design Name: dECODER
-- Module Name:    decode - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Simple Decoder Module which takes in instructions from a register
-- and determines the appropiate operation to be perfomred from the first 3 alu op bits
-- the next 3 bits for the register with the D if needed, the next bit just for a flag 
-- for either high or low, the next 3 for the A register and 3 after that for the B register
-- or those 6 bits plus the 2 remaing for an 8 bit value needing to be jumped
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decode is
    Port ( I_clk : in  STD_LOGIC;
           I_dataInst : in  STD_LOGIC_VECTOR (15 downto 0);
           I_en : in  STD_LOGIC;
           O_selA : out  STD_LOGIC_VECTOR (2 downto 0);
           O_selB : out  STD_LOGIC_VECTOR (2 downto 0);
           O_selD : out  STD_LOGIC_VECTOR (2 downto 0);
           O_dataIMM : out  STD_LOGIC_VECTOR (15 downto 0);
           O_regDwe : out  STD_LOGIC;
           O_aluop : out  STD_LOGIC_VECTOR (4 downto 0));
end decode;

architecture Behavioral of decode is

begin

process (I_clk)
begin
	if rising_edge(I_clk) and I_en ='1' then
		
		O_selA <= I_dataInst(7 downto 5);
		O_selB <= I_dataInst(4 downto 2);
		O_selD <= I_dataInst(11 downto 9);
		O_dataIMM <= I_dataInst(7 downto 0) & I_dataInst(7 downto 0);
		O_aluop <= I_dataInst(15 downto 12) & I_dataInst(8);
		
		case I_dataInst(15 downto 12) is
			when "0111" => -- WRITE
				O_regDwe <= '0';
			when "1100" => -- JUMP
				O_regDwe <= '0';
			when "1101" => --JUMPEQ
				O_regDwe <= '0';
			when others =>
				O_regDwe <= '1';
		end case;
	end if;
end process;
		

end Behavioral;

