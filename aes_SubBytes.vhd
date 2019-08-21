LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity aes_SubBytes is port 
(
	data_in:		in		std_logic_vector(127 downto 0);
	data_out:	out	std_logic_vector(127 downto 0)
);
end aes_SubBytes;

architecture subBytes of aes_SubBytes is
	
	component aes_sBox is port 
	(
		byte_in:		in		std_logic_vector(7 downto 0);
		byte_out:	out	std_logic_vector(7 downto 0)
	);
	end component;
	
begin

	byte_0:	aes_sBox port map(data_in(127 downto 120), data_out(127 downto 120));
	byte_1:	aes_sBox port map(data_in(119 downto 112), data_out(119 downto 112));
	byte_2:	aes_sBox port map(data_in(111 downto 104), data_out(111 downto 104));
	byte_3:	aes_sBox port map(data_in(103 downto 96), data_out(103 downto 96));
	byte_4:	aes_sBox port map(data_in(95 downto 88), data_out(95 downto 88));
	byte_5:	aes_sBox port map(data_in(87 downto 80), data_out(87 downto 80));
	byte_6:	aes_sBox port map(data_in(79 downto 72), data_out(79 downto 72));
	byte_7:	aes_sBox port map(data_in(71 downto 64), data_out(71 downto 64));
	byte_8:	aes_sBox port map(data_in(63 downto 56), data_out(63 downto 56));
	byte_9:	aes_sBox port map(data_in(55 downto 48), data_out(55 downto 48));
	byte_10:	aes_sBox port map(data_in(47 downto 40), data_out(47 downto 40));
	byte_11:	aes_sBox port map(data_in(39 downto 32), data_out(39 downto 32));
	byte_12:	aes_sBox port map(data_in(31 downto 24), data_out(31 downto 24));
	byte_13:	aes_sBox port map(data_in(23 downto 16), data_out(23 downto 16));
	byte_14:	aes_sBox port map(data_in(15 downto 8), data_out(15 downto 8));
	byte_15:	aes_sBox port map(data_in(7 downto 0), data_out(7 downto 0));
	
end architecture;