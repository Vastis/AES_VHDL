LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity aes_Round is port 
(
	clk: 			in 	std_logic;
	data_in: 	in 	std_logic_vector(127 downto 0);
	prev_key:	in 	std_logic_vector(127 downto 0);
	r_con:		in		std_logic_vector(7 downto 0);
	next_key:	out	std_logic_vector(127 downto 0);
	data_out:	out 	std_logic_vector(127 downto 0)
);
end aes_Round;

architecture aes of aes_Round is

	signal after_SubBytes:		std_logic_vector(127 downto 0);
	signal after_ShiftRows:		std_logic_vector(127 downto 0);
	signal after_MixColumns:	std_logic_vector(127 downto 0);
	signal round_key:				std_logic_vector(127 downto 0);
	signal after_addRoundKey:	std_logic_vector(127 downto 0);

begin

	aes_KeySchedule:	entity work.aes_KeySchedule	port map(prev_key, r_con, round_key);
	
	aes_SubBytes: 		entity work.aes_SubBytes 		port map(data_in, after_SubBytes);
	aes_ShiftRows:		entity work.aes_ShiftRows 		port map(after_SubBytes, after_ShiftRows);
	aes_MixColumns:	entity work.aes_MixColumns 	port map(after_ShiftRows, after_MixColumns);
	aes_AddRoundKey:	entity work.aes_AddRoundKey	port map(after_MixColumns, round_key, after_addRoundKey);
	
	next_key <= round_key;
	data_out <= after_addRoundKey;

end architecture;