LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY demi_add IS
  PORT (
    a     : IN  STD_LOGIC;
    b     : IN  STD_LOGIC;
    r     : OUT STD_LOGIC;
    c_out : OUT STD_LOGIC
  );
END demi_add;

ARCHITECTURE rtl OF demi_add IS
BEGIN
  r     <= a XOR b;
  c_out <= a AND b;
END rtl;
