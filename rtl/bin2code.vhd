----------------------------------------------------------------------
--
-- Design unit:   2-bit line decoder
-- File name:     bin2code.vhd
-- Description:   Combinatorial block used to retrieve bit position
--                from from a number
--
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bin2code IS
  PORT (
    a   : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
    req : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END bin2code;

ARCHITECTURE rtl OF bin2code IS
BEGIN

  WITH a SELECT
    req <= "0001" WHEN "00",
    "0010" WHEN "01",
    "0100" WHEN "10",
    "1000" WHEN OTHERS;

END rtl;
