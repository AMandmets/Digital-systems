library IEEE; use IEEE.std_logic_1164.all;
architecture espresso of f_system is
--  signal t1, t2, t3, t4, t5, t6, t7, t8, t9: std_logic;
--  signal t19, t68: std_logic;
begin

y1 <= not (((not x1) and x2 and (not x3)) or 
	(x1 and (not x2)));

y2 <= (x1 and (not x2) and x3) or 
	((not x1) and (not x3) and x4) or 
	((not x1) and x2 and x4) or 
	(x1 and (not x4));

y3 <= (x1 and x3 and (not x4)) or 
	((not x1) and x2 and x4) or 
	((not x1) and (not x3));

y4 <= not ((x1 and x3 and (not x4)) or 
	(x2 and (not x4)));


end architecture espresso;
