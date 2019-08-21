LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
LIBRARY work;

entity aes_multiplication is port
(
	--first word (state row) is not rotated
	data_in:		in		std_logic_vector(31 downto 0);
	data_out:	out	std_logic_vector(31 downto 0)
);
end aes_multiplication;

architecture multiplication of aes_multiplication is

	signal 	byte_0: 	std_logic_vector(7 downto 0);
	signal 	byte_1: 	std_logic_vector(7 downto 0); 
	signal 	byte_2: 	std_logic_vector(7 downto 0); 
	signal 	byte_3: 	std_logic_vector(7 downto 0); 
	
	signal 	factor_0_2: 	std_logic_vector(7 downto 0);
	signal 	factor_0_3: 	std_logic_vector(7 downto 0);
	signal 	factor_1_2: 	std_logic_vector(7 downto 0);
	signal 	factor_1_3: 	std_logic_vector(7 downto 0);
	signal 	factor_2_2: 	std_logic_vector(7 downto 0);
	signal 	factor_2_3: 	std_logic_vector(7 downto 0);
	signal 	factor_3_2: 	std_logic_vector(7 downto 0);
	signal 	factor_3_3: 	std_logic_vector(7 downto 0);
	
begin

	byte_0 <= data_in(31 downto 24);
	byte_1 <= data_in(23 downto 16);
	byte_2 <= data_in(15 downto 8);
	byte_3 <= data_in(7 downto 0);

	factor_0_2 <= 
		byte_0(6 downto 0) & '0' when byte_0(7) = '0' else
		(byte_0(6 downto 0) & '0') xor x"1b";
	factor_0_3 <= factor_0_2 xor byte_0;
	
	factor_1_2 <= 
		byte_1(6 downto 0) & '0' when byte_1(7) = '0' else
		(byte_1(6 downto 0) & '0') xor x"1b";
	factor_1_3 <= factor_1_2 xor byte_1;
	
	factor_2_2 <= 
		byte_2(6 downto 0) & '0' when byte_2(7) = '0' else
		(byte_2(6 downto 0) & '0') xor x"1b";
	factor_2_3 <= factor_2_2 xor byte_2;
	
	factor_3_2 <= 
		byte_3(6 downto 0) & '0' when byte_3(7) = '0' else
		(byte_3(6 downto 0) & '0') xor x"1b";
	factor_3_3 <= factor_3_2 xor byte_3;
	
	data_out(31 downto 24)	<= factor_0_2 	xor factor_1_3 xor byte_2 		xor byte_3;
	data_out(23 downto 16) 	<= byte_0 		xor factor_1_2 xor factor_2_3 xor byte_3;
	data_out(15 downto 8) 	<= byte_0 		xor byte_1 		xor factor_2_2 xor factor_3_3;
	data_out(7 downto 0) 	<= factor_0_3 	xor byte_1 		xor byte_2 		xor factor_3_2;
	
end architecture;