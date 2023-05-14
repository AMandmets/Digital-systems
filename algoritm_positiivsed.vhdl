library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity non_res_div is 
  port (xi, yi : in unsigned(8 downto 0);
        rst    : in bit;
        xo     : out unsigned(8 downto 0);
        yo     : out unsigned(8 downto 0);
        rdy    : out bit := '1';
        clk    : in bit);
end non_res_div;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

architecture experiments of non_res_div is 
begin 

  process
    variable x, y, r : unsigned(8 downto 0);
    variable yinv : signed(8 downto 0);
    variable L, i : integer := 9;
  begin
    -- Wait for the new input data
    wait on clk until clk='1' and rst='0';

    x := conv_unsigned(xi, 9);    y := conv_unsigned(yi, 9);    rdy <= '0';
    r := conv_unsigned('0', 9);
    wait on clk until clk='1';

    L := 9;
    while L > 0 loop
      if  x(8)='0' then
        r := shl(r, conv_unsigned('1', 9));
      else
        r := shl(r, conv_unsigned('1', 9));
        r(0) := '1';
      end if;
      
      --wait on clk until clk='1';
      if r(8)='0' then
        r := r - y;
      else
        r := r + y;
      end if;

      wait on clk until clk='1';
      if r(8)='0' then
        x := shl(x, conv_unsigned('1', 9));
        x(0) := '1';
        L := L - 1;
      else
        x := shl(x, conv_unsigned('1', 9));
        x(0) := '0';
        L := L - 1;
      end if;

    end loop;
    
    if r(8)='1' then
      r := r + y;
    end if;
    wait on clk until clk='1';
    -- Ready
    xo <= x;    rdy <= '1';
    yo <= r;
    wait on clk until clk='1';
  end process;

end experiments;
