LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity aes_Encryption is port 
(
	clk: 			in 	std_logic;
	plaintext: 	in 	std_logic_vector(127 downto 0);
	key:			in 	std_logic_vector(127 downto 0);
	ciphertext:	out 	std_logic_vector(127 downto 0)
);
end aes_Encryption;

architecture aes of aes_Encryption is

	signal init_round_output: 	std_logic_vector(127 downto 0);
	
	type rCon_array is array(0 to 9) of std_logic_vector(7 downto 0);
	constant aes_r_con: rCon_array 
		:= (x"01", x"02", x"04", x"08", x"10", x"20", x"40", x"80", x"1b", x"36");
	
	signal r_con:					std_logic_vector(7 downto 0);

	signal input_text:			std_logic_vector(127 downto 0);
	signal output_text:			std_logic_vector(127 downto 0);
	signal prev_round_key:		std_logic_vector(127 downto 0);
	signal round_key:				std_logic_vector(127 downto 0);
	
	signal final_round_input:	std_logic_vector(127 downto 0);
	signal final_round_key:		std_logic_vector(127 downto 0);
	signal final_round_output:	std_logic_vector(127 downto 0);
	
	signal round_counter:		integer range 0 to 10;
	
	type aes_state is (IDLE, INIT_ROUND, FULL_ROUND, FINAL_ROUND, READY);
	signal state:	aes_state := IDLE;
	
begin

	aes_round:			entity work.aes_Round			port map(clk, input_text, prev_round_key, r_con, round_key, output_text);
	aes_finalRound:	entity work.aes_Final_Round	port map(clk, final_round_input, final_round_key, r_con, final_round_output);
	
	process(clk)
		begin
			if(clk'event and clk = '1') then
				case state is
					
					when IDLE =>
						round_counter <= 0;
					
					when INIT_ROUND =>
						input_text <= plaintext xor key;
						prev_round_key <= key;
						round_counter <= 1;
						r_con <= aes_r_con(round_counter);
					
					when FULL_ROUND =>
						prev_round_key <= round_key;
						input_text <= output_text;
						round_counter <= round_counter + 1;
						r_con <= aes_r_con(round_counter);
					
					when FINAL_ROUND =>
						r_con <= aes_r_con(round_counter);
						final_round_key <= round_key;
						final_round_input <= output_text;
					
					when READY =>
						ciphertext <= final_round_output;
					
				end case;
			end if;
	end process;
	
	process(clk)
		begin
			if(clk'event and clk = '1') then
			
				if (state = IDLE) then
					state <= INIT_ROUND;
				elsif (state = INIT_ROUND) then
					state <= FULL_ROUND;
				elsif (state = FULL_ROUND) then
					if (round_counter = 8) then
						state <= FINAL_ROUND;
					end if;
				elsif (state = FINAL_ROUND) then
					state <= READY;
				else
					state <= IDLE;
				end if;
				
			end if;
	end process;
	
end architecture;