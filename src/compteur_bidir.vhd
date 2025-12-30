LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY compteur_bidir IS

  PORT (
    clk     : IN  STD_LOGIC;
    reset   : IN  STD_LOGIC;
    UP_DOWN : IN  STD_LOGIC;
    S       : OUT STD_LOGIC);
END compteur_bidir;

ARCHITECTURE logique OF compteur_bidir IS
  SIGNAL Q : INTEGER RANGE 0 TO 5 := 0;
BEGIN
  PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Q <= 0;
      S <= '0';
    ELSIF rising_edge(clk) THEN
      IF UP_DOWN = '1' THEN
        IF Q = 5 THEN
          Q <= 0;
          S <= '1';
        ELSE
          Q <= Q + 1;
          S <= '0';
        END IF;
      ELSE
        IF Q = 0 THEN
          Q <= 5;
          S <= '1';
        ELSE
          Q <= Q - 1;
          s <= '0';
        END IF;
      END IF;
    END IF;
  END PROCESS;
END logique;
