----------------------------------------------------------------------
--
-- Place:         IUT Saint-Etienne
-- Design unit:   Bidirectionnal 4-bits counter with asynchronous reset
-- File name:     cmpt4_bidirena.vhd
-- Description:   .
-- System:        VHDL'93
-- Author:        Léo Raclet
-- Date:          25/01/2022
-- Revision:      December 2025
-- Last changes:  -
--
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY cmpt4_bidirena IS
  PORT (
    clk   : IN  STD_LOGIC;
    ena   : IN  STD_LOGIC;
    dir   : IN  STD_LOGIC;
    n_rst : IN  STD_LOGIC;
    cmpto : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END cmpt4_bidirena;

ARCHITECTURE rtl OF cmpt4_bidirena IS
  SIGNAL s : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

BEGIN
  PROCESS (clk, n_rst)
  BEGIN
    IF n_rst = '0' THEN
      s <= "0000";
    ELSIF rising_edge(clk) THEN
      IF ena = '1' THEN
        IF dir = '1' THEN
          IF s = "1001" THEN
            s <= "0000";
          ELSE
            s <= s + 1;
          END IF;
        ELSE
          IF s = "0000" THEN
            s <= "1001";
          ELSE
            s <= s - 1;
          END IF;
        END IF;
      END IF;
    END IF;

    cmpto <= s;

  END PROCESS;
END rtl;
