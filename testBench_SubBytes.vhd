LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.NUMERIC_STD.ALL;

entity SubBytesTest is end entity;

architecture test of SubBytesTest is

	component aes_SubBytes is port
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
	check: aes_SubBytes port map(data_in, data_out);
	
	process
		begin
			clk <= '0'; wait for CLKp/2;
			clk <= '1'; wait for CLKp/2;
	end process;
	
	process
		begin
			data_in <= x"000102030405060708090a0b0c0d0e0f"; wait for CLKp;
			data_in <= x"101112131415161718191a1b1c1d1e1f"; wait for CLKp;
			data_in <= x"202122232425262728292a2b2c2d2e2f"; wait for CLKp;
			data_in <= x"303132333435363738393a3b3c3d3e3f"; wait for CLKp;
			data_in <= x"404142434445464748494a4b4c4d4e4f"; wait for CLKp;
			data_in <= x"505152535455565758595a5b5c5d5e5f"; wait for CLKp;
			data_in <= x"606162636465666768696a6b6c6d6e6f"; wait for CLKp;
			data_in <= x"707172737475767778797a7b7c7d7e7f"; wait for CLKp;
			data_in <= x"808182838485868788898a8b8c8d8e8f"; wait for CLKp;
			data_in <= x"909192939495969798999a9b9c9d9e9f"; wait for CLKp;
			data_in <= x"a0a1a2a3a4a5a6a7a8a9aaabacadaeaf"; wait for CLKp;
			data_in <= x"b0b1b2b3b4b5b6b7b8b9babbbcbdbebf"; wait for CLKp;
			data_in <= x"c0c1c2c3c4c5c6c7c8c9cacbcccdcecf"; wait for CLKp;
			data_in <= x"d0d1d2d3d4d5d6d7d8d9dadbdcdddedf"; wait for CLKp;
			data_in <= x"e0e1e2e3e4e5e6e7e8e9eaebecedeeef"; wait for CLKp;
			data_in <= x"f0f1f2f3f4f5f6f7f8f9fafbfcfdfeff"; wait for CLKp;
			wait;
	end process;
	
end architecture;