library IEEE; use IEEE.std_logic_1164.all;
entity f_system is
  port ( x1, x2, x3, x4: in std_logic;
         y1, y2, y3, y4: out std_logic );
end entity f_system;

library IEEE; use IEEE.std_logic_1164.all;
architecture tabel of f_system is
begin
  process (x1, x2, x3, x4)
    variable in_word, out_word: std_logic_vector (3 downto 0);
  begin
    in_word := x1 & x2 & x3 & x4;
    case  in_word  is
      when "0000" => out_word := "-01-";
      when "0001" => out_word := "1111";
      when "0010" => out_word := "1-01";
      when "0011" => out_word := "10-1";
      when "0100" => out_word := "-0-0";
      when "0101" => out_word := "011-";
      when "0110" => out_word := "-000";
      when "0111" => out_word := "1111";
      when "1000" => out_word := "0101";
      when "1001" => out_word := "000-";
      when "1010" => out_word := "0-10";
      when "1011" => out_word := "0101";
      when "1100" => out_word := "1--0";
      when "1101" => out_word := "-00-";
      when "1110" => out_word := "1110";
      when "1111" => out_word := "-001";
      when others => out_word := "----";
    end case;
    y1 <= out_word(3);    y2 <= out_word(2);
    y3 <= out_word(1);    y4 <= out_word(0);
  end process;
end architecture tabel;
