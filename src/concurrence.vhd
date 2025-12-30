LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY concurrence IS
  PORT (
    A : IN  STD_LOGIC;
    B : IN  STD_LOGIC;
    C : IN  STD_LOGIC;
    S : OUT STD_LOGIC);
END concurrence;

ARCHITECTURE logique OF concurrence IS
  SIGNAL D : STD_LOGIC;
BEGIN
  S <= C AND D;
  D <= A XOR B;
END logique;
