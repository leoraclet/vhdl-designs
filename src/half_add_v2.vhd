----------------------------------------------------------------------
--
-- Design unit:   Half adder v2
-- File name:     half_add_v2.vhd
-- Description:   Adds two single-bit binary numbers, producing a sum
--                and a carry output
--                This version used previously defined circuits
--                instead of the default AND and XOR gates defined in
--                the standard library
--
---------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY half_add_v2 IS
  PORT (
    a     : IN  STD_LOGIC;
    b     : IN  STD_LOGIC;
    r     : OUT STD_LOGIC;
    c_out : OUT STD_LOGIC
  );
END half_add_v2;

ARCHITECTURE rtl OF half_add_v2 IS
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
