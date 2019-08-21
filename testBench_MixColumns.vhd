LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.NUMERIC_STD.ALL;

entity MixColumnsTest is end entity;

architecture test of MixColumnsTest is

	component aes_MixColumns is port
	(
		data_in:		in		std_logic_vector(127 downto 0);
		data_out:	out	std_logic_vector(127 downto 0)
	);
	end component;
	
	signal clk :std_logic := '0';
	signal data_in :std_logic_vector(127 downto 0);
	signal data_out :std_logic_vector(127 downto 0);
	signal CLKp :time := 40 ns;
	
	begin
	check: aes_MixColumns port map(data_in, data_out);
	
	process
		begin
			clk <= '0'; wait for CLKp/2;
			clk <= '1'; wait for CLKp/2;
	end process;
	
	process
		begin
		
			data_in <= x"00000000000000000000000000000000"; wait for CLKp;
			data_in <= x"ffffffffffffffffffffffffffffffff"; wait for CLKp;
			data_in <= x"f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0"; wait for CLKp;
			data_in <= x"80000000800000008000000080000000"; wait for CLKp;
			
			wait;
	end process;
	
end architecture;