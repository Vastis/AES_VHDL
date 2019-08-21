LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity aes_AddRoundKey is port
(
	data_in:		in		std_logic_vector(127 downto 0);
	round_key:	in		std_logic_vector(127 downto 0);
	data_out:	out	std_logic_vector(127 downto 0)
);
end aes_AddRoundKey;

architecture addRoundKey of aes_AddRoundKey is
begin
	
	data_out <= data_in xor round_key;
	
end architecture;