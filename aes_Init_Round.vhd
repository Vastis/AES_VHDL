LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity aes_Init_Round is port 
(
	clk: 			in 	std_logic;
	data_in: 	in 	std_logic_vector(127 downto 0);
	key:			in 	std_logic_vector(127 downto 0);
	data_out:	out 	std_logic_vector(127 downto 0)
);
end aes_Init_Round;

architecture aes of aes_Init_Round is
begin

	aes_AddRoundKey:	entity work.aes_AddRoundKey	port map(data_in, key, data_out);

end architecture;