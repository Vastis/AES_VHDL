LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity aes_Final_Round is port 
(
	clk: 			in 	std_logic;
	data_in: 	in 	std_logic_vector(127 downto 0);
	prev_key:	in 	std_logic_vector(127 downto 0);
	r_con:		in		std_logic_vector(7 downto 0);
	data_out:	out 	std_logic_vector(127 downto 0)
);
end aes_Final_Round;

architecture aes of aes_Final_Round is

	signal after_SubBytes:		std_logic_vector(127 downto 0);
	signal after_ShiftRows:		std_logic_vector(127 downto 0);
	signal before_addRoundKey:	std_logic_vector(127 downto 0);
	signal round_key:				std_logic_vector(127 downto 0);
	signal after_addRoundKey:	std_logic_vector(127 downto 0);

begin

	aes_KeySchedule:	entity work.aes_KeySchedule	port map(prev_key, r_con, round_key);
	
	aes_SubBytes: 		entity work.aes_SubBytes 		port map(data_in, after_SubBytes);
	aes_ShiftRows:		entity work.aes_ShiftRows 		port map(after_SubBytes, after_ShiftRows);
	
	before_addRoundKey(127 downto 120)	<=	after_ShiftRows(127 downto 120);
	before_addRoundKey(119 downto 112)	<=	after_ShiftRows(95 downto 88);
	before_addRoundKey(111 downto 104)	<=	after_ShiftRows(63 downto 56);
	before_addRoundKey(103 downto 96)	<=	after_ShiftRows(31 downto 24);
	before_addRoundKey(95 downto 88)		<=	after_ShiftRows(71 downto 64);
	before_addRoundKey(87 downto 80)		<=	after_ShiftRows(39 downto 32);
	before_addRoundKey(79 downto 72)		<=	after_ShiftRows(7 downto 0);
	before_addRoundKey(71 downto 64)		<=	after_ShiftRows(103 downto 96);
	before_addRoundKey(63 downto 56)		<=	after_ShiftRows(47 downto 40);
	before_addRoundKey(55 downto 48)		<=	after_ShiftRows(15 downto 8);
	before_addRoundKey(47 downto 40)		<=	after_ShiftRows(111 downto 104);
	before_addRoundKey(39 downto 32)		<=	after_ShiftRows(79 downto 72);
	before_addRoundKey(31 downto 24)		<=	after_ShiftRows(23 downto 16);
	before_addRoundKey(23 downto 16)		<=	after_ShiftRows(119 downto 112);
	before_addRoundKey(15 downto 8)		<=	after_ShiftRows(87 downto 80);
	before_addRoundKey(7 downto 0)		<=	after_ShiftRows(55 downto 48);
	
	aes_AddRoundKey:	entity work.aes_AddRoundKey	port map(before_addRoundKey, round_key, after_addRoundKey);
	
	data_out <= after_addRoundKey;

end architecture;