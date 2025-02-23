--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:02:12 12/02/2024
-- Design Name:   
-- Module Name:   C:/Users/chuck/OneDrive/Documents/Work/TheTPU/ram_tb.vhd
-- Project Name:  TheTPU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ram16
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ram_tb IS
 Port ( I_clk : in  STD_LOGIC;
           I_we : in  STD_LOGIC;
           I_addr : in  STD_LOGIC_VECTOR (15 downto 0);
           I_data : in  STD_LOGIC_VECTOR (15 downto 0);
           O_data : out  STD_LOGIC_VECTOR (15 downto 0));
END ram_tb;
 
ARCHITECTURE behavior OF ram_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ram16
    PORT(
         I_clk : IN  std_logic;
         I_we : IN  std_logic;
         I_addr : IN  std_logic_vector(15 downto 0);
         I_data : IN  std_logic_vector(15 downto 0);
         O_data : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_clk : std_logic := '0';
   signal I_we : std_logic := '0';
   signal I_addr : std_logic_vector(15 downto 0) := (others => '0');
   signal I_data : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal O_data : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant I_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ram16 PORT MAP (
          I_clk => I_clk,
          I_we => I_we,
          I_addr => I_addr,
          I_data => I_data,
          O_data => O_data
        );

   -- Clock process definitions
   I_clk_process :process
   begin
		I_clk <= '0';
		wait for I_clk_period/2;
		I_clk <= '1';
		wait for I_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for I_clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
