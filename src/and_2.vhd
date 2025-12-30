LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY and_2 IS
  PORT (
    x1 : IN  STD_LOGIC;
    x2 : IN  STD_LOGIC;
    y  : OUT STD_LOGIC
  );
END and_2;

ARCHITECTURE arch_flot OF and_2 IS
BEGIN
  y <= x1 AND x2;
END arch_flot;
