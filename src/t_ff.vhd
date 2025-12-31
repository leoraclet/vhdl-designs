----------------------------------------------------------------------
--
-- Design unit:   Synchronous T flip-flop
-- File name:     t_ff.vhd
-- Description:   Simple sequential block
--
---------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY t_ff IS
  PORT (
    clk, t : IN  STD_LOGIC;
    q      : OUT STD_LOGIC);
END t_ff;

ARCHITECTURE rtl OF t_ff IS
  SIGNAL t_ff_reg : STD_LOGIC := '0'; -- Initialisation de la bascule
  -- Importante pour la simulation!
BEGIN
  PROCESS (clk)
  BEGIN
    IF rising_edge(clk) THEN
      IF t = '1' THEN
        t_ff_reg <= NOT t_ff_reg;
      END IF; -- Mémorisation implicite !
    END IF;
  END PROCESS;
  q <= t_ff_reg;
END rtl;
