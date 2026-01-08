----------------------------------------------------------------------
--
-- Design unit:   Frequency divider by two
-- File name:     div2.vhd
-- Description:   Sequential block used to divide input signal
--                frequency by 2
--
---------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY div2 IS
  PORT (
    clk      : IN  STD_LOGIC;
    clk_div2 : OUT STD_LOGIC);
END div2;

ARCHITECTURE rtl OF div2 IS
  SIGNAL d_reg : STD_LOGIC;

BEGIN
  PROCESS (clk)
  BEGIN
    IF rising_edge(clk) THEN
      d_reg <= NOT d_reg;
    END IF;
  END PROCESS;
  clk_div2 <= d_reg;
END rtl;
