LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ripple_carry_4bits IS
  PORT (
    A  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    B  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    Re : IN  STD_LOGIC;
    S  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    Rs : OUT STD_LOGIC);
END ripple_carry_4bits;

ARCHITECTURE logique OF ripple_carry_4bits IS
  COMPONENT full_adder IS
    PORT (
      A  : IN  STD_LOGIC;
      B  : IN  STD_LOGIC;
      Re : IN  STD_LOGIC;
      S  : OUT STD_LOGIC;
      Rs : OUT STD_LOGIC);
  END COMPONENT;
  SIGNAL R : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
  u1 : full_adder PORT MAP(
    A  => A(0),
    B  => B(0),
    Re => Re,
    S  => S(0),
    Rs => R(0));

  u2 : full_adder PORT MAP(
    A  => A(1),
    B  => B(1),
    Re => R(0),
    S  => S(1),
    Rs => R(1));

  u3 : full_adder PORT MAP(
    A  => A(2),
    B  => B(2),
    Re => R(1),
    S  => S(2),
    Rs => R(2));

  u4 : full_adder PORT MAP(
    A  => A(3),
    B  => B(3),
    Re => R(2),
    S  => S(3),
    Rs => R(3));

  Rs <= R(3);
END logique;
