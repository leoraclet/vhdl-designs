LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY comparateur IS
  PORT (
    E1    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    E2    : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    S_SUP : OUT STD_LOGIC;
    S_EQU : OUT STD_LOGIC;
    S_INF : OUT STD_LOGIC);
END comparateur;

ARCHITECTURE logique OF comparateur IS
BEGIN
  PROCESS (E1, E2)
  BEGIN
    IF E1 = E2 THEN
      S_EQU <= '1';
      S_SUP <= '0';
      S_INF <= '0';
    ELSIF E1 > E2 THEN
      S_SUP <= '1';
      S_INF <= '0';
      S_EQU <= '0';
    ELSE
      S_INF <= '1';
      S_SUP <= '0';
      S_EQU <= '0';
    END IF;
  END PROCESS;
END logique;
