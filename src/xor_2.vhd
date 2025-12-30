LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY xor_2 IS
  PORT (
    i1 : IN  STD_LOGIC;
    i2 : IN  STD_LOGIC;
    o  : OUT STD_LOGIC
  );
END xor_2;

ARCHITECTURE arch_flot OF xor_2 IS
BEGIN
  o <= i1 XOR i2;
END arch_flot;
