LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
LIBRARY work;

entity aes_sBox is port 
(
	byte_in:		in		std_logic_vector(7 downto 0);
	byte_out:	out	std_logic_vector(7 downto 0)
);
end aes_sBox;

architecture sBox of aes_sBox is
begin

		byte_out <= x"63" when byte_in = x"00" else
			x"7c" when byte_in = x"01" else
			x"77" when byte_in = x"02" else
			x"7b" when byte_in = x"03" else
			x"f2" when byte_in = x"04" else
			x"6b" when byte_in = x"05" else
			x"6f" when byte_in = x"06" else
			x"c5" when byte_in = x"07" else
			x"30" when byte_in = x"08" else
			x"01" when byte_in = x"09" else
			x"67" when byte_in = x"0a" else
			x"2b" when byte_in = x"0b" else
			x"fe" when byte_in = x"0c" else
			x"d7" when byte_in = x"0d" else
			x"ab" when byte_in = x"0e" else
			x"76" when byte_in = x"0f" else
			x"ca" when byte_in = x"10" else
			x"82" when byte_in = x"11" else
			x"c9" when byte_in = x"12" else
			x"7d" when byte_in = x"13" else
			x"fa" when byte_in = x"14" else
			x"59" when byte_in = x"15" else
			x"47" when byte_in = x"16" else
			x"f0" when byte_in = x"17" else
			x"ad" when byte_in = x"18" else
			x"d4" when byte_in = x"19" else
			x"a2" when byte_in = x"1a" else
			x"af" when byte_in = x"1b" else
			x"9c" when byte_in = x"1c" else
			x"a4" when byte_in = x"1d" else
			x"72" when byte_in = x"1e" else
			x"c0" when byte_in = x"1f" else
			x"b7" when byte_in = x"20" else
			x"fd" when byte_in = x"21" else
			x"93" when byte_in = x"22" else
			x"26" when byte_in = x"23" else
			x"36" when byte_in = x"24" else
			x"3f" when byte_in = x"25" else
			x"f7" when byte_in = x"26" else
			x"cc" when byte_in = x"27" else
			x"34" when byte_in = x"28" else
			x"a5" when byte_in = x"29" else
			x"e5" when byte_in = x"2a" else
			x"f1" when byte_in = x"2b" else
			x"71" when byte_in = x"2c" else
			x"d8" when byte_in = x"2d" else
			x"31" when byte_in = x"2e" else
			x"15" when byte_in = x"2f" else
			x"04" when byte_in = x"30" else
			x"c7" when byte_in = x"31" else
			x"23" when byte_in = x"32" else
			x"c3" when byte_in = x"33" else
			x"18" when byte_in = x"34" else
			x"96" when byte_in = x"35" else
			x"05" when byte_in = x"36" else
			x"9a" when byte_in = x"37" else
			x"07" when byte_in = x"38" else
			x"12" when byte_in = x"39" else
			x"80" when byte_in = x"3a" else
			x"e2" when byte_in = x"3b" else
			x"eb" when byte_in = x"3c" else
			x"27" when byte_in = x"3d" else
			x"b2" when byte_in = x"3e" else
			x"75" when byte_in = x"3f" else
			x"09" when byte_in = x"40" else
			x"83" when byte_in = x"41" else
			x"2c" when byte_in = x"42" else
			x"1a" when byte_in = x"43" else
			x"1b" when byte_in = x"44" else
			x"6e" when byte_in = x"45" else
			x"5a" when byte_in = x"46" else
			x"a0" when byte_in = x"47" else
			x"52" when byte_in = x"48" else
			x"3b" when byte_in = x"49" else
			x"d6" when byte_in = x"4a" else
			x"b3" when byte_in = x"4b" else
			x"29" when byte_in = x"4c" else
			x"e3" when byte_in = x"4d" else
			x"2f" when byte_in = x"4e" else
			x"84" when byte_in = x"4f" else
			x"53" when byte_in = x"50" else
			x"d1" when byte_in = x"51" else
			x"00" when byte_in = x"52" else
			x"ed" when byte_in = x"53" else
			x"20" when byte_in = x"54" else
			x"fc" when byte_in = x"55" else
			x"b1" when byte_in = x"56" else
			x"5b" when byte_in = x"57" else
			x"6a" when byte_in = x"58" else
			x"cb" when byte_in = x"59" else
			x"be" when byte_in = x"5a" else
			x"39" when byte_in = x"5b" else
			x"4a" when byte_in = x"5c" else
			x"4c" when byte_in = x"5d" else
			x"58" when byte_in = x"5e" else
			x"cf" when byte_in = x"5f" else
			x"d0" when byte_in = x"60" else
			x"ef" when byte_in = x"61" else
			x"aa" when byte_in = x"62" else
			x"fb" when byte_in = x"63" else
			x"43" when byte_in = x"64" else
			x"4d" when byte_in = x"65" else
			x"33" when byte_in = x"66" else
			x"85" when byte_in = x"67" else
			x"45" when byte_in = x"68" else
			x"f9" when byte_in = x"69" else
			x"02" when byte_in = x"6a" else
			x"7f" when byte_in = x"6b" else
			x"50" when byte_in = x"6c" else
			x"3c" when byte_in = x"6d" else
			x"9f" when byte_in = x"6e" else
			x"a8" when byte_in = x"6f" else
			x"51" when byte_in = x"70" else
			x"a3" when byte_in = x"71" else
			x"40" when byte_in = x"72" else
			x"8f" when byte_in = x"73" else
			x"92" when byte_in = x"74" else
			x"9d" when byte_in = x"75" else
			x"38" when byte_in = x"76" else
			x"f5" when byte_in = x"77" else
			x"bc" when byte_in = x"78" else
			x"b6" when byte_in = x"79" else
			x"da" when byte_in = x"7a" else
			x"21" when byte_in = x"7b" else
			x"10" when byte_in = x"7c" else
			x"ff" when byte_in = x"7d" else
			x"f3" when byte_in = x"7e" else
			x"d2" when byte_in = x"7f" else
			x"cd" when byte_in = x"80" else
			x"0c" when byte_in = x"81" else
			x"13" when byte_in = x"82" else
			x"ec" when byte_in = x"83" else
			x"5f" when byte_in = x"84" else
			x"97" when byte_in = x"85" else
			x"44" when byte_in = x"86" else
			x"17" when byte_in = x"87" else
			x"c4" when byte_in = x"88" else
			x"a7" when byte_in = x"89" else
			x"7e" when byte_in = x"8a" else
			x"3d" when byte_in = x"8b" else
			x"64" when byte_in = x"8c" else
			x"5d" when byte_in = x"8d" else
			x"19" when byte_in = x"8e" else
			x"73" when byte_in = x"8f" else
			x"60" when byte_in = x"90" else
			x"81" when byte_in = x"91" else
			x"4f" when byte_in = x"92" else
			x"dc" when byte_in = x"93" else
			x"22" when byte_in = x"94" else
			x"2a" when byte_in = x"95" else
			x"90" when byte_in = x"96" else
			x"88" when byte_in = x"97" else
			x"46" when byte_in = x"98" else
			x"ee" when byte_in = x"99" else
			x"b8" when byte_in = x"9a" else
			x"14" when byte_in = x"9b" else
			x"de" when byte_in = x"9c" else
			x"5e" when byte_in = x"9d" else
			x"0b" when byte_in = x"9e" else
			x"db" when byte_in = x"9f" else
			x"e0" when byte_in = x"a0" else
			x"32" when byte_in = x"a1" else
			x"3a" when byte_in = x"a2" else
			x"0a" when byte_in = x"a3" else
			x"49" when byte_in = x"a4" else
			x"06" when byte_in = x"a5" else
			x"24" when byte_in = x"a6" else
			x"5c" when byte_in = x"a7" else
			x"c2" when byte_in = x"a8" else
			x"d3" when byte_in = x"a9" else
			x"ac" when byte_in = x"aa" else
			x"62" when byte_in = x"ab" else
			x"91" when byte_in = x"ac" else
			x"95" when byte_in = x"ad" else
			x"e4" when byte_in = x"ae" else
			x"79" when byte_in = x"af" else
			x"e7" when byte_in = x"b0" else
			x"c8" when byte_in = x"b1" else
			x"37" when byte_in = x"b2" else
			x"6d" when byte_in = x"b3" else
			x"8d" when byte_in = x"b4" else
			x"d5" when byte_in = x"b5" else
			x"4e" when byte_in = x"b6" else
			x"a9" when byte_in = x"b7" else
			x"6c" when byte_in = x"b8" else
			x"56" when byte_in = x"b9" else
			x"f4" when byte_in = x"ba" else
			x"ea" when byte_in = x"bb" else
			x"65" when byte_in = x"bc" else
			x"7a" when byte_in = x"bd" else
			x"ae" when byte_in = x"be" else
			x"08" when byte_in = x"bf" else
			x"ba" when byte_in = x"c0" else
			x"78" when byte_in = x"c1" else
			x"25" when byte_in = x"c2" else
			x"2e" when byte_in = x"c3" else
			x"1c" when byte_in = x"c4" else
			x"a6" when byte_in = x"c5" else
			x"b4" when byte_in = x"c6" else
			x"c6" when byte_in = x"c7" else
			x"e8" when byte_in = x"c8" else
			x"dd" when byte_in = x"c9" else
			x"74" when byte_in = x"ca" else
			x"1f" when byte_in = x"cb" else
			x"4b" when byte_in = x"cc" else
			x"bd" when byte_in = x"cd" else
			x"8b" when byte_in = x"ce" else
			x"8a" when byte_in = x"cf" else
			x"70" when byte_in = x"d0" else
			x"3e" when byte_in = x"d1" else
			x"b5" when byte_in = x"d2" else
			x"66" when byte_in = x"d3" else
			x"48" when byte_in = x"d4" else
			x"03" when byte_in = x"d5" else
			x"f6" when byte_in = x"d6" else
			x"0e" when byte_in = x"d7" else
			x"61" when byte_in = x"d8" else
			x"35" when byte_in = x"d9" else
			x"57" when byte_in = x"da" else
			x"b9" when byte_in = x"db" else
			x"86" when byte_in = x"dc" else
			x"c1" when byte_in = x"dd" else
			x"1d" when byte_in = x"de" else
			x"9e" when byte_in = x"df" else
			x"e1" when byte_in = x"e0" else
			x"f8" when byte_in = x"e1" else
			x"98" when byte_in = x"e2" else
			x"11" when byte_in = x"e3" else
			x"69" when byte_in = x"e4" else
			x"d9" when byte_in = x"e5" else
			x"8e" when byte_in = x"e6" else
			x"94" when byte_in = x"e7" else
			x"9b" when byte_in = x"e8" else
			x"1e" when byte_in = x"e9" else
			x"87" when byte_in = x"ea" else
			x"e9" when byte_in = x"eb" else
			x"ce" when byte_in = x"ec" else
			x"55" when byte_in = x"ed" else
			x"28" when byte_in = x"ee" else
			x"df" when byte_in = x"ef" else
			x"8c" when byte_in = x"f0" else
			x"a1" when byte_in = x"f1" else
			x"89" when byte_in = x"f2" else
			x"0d" when byte_in = x"f3" else
			x"bf" when byte_in = x"f4" else
			x"e6" when byte_in = x"f5" else
			x"42" when byte_in = x"f6" else
			x"68" when byte_in = x"f7" else
			x"41" when byte_in = x"f8" else
			x"99" when byte_in = x"f9" else
			x"2d" when byte_in = x"fa" else
			x"0f" when byte_in = x"fb" else
			x"b0" when byte_in = x"fc" else
			x"54" when byte_in = x"fd" else
			x"bb" when byte_in = x"fe" else
			x"16";
	
	
end architecture;