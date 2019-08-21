LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.NUMERIC_STD.ALL;

entity ShiftRowsTest is end entity;

architecture test of ShiftRowsTest is

	component aes_ShiftRows is port
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
	check: aes_ShiftRows port map(data_in, data_out);
	
	process
		begin
			clk <= '0'; wait for CLKp/2;
			clk <= '1'; wait for CLKp/2;
	end process;
	
	process
		begin
		
			data_in <= x"00000000000000000000000000000000"; wait for CLKp;
			data_in <= x"00000000111111112222222233333333"; wait for CLKp;
			data_in <= x"00112233001122330011223300112233"; wait for CLKp;
			
			wait;
	end process;
	
end architecture;