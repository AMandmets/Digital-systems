------------------------------------------------------------------------
-- IAY0150 - Homework #1. Example task - #1, gates, optimized.
------------------------------------------------------------------------
-- (C) Peeter Ellervee - 2016/2022/2023 - Tallinn
------------------------------------------------------------------------
library IEEE; use IEEE.std_logic_1164.all;
entity f_system is
  port ( x1, x2, x3, x4: in std_logic;
         y1, y2, y3, y4: out std_logic );
end entity f_system;

library IEEE; use IEEE.std_logic_1164.all;
architecture opti of f_system is
  signal x1i, x2i, x4i, t1i, t2i, t3i, t4i, t5, t6i, t7i, t8i, t9: std_logic;
begin
  x1i <= not (x1 and x1);
  x2i <= not (x2 and x2);
  --x3i <= not (x3 and x3);
  x4i <= not (x4 and x4);

  t1i <= not (t9 or x2);
  t2i <= not (x1 and x2i);
  t3i <= not (t2i and x3);
  t4i <= not (t9 and x4);
  t5 <= not ( not (x2 and x4) or x1);
  t6i <= not (x1 and x4i);
  t7i <= not (t6i and x3);
  t8i <= not (x2 and x4i);
  t9 <= not (x1 and x3);
  

  y1 <= not (t1i or t2i);
  y2 <= not (not ( not (t3i or t4i) or t5 or t6i));
  y3 <= not (not (t7i or t5 or t9));
  y4 <= not (t7i or t8i);
end architecture opti;