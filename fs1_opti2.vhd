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
  signal x1i, x2i, x3i, x4i, t1ai, t1bi, t1ci, t2ai, t2bi, t2ci, t3ai, t3bi, t3ci, t4i, t5i, t6i, t7i, t8i: std_logic;
begin
  x1i <= not (x1 and x1);
  x2i <= not (x2 and x2);
  x3i <= not (x3 and x3);
  x4i <= not (x4 and x4);

  t1ai <= not (x3i or x4);
  t1bi <= not (x1i and x4);
  t1ci <= not (t1ai and t1bi);
  t2ai <= not (x2 and x4);
  t2bi <= not (t2ai or x3i);
  t2ci <= not (x1i and t2bi);
  t3ai <= not (x1 and x3);
  t3bi <= not (t3ai or x2);
  t3ci <= not (x4i and t3bi);
  t4i <= not (x1 and x2i);
  t5i <= not (x2 and (not (x1 or x3))) ;
  t6i <= not (x1 and x2i and x3);
  t7i <= not (x1 and x4i);
  t8i <= not (x1 and x3 and x4i);  

  y1 <= not (t5i or t4i);
  y2 <= not (t1ci or t6i or t7i);
  y3 <= not (t2ci or t8i);
  y4 <= not (t3ci);
end architecture opti;