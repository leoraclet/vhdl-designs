----------------------------------------------------------------------
--
-- Design unit:   Half adder
-- File name:     half_add.vhd
-- Description:   Adds two single-bit binary numbers, producing a sum and a carry output
--
---------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY half_add IS
  PORT (
    a     : IN  STD_LOGIC;
    b     : IN  STD_LOGIC;
    r     : OUT STD_LOGIC;
    c_out : OUT STD_LOGIC
  );
END half_add;

ARCHITECTURE rtl OF half_add IS
BEGIN
  r     <= a XOR b;
  c_out <= a AND b;
END rtl;
