LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity aes_MixColumns is port
(
	data_in:		in		std_logic_vector(127 downto 0);
	data_out:	out	std_logic_vector(127 downto 0)
);
end aes_MixColumns;

architecture mixColumns of aes_MixColumns is

	signal 	column_0: 	std_logic_vector(31 downto 0);
	signal 	column_1: 	std_logic_vector(31 downto 0); 
	signal 	column_2: 	std_logic_vector(31 downto 0); 
	signal 	column_3: 	std_logic_vector(31 downto 0); 
	
	signal 	column_0_after: 	std_logic_vector(31 downto 0);
	signal 	column_1_after: 	std_logic_vector(31 downto 0); 
	signal 	column_2_after: 	std_logic_vector(31 downto 0); 
	signal 	column_3_after: 	std_logic_vector(31 downto 0); 	
	
begin
	
	column_0 <= data_in(127 downto 120) & data_in(95 downto 88) & data_in(63 downto 56) & data_in(31 downto 24);
	column_1 <= data_in(119 downto 112) & data_in(87 downto 80) & data_in(55 downto 48) & data_in(23 downto 16);
	column_2 <= data_in(111 downto 104) & data_in(79 downto 72) & data_in(47 downto 40) & data_in(15 downto 8);
	column_3 <= data_in(103 downto 96) & data_in(71 downto 64) & data_in(39 downto 32) & data_in(7 downto 0);

	mulCol0: entity work.aes_multiplication port map(column_0, column_0_after);
	mulCol1: entity work.aes_multiplication port map(column_1, column_1_after);
	mulCol2: entity work.aes_multiplication port map(column_2, column_2_after);
	mulCol3: entity work.aes_multiplication port map(column_3, column_3_after);
	
	data_out(127 downto 96) <= column_0_after(31 downto 24)	& column_0_after(23 downto 16) 	& 
											column_0_after(15 downto 8)	& column_0_after(7 downto 0)	;
	data_out(95 downto 64) 	<= column_3_after(23 downto 16)	& column_3_after(15 downto 8) 	& 
											column_3_after(7 downto 0)		& column_3_after(31 downto 24);
	data_out(63 downto 32) 	<= column_2_after(15 downto 8)	& column_2_after(7 downto 0)		& 
											column_2_after(31 downto 24)	& column_2_after(23 downto 16);
	data_out(31 downto 0) 	<= column_1_after(7 downto 0)		& column_1_after(31 downto 24)	& 
											column_1_after(23 downto 16)	& column_1_after(15 downto 8)	;
											
	
end architecture;