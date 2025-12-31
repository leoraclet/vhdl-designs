----------------------------------------------------------------------
--
-- Design unit:   Simple 16-bits adder
-- File name:     add16.vhd
-- Description:   The circuit =>
--
----------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY add16 IS
  PORT (
    a, b  : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
    c_in  : IN  STD_LOGIC := '0';
    s     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    c_out : OUT STD_LOGIC
  );
END add16;

ARCHITECTURE rtl OF add16 IS
  SIGNAL c_int : STD_LOGIC_VECTOR(3 DOWNTO 0);
  COMPONENT add4
    PORT (
      a     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      b     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      c_in  : IN  STD_LOGIC;
      r     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      c_out : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  c_int(0) <= c_in;
  u1 : add4 PORT MAP(
    a     => a(3 DOWNTO 0),
    b     => b(3 DOWNTO 0),
    c_in  => c_int(0),
    r     => s(3 DOWNTO 0),
    c_out => c_int(1));
  Interns :
  FOR i IN 1 TO 2 GENERATE
    u2 : add4 PORT MAP(
      a     => a(4 * (i + 1) - 1 DOWNTO 4 * i),
      b     => b(4 * (i + 1) - 1 DOWNTO 4 * i),
      c_in  => c_int(i),
      r     => s(4 * (i + 1) - 1 DOWNTO 4 * i),
      c_out => c_int(i + 1));
  END GENERATE Interns;

  u4 : add4 PORT MAP(
    a     => a(15 DOWNTO 12),
    b     => b(15 DOWNTO 12),
    c_in  => c_int(3),
    r     => s(15 DOWNTO 12),
    c_out => c_out);
END rtl;
