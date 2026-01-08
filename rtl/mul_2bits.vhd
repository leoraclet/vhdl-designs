----------------------------------------------------------------------
--
-- Design unit:   2-bits mulitplier
-- File name:     ripple_carry_4bits.vhd
-- Description:   Sequential block used to multiply two 2-bits numbers
--                as a 4-bit number
--
----------------------------------------------------------------------

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
  SIGNAL R       : STD_LOGIC;
  SIGNAL andA1B1 : STD_LOGIC;
  SIGNAL andA0B1 : STD_LOGIC;
  SIGNAL andA1B0 : STD_LOGIC;
BEGIN

  andA0B1 <= B(1) AND A(0);
  andA1B0 <= B(0) AND A(1);
  andA1B1 <= A(1) AND B(1);
  u1 : full_adder PORT MAP(
    A  => andA1B0,
    B  => andA0B1,
    Re => '0',
    S  => S(1),
    Rs => R);
  u2 : full_adder PORT MAP(
    A  => andA1B1,
    B  => '0',
    Re => R,
    S  => S(2),
    Rs => S(3));
  S(0) <= A(0) AND B(0);
END rtl;
