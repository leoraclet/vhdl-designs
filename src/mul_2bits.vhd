LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mul_2bits IS
  PORT (
    A : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
    B : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
    S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END mul_2bits;

ARCHITECTURE rtl OF mul_2bits IS
  COMPONENT full_adder IS
    PORT (
      A  : IN  STD_LOGIC;
      B  : IN  STD_LOGIC;
      Re : IN  STD_LOGIC;
      S  : OUT STD_LOGIC;
      Rs : OUT STD_LOGIC);
  END COMPONENT;
  SIGNAL R : STD_LOGIC;
BEGIN
  u1 : full_adder PORT MAP(
    A  => B(0) AND A(1),
    B  => B(1) AND A(0),
    Re => '0',
    S  => S(1),
    Rs => R);
  u2 : full_adder PORT MAP(
    A  => A(1) AND B(1),
    B  => '0',
    Re => R,
    S  => S(2),
    Rs => S(3));
  S(0) <= A(0) AND B(0);
END rtl;
