LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY full_adder IS
  PORT (
    A  : IN  STD_LOGIC;
    B  : IN  STD_LOGIC;
    Re : IN  STD_LOGIC;
    S  : OUT STD_LOGIC;
    Rs : OUT STD_LOGIC);
END full_adder;

ARCHITECTURE logique OF full_adder IS
BEGIN
  S  <= A XOR B XOR Re;
  Rs <= (Re AND A) OR (Re AND B) OR (A AND B);
END logique;
