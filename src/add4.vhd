----------------------------------------------------------------------
--
-- Design unit:   Simple 4-bits adder
-- File name:     add4.vhd
-- Description:   Adds two 4-bits numbers and outputs result as a
--                4-bits number and a carry.
--
----------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY add4 IS
  PORT (
    a, b  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    c_in  : IN  STD_LOGIC := '0'; -- is set to 0 by default for simulations purposes
    r     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    c_out : OUT STD_LOGIC
  );
END add4;

ARCHITECTURE rtl OF add4 IS
  SIGNAL c_int : STD_LOGIC_VECTOR(3 DOWNTO 0);
  COMPONENT fa
    PORT (
      a     : IN  STD_LOGIC;
      b     : IN  STD_LOGIC;
      c_in  : IN  STD_LOGIC;
      sum   : OUT STD_LOGIC;
      c_out : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  c_int(0) <= c_in;
  u1 : fa PORT MAP(
    a     => a(0),
    b     => b(0),
    c_in  => c_int(0),
    sum   => r(0),
    c_out => c_int(1));

  u2 : fa PORT MAP(
    a     => a(1),
    b     => b(1),
    c_in  => c_int(1),
    sum   => r(1),
    c_out => c_int(2));

  u3 : fa PORT MAP(
    a     => a(2),
    b     => b(2),
    c_in  => c_int(2),
    sum   => r(2),
    c_out => c_int(3));

  u4 : fa PORT MAP(
    a     => a(3),
    b     => b(3),
    c_in  => c_int(3),
    sum   => r(3),
    c_out => c_out);
END rtl;
