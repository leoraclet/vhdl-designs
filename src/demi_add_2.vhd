LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY demi_add_2 IS
  PORT (
    a     : IN  STD_LOGIC;
    b     : IN  STD_LOGIC;
    r     : OUT STD_LOGIC;
    c_out : OUT STD_LOGIC
  );
END demi_add_2;

ARCHITECTURE rtl OF demi_add_2 IS
  COMPONENT xor2 IS
    PORT (
      i1 : IN  STD_LOGIC;
      i2 : IN  STD_LOGIC;
      o  : OUT STD_LOGIC
    );
  END COMPONENT;
  COMPONENT and2 IS
    PORT (
      x1 : IN  STD_LOGIC;
      x2 : IN  STD_LOGIC;
      y  : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  mon_inst1 : xor2 PORT MAP(
    i1 => a,
    i2 => b,
    o  => r
  );
  ton_inst2 : and2 PORT MAP(
    x1 => a,
    x2 => b,
    y  => c_out
  );
END rtl;
