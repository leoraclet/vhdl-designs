LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY d_latch IS
  PORT (
    clk   : IN  STD_LOGIC;
    D     : IN  STD_LOGIC;
    SET   : IN  STD_LOGIC;
    RESET : IN  STD_LOGIC;
    Q     : OUT STD_LOGIC;
    notQ  : OUT STD_LOGIC);
END d_latch;

ARCHITECTURE logique OF d_latch IS
BEGIN
  PROCESS (clk, SET, RESET)
  BEGIN
    IF rising_edge(clk) THEN
      IF RESET = '1' THEN
        Q    <= '0';
        notQ <= '1';
      ELSIF SET = '1' THEN
        Q    <= '1';
        notQ <= '0';
      ELSE
        Q    <= D;
        notQ <= NOT(D);
      END IF;
    END IF;
  END PROCESS;
END logique;
