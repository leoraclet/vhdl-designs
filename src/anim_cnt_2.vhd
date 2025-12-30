----------------------------------------------------------------------
--
-- Design unit:   Animated counter
-- File name:     anim_cnt.vhd
-- Description:   Animated 4-bit counter
--                Animations:
--                  1. incrementation from 0 to 9
--                  2. decrementation from 9 to 5
--                  3. incrementation from 5 to 7
--                  4. decrementation from 7 to 0
-- Parameters:    No parameters
-- System:        VHDL'93
-- Autor:         Viktor Fischer, IUT UJM
-- Copyright:     IUT UJM 2006
-- Revision:      Version 1.00, December 2007
-- Last changes:  - ...
--
---------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY anim_cnt_2 IS
  PORT (
    clk, reset : IN  STD_LOGIC;
    cnt        : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END anim_cnt_2;

ARCHITECTURE rtl OF anim_cnt_2 IS
  TYPE cnt_states IS (mode1,
    mode2,
    mode3,
    mode4);
  SIGNAL sm_cnt  : cnt_states;
  SIGNAL cnt_int : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL dec     : STD_LOGIC;

BEGIN

  -- State machine definition
  PROCESS (clk)
  BEGIN
    IF rising_edge(clk) THEN
      IF dec = '0' THEN
        cnt_int <= cnt_int + 1;
      ELSE
        cnt_int <= cnt_int - 1;
      END IF;
    END IF;
  END PROCESS;
  --
  PROCESS (clk)
  BEGIN
    IF rising_edge(clk) THEN
      CASE sm_cnt IS
        WHEN mode1 =>
          IF cnt_int = "1000" THEN
            sm_cnt <= mode2;
            dec    <= '1';
          END IF;
        WHEN mode2 =>
          IF cnt_int = "0110" THEN
            sm_cnt <= mode3;
            dec    <= '0';
          END IF;
        WHEN mode3 =>
          IF cnt_int = "0110" THEN
            sm_cnt <= mode4;
            dec    <= '1';
          END IF;
        WHEN mode4 =>
          IF cnt_int = "0001" THEN
            sm_cnt <= mode1;
            dec    <= '0';
          END IF;
        WHEN OTHERS =>
          sm_cnt <= mode1;
          dec    <= '0';
      END CASE;
    END IF;
  END PROCESS;

  cnt <= cnt_int;

END rtl;
