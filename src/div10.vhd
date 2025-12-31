----------------------------------------------------------------------
--
-- Design unit:   Frequency divider by 10
-- File name:     div10.vhd
-- Description:   Devides input frequency by 10
--
---------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY div10 IS
  PORT (
    clk       : IN  STD_LOGIC;
    clk_div10 : OUT STD_LOGIC
  );
END div10;

ARCHITECTURE rtl OF div10 IS
  SIGNAL cnt           : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL clk_div10_int : STD_LOGIC;
  CONSTANT MAX_COUNT   : NATURAL := 5;

BEGIN

  PROCESS (clk)
  BEGIN
    IF rising_edge(clk) THEN
      IF (cnt = (MAX_COUNT - 1)) THEN
        cnt           <= (OTHERS => '0');
        clk_div10_int <= NOT clk_div10_int;
      ELSE
        cnt <= cnt + 1;
      END IF;
    END IF;
  END PROCESS;
  clk_div10 <= clk_div10_int;
END rtl;
