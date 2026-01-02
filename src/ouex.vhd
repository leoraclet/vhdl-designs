----------------------------------------------------------------------
--
-- Design unit:   Decode bit position to number
-- File name:     ouex.vhd
-- Description:   .
--
----------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ouex IS
  PORT (
    A  : IN  STD_LOGIC;
    B  : IN  STD_LOGIC;
    S1 : OUT STD_LOGIC;
    S2 : OUT STD_LOGIC);
END ouex;

ARCHITECTURE rtl OF ouex IS
BEGIN
  S1 <= A WHEN B = '0' ELSE
        NOT(A);

  -- The following logic equation is the equivalent of the logic condition above
  -- S1 <= (A OR B) AND NOT(A AND B);

  S2 <= A XOR B;
END rtl;
