----------------------------------------------------------------------
--
-- Design unit:   Divides frequency by 2
-- File name:     clk_halve.vhd
-- Description:   .
--
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY clk_halve IS
  PORT (
    clkin   : IN  STD_LOGIC;
    ena_in  : IN  STD_LOGIC;
    rst     : IN  STD_LOGIC;
    ena_out : OUT STD_LOGIC);
END clk_halve;

ARCHITECTURE rtl OF clk_halve IS
  SIGNAL s : STD_LOGIC := '0';

BEGIN
  PROCESS (clkin, rst)
  BEGIN
    IF rst = '1' THEN
      s <= '0';
    ELSIF rising_edge(clkin) THEN
      IF ena_in = '1' THEN
        s <= NOT s;
      END IF;
    END IF;
  END PROCESS;
  ena_out <= s;
END rtl;
