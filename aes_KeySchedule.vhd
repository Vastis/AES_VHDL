LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity aes_KeySchedule is port
(
	last_key:	in		std_logic_vector(127 downto 0);
	rCon:			in		std_logic_vector(7 downto 0);
	round_key:	out	std_logic_vector(127 downto 0)
);
end aes_KeySchedule;

architecture keySchedule of aes_KeySchedule is

	signal temp_0: 			std_logic_vector(31 downto 0);
	signal temp_1: 			std_logic_vector(31 downto 0);
	signal temp_2: 			std_logic_vector(31 downto 0);
	signal temp_3:				std_logic_vector(31 downto 0);
	
	signal after_subWord_0: std_logic_vector(31 downto 0);
	signal after_subWord_1: std_logic_vector(31 downto 0);
	signal after_subWord_2: std_logic_vector(31 downto 0);
	signal after_subWord_3: std_logic_vector(31 downto 0);
	
	signal new_Word_0:		std_logic_vector(31 downto 0);
	signal new_Word_1:		std_logic_vector(31 downto 0);
	signal new_Word_2:		std_logic_vector(31 downto 0);
	signal new_Word_3:		std_logic_vector(31 downto 0);
	
begin
	
	temp_0 <= last_key(31 downto 0);
	sBoxed_4i_0: entity work.aes_sBox port map(temp_0(23 downto 16), after_subWord_0(31 downto 24));
	sBoxed_4i_1: entity work.aes_sBox port map(temp_0(15 downto 8), after_subWord_0(23 downto 16));
	sBoxed_4i_2: entity work.aes_sBox port map(temp_0(7 downto 0), after_subWord_0(15 downto 8));
	sBoxed_4i_3: entity work.aes_sBox port map(temp_0(31 downto 24), after_subWord_0(7 downto 0));
	new_Word_0 <= after_subWord_0 xor last_key(127 downto 96) xor (rCon & x"000000");

	temp_1 <= new_Word_0;
	new_Word_1 <= temp_1 xor last_key(95 downto 64);
	
	temp_2 <= new_Word_1;
	new_Word_2 <= temp_2 xor last_key(63 downto 32);
	
	temp_3 <= new_Word_2;
	new_Word_3 <= temp_3 xor last_key(31 downto 0);
	
	round_key <= new_Word_0 & new_Word_1 & new_Word_2 & new_Word_3;
	
end architecture;