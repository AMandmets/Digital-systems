------------------------------------------------------------------------
-- IAY0150 - Homework #1. Test bench for the example task (simple).
------------------------------------------------------------------------
-- (C) Peeter Ellervee - 2016 - Tallinn
------------------------------------------------------------------------
library IEEE; use IEEE.std_logic_1164.all;
entity test is
end entity test;

library IEEE; use IEEE.std_logic_1164.all;
architecture bench of test is
  signal x1, x2, x3, x4: std_logic;
  signal y1, y2, y3, y4: std_logic;
  component f_system
    port ( x1, x2, x3, x4: in std_logic;
           y1, y2, y3, y4: out std_logic );
  end component;
begin
  -- Input signaals (after every 10 ns)
  x1 <= '0' after 0 ns, '1' after 80 ns, '0' after 160 ns;
  x2 <= '0' after 0 ns, '1' after 40 ns, '0' after 80 ns, '1' after 120 ns;
  x3 <= '0' after 0 ns, '1' after 20 ns, '0' after 40 ns, '1' after 60 ns,
        '0' after 80 ns, '1' after 100 ns, '0' after 120 ns, '1' after 140 ns;
  x4 <= '0' after 0 ns, '1' after 10 ns, '0' after 20 ns, '1' after 30 ns,
        '0' after 40 ns, '1' after 50 ns, '0' after 60 ns, '1' after 70 ns,
        '0' after 80 ns, '1' after 90 ns, '0' after 100 ns, '1' after 110 ns,
        '0' after 120 ns, '1' after 130 ns, '0' after 140 ns, '1' after 150 ns;

  -- System of Boolean functions
  U1: f_system port map (x1, x2, x3, x4, y1, y2, y3, y4);
end architecture bench;