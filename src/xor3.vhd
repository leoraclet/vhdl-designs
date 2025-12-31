----------------------------------------------------------------------
--
-- Design unit:   Triple binary XOR
-- File name:     xor3.vhd
-- Description:   .
--
----------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY xor3 IS
  PORT (
    a : IN  STD_LOGIC;
    b : IN  STD_LOGIC;
    c : IN  STD_LOGIC;
    x : OUT STD_LOGIC
  );
END xor3;

ARCHITECTURE rtl OF xor3 IS
  SIGNAL sig_int : STD_LOGIC;

BEGIN
  sig_int <= a XOR b;
  x       <= c XOR sig_int;
END rtl;
