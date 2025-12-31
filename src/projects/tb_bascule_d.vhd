LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_bascule_d IS
END ENTITY;

ARCHITECTURE rtl OF tb_bascule_d IS
  COMPONENT bascule_d
    PORT (
      d, clk, reset : IN  STD_LOGIC;
      q, notq       : OUT STD_LOGIC);
  END COMPONENT;
  SIGNAL d_int, clk_int, reset_int, q_int, notq_int : STD_LOGIC;
BEGIN
  U0 : bascule_d PORT MAP(d_int, clk_int, reset_int, q_int, notq_int);
  d_int     <= '0', '1' AFTER 20 ns;
  reset_int <= '0', '1' AFTER 60 ns, '0' AFTER 80 ns;

  clock : PROCESS
  BEGIN
    clk_int <= '1', '0' AFTER 15 ns;
    WAIT FOR 30 ns;
  END PROCESS;
END ARCHITECTURE;
