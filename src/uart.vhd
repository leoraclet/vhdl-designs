---------------------------------
-- IUT Saint-Etienne
-- Filename:    uart.vhd
-- Edited by:   Leo Raclet
-- Date:        25/01/2022
-- Description: Réalisation d'un UART sur une liaison série
---------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY uart IS
  PORT (
    clk   : IN    STD_LOGIC;
    reset : IN    STD_LOGIC;
    D     : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    A     : IN    STD_LOGIC;
    CS    : IN    STD_LOGIC;
    WR    : IN    STD_LOGIC;
    RD    : IN    STD_LOGIC;
    TxD   : OUT   STD_LOGIC_VECTOR(10 DOWNTO 0);
    RxD   : OUT   STD_LOGIC_VECTOR(10 DOWNTO 0));
END uart;

ARCHITECTURE archi OF uart IS
  SIGNAL state        : STD_LOGIC_VECTOR(7 DOWNTO 0)  := "0000";
  SIGNAL control      : STD_LOGIC_VECTOR(7 DOWNTO 0)  := "00000000";
  SIGNAL transmission : STD_LOGIC_VECTOR(10 DOWNTO 0) := "00000000";
  SIGNAL reception    : STD_LOGIC_VECTOR(10 DOWNTO 0) := "00000000";

BEGIN
  PROCESS (clk, WR, RD, reset)
  BEGIN
    IF reset = '1' THEN
      state <= "0000";
    ELSE
      IF rising_edge(clk) THEN
        IF CS = '0' THEN
          IF rising_edge(WR) THEN
            IF A = '1' THEN
              control <= D;
            ELSE
              IF A = '0' THEN
                transmission <= "00000000";
              END IF;
            END IF;
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS;
END;
