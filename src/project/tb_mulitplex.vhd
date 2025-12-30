LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_multiplex IS
END ENTITY;

ARCHITECTURE rtl OF tb_multiplex IS
  COMPONENT multiplex
    PORT (
      e0, e1, sel : IN  STD_LOGIC;
      s           : OUT STD_LOGIC);
  END COMPONENT;
  SIGNAL sel_int, e1_int, e0_int, s_int : STD_LOGIC;
BEGIN
  U0 : multiplex PORT MAP(e0_int, e1_int, sel_int, s_int);
  sel_int <= '0', '1' AFTER 60 ns, '0' AFTER 120 ns;
  e0_int  <= '0', '1' AFTER 40 ns;
  e1_int  <= '0', '1' AFTER 80 ns;
END ARCHITECTURE;
