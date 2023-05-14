library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity test is    end test;

architecture bench of test is
  signal clk, rst, rdy, hlt: bit := '1';
  signal x, y, res, r: unsigned(8 downto 0);

  component non_res_div
    port (xi, yi : in unsigned(8 downto 0);
          rst    : in bit;
          xo     : out unsigned(8 downto 0);
          yo     : out unsigned(8 downto 0);
          rdy    : out bit;
          clk    : in bit);
  end component;
begin
  clk <= not clk after 10 ns when hlt='1';

  U1: non_res_div port map (x, y, rst, res, r, rdy, clk);

  process
    type int_array is array (0 to 1) of integer;
    constant a: int_array := (149, 118);
    constant b: int_array := (26, 15);
    -- expected results (non_res_div)  8,  1,  5,  11,  4,   1,  125,   2  
  begin
    wait on clk until clk='0';
    for  i in a'range  loop
      x <= conv_unsigned(a(i),9);
      y <= conv_unsigned(b(i),9);
      rst <= '0';
      wait on clk until clk='0';
      rst <= '1';
      --wait on clk until clk='0';
      while  rdy = '0'  loop
        wait on clk until clk='0';
      end loop;
      wait on clk until clk='0';
    end loop;
    wait on clk until clk='0';
    hlt <= '0';    wait;
  end process;
end bench;