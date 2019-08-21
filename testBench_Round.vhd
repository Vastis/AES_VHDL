LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.NUMERIC_STD.ALL;

entity RoundTest is end entity;

architecture test of RoundTest is

	component aes_Round is port
	(
		clk: 			in 	std_logic;
		data_in: 	in 	std_logic_vector(127 downto 0);
		prev_key:	in 	std_logic_vector(127 downto 0);
		r_con:		in		std_logic_vector(7 downto 0);
		next_key:	out	std_logic_vector(127 downto 0);
		data_out:	out 	std_logic_vector(127 downto 0)
	);
	end component;
	
	signal clk 			:std_logic := '0';
	signal data_in 	:std_logic_vector(127 downto 0);
	signal prev_key	:std_logic_vector(127 downto 0);
	signal r_con		:std_logic_vector(7 downto 0) := x"00";
	signal next_key 	:std_logic_vector(127 downto 0);
	signal data_out 	:std_logic_vector(127 downto 0);
	
	signal CLKp 				:time := 40 ns;
	
	signal init_key 			:std_logic_vector(127 downto 0) := x"2b7e151628aed2a6abf7158809cf4f3c";
	signal key_after_1		:std_logic_vector(127 downto 0);
	signal key_after_2		:std_logic_vector(127 downto 0);
	signal key_after_3		:std_logic_vector(127 downto 0);
	signal key_after_4		:std_logic_vector(127 downto 0);
	signal key_after_5		:std_logic_vector(127 downto 0);
	signal key_after_6		:std_logic_vector(127 downto 0);
	signal key_after_7		:std_logic_vector(127 downto 0);
	signal key_after_8		:std_logic_vector(127 downto 0);
	signal key_after_9		:std_logic_vector(127 downto 0);
	
	signal init_message		:std_logic_vector(127 downto 0) := x"193de3bea0f4e22b9ac68d2ae9f84808";
	signal message_after_1	:std_logic_vector(127 downto 0);
	signal message_after_2	:std_logic_vector(127 downto 0);
	signal message_after_3	:std_logic_vector(127 downto 0);
	signal message_after_4	:std_logic_vector(127 downto 0);
	signal message_after_5	:std_logic_vector(127 downto 0);
	signal message_after_6	:std_logic_vector(127 downto 0);
	signal message_after_7	:std_logic_vector(127 downto 0);
	signal message_after_8	:std_logic_vector(127 downto 0);
	signal message_after_9	:std_logic_vector(127 downto 0);
	
begin

	check: aes_Round port map(clk, data_in, prev_key, r_con, next_key, data_out);
	
	process
		begin
			clk <= '0'; wait for CLKp/2;
			clk <= '1'; wait for CLKp/2;
	end process;
	
	process
		begin
		
			prev_key <= init_key; data_in <= init_message; r_con <= x"01"; 
			wait for CLKp;		
				key_after_1  <= next_key; message_after_1	<= data_out; 
				wait for CLKp;
			prev_key <= key_after_1; data_in <= message_after_1; r_con <= x"02"; 
			wait for CLKp;		
				key_after_2  <= next_key; message_after_2	<= data_out; 
				wait for CLKp;
			prev_key <= key_after_2; data_in <= message_after_2; r_con <= x"04"; 
			wait for CLKp;		
				key_after_3  <= next_key; message_after_3	<= data_out; 
				wait for CLKp;
			prev_key <= key_after_3; data_in <= message_after_3; r_con <= x"08"; 
			wait for CLKp;		
				key_after_4  <= next_key; message_after_4	<= data_out; 
				wait for CLKp;
			prev_key <= key_after_4; data_in <= message_after_4; r_con <= x"10"; 
			wait for CLKp;		
				key_after_5  <= next_key; message_after_5	<= data_out; 
				wait for CLKp;
			prev_key <= key_after_5; data_in <= message_after_5; r_con <= x"20"; 
			wait for CLKp;		
				key_after_6  <= next_key; message_after_6	<= data_out; 
				wait for CLKp;
			prev_key <= key_after_6; data_in <= message_after_6; r_con <= x"40"; 
			wait for CLKp;		
				key_after_7  <= next_key; message_after_7	<= data_out; 
				wait for CLKp;
			prev_key <= key_after_7; data_in <= message_after_7; r_con <= x"80"; 
			wait for CLKp;		
				key_after_8  <= next_key; message_after_8	<= data_out; 
				wait for CLKp;
			prev_key <= key_after_8; data_in <= message_after_8; r_con <= x"1b"; 
			wait for CLKp;		
				key_after_9  <= next_key; message_after_9	<= data_out; 
				wait for CLKp;
			
			wait;
	end process;
	
end architecture;