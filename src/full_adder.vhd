----------------------------------------------------------------------
--
-- Design unit:   Full adder
-- File name:     full_adder.vhd
-- Description:   Adds three binary inputs: two significant bits
--                and a carry-in bit, producing a sum and a
--                carry-out bit as outputs
--
----------------------------------------------------------------------

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

ARCHITECTURE rtl OF full_adder IS
BEGIN
  S  <= A XOR B XOR Re;
  Rs <= (Re AND A) OR (Re AND B) OR (A AND B);
END rtl;
