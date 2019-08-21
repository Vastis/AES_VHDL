LIBRARY IEEE; 
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.NUMERIC_STD.ALL;

entity KeyScheduleTest is end entity;

architecture test of KeyScheduleTest is

	component aes_KeySchedule is port
	(
		last_key:	in		std_logic_vector(127 downto 0);
		rCon:			in		std_logic_vector(7 downto 0);
		round_key:	out	std_logic_vector(127 downto 0)
	);
	end component;
	
	signal clk 			:std_logic := '0';
	signal last_key 	:std_logic_vector(127 downto 0);
	signal rCon 		:std_logic_vector(7 downto 0) := x"00";
	signal round_key 	:std_logic_vector(127 downto 0);
	signal CLKp 		:time := 40 ns;
	
	signal init_key		:std_logic_vector(127 downto 0) := x"2b7e151628aed2a6abf7158809cf4f3c";
	signal key_after_1	:std_logic_vector(127 downto 0);
	signal key_after_2	:std_logic_vector(127 downto 0);
	signal key_after_3	:std_logic_vector(127 downto 0);
	signal key_after_4	:std_logic_vector(127 downto 0);
	signal key_after_5	:std_logic_vector(127 downto 0);
	signal key_after_6	:std_logic_vector(127 downto 0);
	signal key_after_7	:std_logic_vector(127 downto 0);
	signal key_after_8	:std_logic_vector(127 downto 0);
	signal key_after_9	:std_logic_vector(127 downto 0);
	signal key_after_10	:std_logic_vector(127 downto 0);
	
begin

	check: aes_KeySchedule port map(last_key, rCon, round_key);
	
	process
		begin
			clk <= '0'; wait for CLKp/2;
			clk <= '1'; wait for CLKp/2;
	end process;
	
	process
		begin
			
			last_key <= init_key; 	 rCon <= x"01"; wait for CLKp;		key_after_1  <= round_key; wait for CLKp;
			last_key <= key_after_1; rCon <= x"02"; wait for CLKp;		key_after_2  <= round_key; wait for CLKp;
			last_key <= key_after_2; rCon <= x"04"; wait for CLKp;		key_after_3  <= round_key; wait for CLKp;
			last_key <= key_after_3; rCon <= x"08"; wait for CLKp;		key_after_4  <= round_key; wait for CLKp;
			last_key <= key_after_4; rCon <= x"10"; wait for CLKp;		key_after_5  <= round_key; wait for CLKp;
			last_key <= key_after_5; rCon <= x"20"; wait for CLKp;		key_after_6  <= round_key; wait for CLKp;
			last_key <= key_after_6; rCon <= x"40"; wait for CLKp;		key_after_7  <= round_key; wait for CLKp;
			last_key <= key_after_7; rCon <= x"80"; wait for CLKp;		key_after_8  <= round_key; wait for CLKp;
			last_key <= key_after_8; rCon <= x"1b"; wait for CLKp;		key_after_9  <= round_key; wait for CLKp;
			last_key <= key_after_9; rCon <= x"36"; wait for CLKp;		key_after_10 <= round_key; wait for CLKp;
			
			wait;
	end process;
	
end architecture;