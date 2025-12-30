LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY fa IS
  PORT (
    a     : IN  STD_LOGIC;
    b     : IN  STD_LOGIC;
    c_in  : IN  STD_LOGIC;
    sum   : OUT STD_LOGIC;
    c_out : OUT STD_LOGIC
  );
END fa;

ARCHITECTURE arch_flot OF fa IS

BEGIN
  sum   <= a XOR b XOR c_in;
  c_out <= (a AND b) OR (a AND c_in) OR (c_in AND b) OR (a AND b AND c_in);
END arch_flot;
