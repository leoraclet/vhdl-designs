----------------------------------------------------------------------
--
-- Design unit:   Simple Sequencer
-- File name:     sequen.vhd
-- Description:   State machine example
--                The leds are "on" depending on the "sel" signal.
--                Following four sequences are allowed:
--
--                sel    Sequence
--                ---------------------------------------------------
--                 0      d1 - d2 - d3 - d4 - d1 - d2 -  ...
--                 1      d1 - d4 - d3 - d2 - d1 - d4  - ...
--
--                 Output "leds" is created as follows
--                   leds <= d1 & d2 & d3 & d4;
--
---------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY sequen IS
  PORT (
    clk, raz : IN  STD_LOGIC;
    sel      : IN  STD_LOGIC;
    leds     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END sequen;

ARCHITECTURE rtl OF sequen IS
  TYPE states_leds IS (no_led, led_1, led_2, led_3, led_4);
  SIGNAL sm_ctrl : states_leds;
BEGIN

  -- State machine definition
  PROCESS (clk)
  BEGIN
    IF raz = '0' THEN
      sm_ctrl <= no_led;
    ELSIF rising_edge(clk) THEN
      CASE sm_ctrl IS
        WHEN no_led =>
          sm_ctrl <= led_1;
        WHEN led_1 =>
          IF sel = '1' THEN
            sm_ctrl <= led_2;
          ELSE
            sm_ctrl <= led_4;
          END IF;
        WHEN led_2 =>
          IF sel = '1' THEN
            sm_ctrl <= led_3;
          ELSE
            sm_ctrl <= led_1;
          END IF;
        WHEN led_3 =>
          IF sel = '1' THEN
            sm_ctrl <= led_4;
          ELSE
            sm_ctrl <= led_2;
          END IF;
        WHEN led_4 =>
          IF sel = '1' THEN
            sm_ctrl <= led_1;
          ELSE
            sm_ctrl <= led_3;
          END IF;
        WHEN OTHERS =>
          sm_ctrl <= no_led;
      END CASE;
    END IF;
  END PROCESS;

  -- Output definition
  WITH sm_ctrl SELECT
    leds <= "0111" WHEN led_1,
    "1011" WHEN led_2,
    "1101" WHEN led_3,
    "1110" WHEN led_4,
    "1111" WHEN OTHERS;

END rtl;
