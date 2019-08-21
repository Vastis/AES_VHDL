LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.NUMERIC_STD.ALL;

entity aesTest is end entity;

architecture test of aesTest is

	component aes_Encryption is port
	(
		clk: 			in 	std_logic;
		plaintext: 	in 	std_logic_vector(127 downto 0);
		key:			in 	std_logic_vector(127 downto 0);
		ciphertext:	out 	std_logic_vector(127 downto 0)
	);
	end component;
	
	signal clk 			:std_logic := '0';
	signal plaintext 	:std_logic_vector(127 downto 0);
	signal key 			:std_logic_vector(127 downto 0);
	signal ciphertext :std_logic_vector(127 downto 0);
	
	signal CLKp 		:time := 40 ns;
	
	signal output	 	:std_logic_vector(127 downto 0);
	signal result	 	:std_logic_vector(127 downto 0);
	
begin

	check: aes_Encryption port map(clk, plaintext, key, output);
	
	process
		begin
			clk <= '0'; wait for CLKp/2;
			clk <= '1'; wait for CLKp/2;
	end process;
	
	process
		begin
		
			plaintext 	<= x"3243f6a8885a308d313198a2e0370734";
			key 			<= x"2b7e151628aed2a6abf7158809cf4f3c";
			
			wait for 12*CLKp;
			ciphertext <= output;
			plaintext 	<= x"90985d6a58c8786457c941e39b7f8980";
			key 			<= x"019698c98a09b097e1124afc0987bb98";
			result 		<= x"3925841d02dc09fbdc118597196a0b32";	
			
			wait for 12*CLKp;
			ciphertext <= output;
			plaintext 	<= x"3243f6a8885a308d313198a2e0370734";
			key 			<= x"2b7e151628aed2a6abf7158809cf4f3c"; 
			result 		<= x"7b77eca66f215ccd6eb675d07669c588";
			
			wait for 12*CLKp;
			ciphertext <= output;
			plaintext 	<= x"90985d6a58c8786457c941e39b7f8980";
			key 			<= x"019698c98a09b097e1124afc0987bb98"; 
			result 		<= x"3925841d02dc09fbdc118597196a0b32";
			
			wait for 12*CLKp;
			ciphertext <= output;
			plaintext 	<= x"3243f6a8885a308d313198a2e0370734";
			key 			<= x"2b7e151628aed2a6abf7158809cf4f3c";
			result 		<= x"7b77eca66f215ccd6eb675d07669c588";
			
			wait for 12*CLKp;
			ciphertext <= output;
			plaintext 	<= x"90985d6a58c8786457c941e39b7f8980";
			key 			<= x"019698c98a09b097e1124afc0987bb98"; 
			result 		<= x"3925841d02dc09fbdc118597196a0b32";
			
			wait for 23*CLKp;
			ciphertext <= output;
			plaintext 	<= x"3243f6a8885a308d313198a2e0370734";
			key 			<= x"2b7e151628aed2a6abf7158809cf4f3c"; 
			result 		<= x"7b77eca66f215ccd6eb675d07669c588";
			
			wait for 13*CLKp;
			ciphertext <= output;
			
			wait for 2*CLKp;
			plaintext 	<= x"90985d6a58c8786457c941e39b7f8980";
			key 			<= x"019698c98a09b097e1124afc0987bb98"; 
			result 		<= x"3925841d02dc09fbdc118597196a0b32";
			
			wait for 23*CLKp;
			ciphertext <= output;
			
			wait;
	end process;
	
end architecture;