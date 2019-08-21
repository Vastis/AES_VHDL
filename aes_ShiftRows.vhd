LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
LIBRARY work;

entity aes_ShiftRows is port
(
	
	data_in:		in		std_logic_vector(127 downto 0);
	data_out:	out	std_logic_vector(127 downto 0)
);
end aes_ShiftRows;

architecture shiftRows of aes_ShiftRows is
begin

	--first word
	data_out(127 downto 96) <= data_in(127 downto 96);
	--second word
	data_out(95 downto 88)	<=	data_in(87 downto 80);
	data_out(87 downto 80)	<=	data_in(79 downto 72);
	data_out(79 downto 72)	<=	data_in(71 downto 64);
	data_out(71 downto 64)	<=	data_in(95 downto 88);
	--third word
	data_out(63 downto 56)	<=	data_in(47 downto 40);
	data_out(55 downto 48)	<=	data_in(39 downto 32);
	data_out(47 downto 40)	<=	data_in(63 downto 56);
	data_out(39 downto 32)	<=	data_in(55 downto 48);
	--fourth word
	data_out(31 downto 24)	<=	data_in(7 downto 0);
	data_out(23 downto 16)	<=	data_in(31 downto 24);
	data_out(15 downto 8)	<=	data_in(23 downto 16);
	data_out(7 downto 0)		<=	data_in(15 downto 8);
	
end architecture;