LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY d_latch_2 IS
  PORT (
    clk   : IN  STD_LOGIC;
    ena   : IN  STD_LOGIC;
    D     : IN  STD_LOGIC;
    reset : IN  STD_LOGIC;
    Q     : OUT STD_LOGIC;
    notQ  : OUT STD_LOGIC);
END d_latch_2;

ARCHITECTURE logique OF d_latch_2 IS
BEGIN
  PROCESS (clk, reset)
  BEGIN
    IF rising_edge(clk) THEN
      IF reset = '1' THEN
        Q    <= '0';
        notQ <= '1';
      ELSE
        IF ena = '0' THEN
          Q    <= D;
          notQ <= NOT(D);
        END IF;
      END IF;
    END IF;
  END PROCESS;
END logique;
