----------------------------------------------------------------------
--
-- Place:         IUT Saint-Etienne
-- Design unit:   .
-- File name:     code2bin.vhd
-- Description:   .
-- Author:        Léo Raclet
-- Date:          18/10/2022
-- Revision:      December 2025
-- Last changes:  -
--
----------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY compteur_bidir_varmod IS
  PORT (
    clk        : IN  STD_LOGIC;
    reset      : IN  STD_LOGIC;
    LOAD       : IN  STD_LOGIC;
    UP_DOWN    : IN  STD_LOGIC;
    MODULO     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    LOAD_VALUE : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    S          : OUT STD_LOGIC);
END compteur_bidir_varmod;

ARCHITECTURE rtl OF compteur_bidir_varmod IS
  SIGNAL Q : INTEGER RANGE 0 TO 15 := 0;
BEGIN
  PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Q <= 0;
      S <= '0';
    ELSIF rising_edge(clk) THEN
      IF LOAD = '1' THEN
        IF LOAD_VALUE >= MODULO THEN
          Q <= TO_INTEGER(UNSIGNED(MODULO));
        ELSE
          Q <= TO_INTEGER(UNSIGNED(LOAD_VALUE));
        END IF;
      ELSE
        IF UP_DOWN = '1' THEN
          IF Q = TO_INTEGER(UNSIGNED(MODULO)) THEN
            Q <= 0;
            S <= '1';
          ELSE
            Q <= Q + 1;
            S <= '0';
          END IF;
        ELSE
          IF Q = 0 THEN
            Q <= TO_INTEGER(UNSIGNED(MODULO));
            S <= '1';
          ELSE
            Q <= Q - 1;
            s <= '0';
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS;
END rtl;
