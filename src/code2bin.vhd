----------------------------------------------------------------------
--
-- Design unit:   Decode bit position to number
-- File name:     code2bin.vhd
-- Description:   Combinatorial block used to retrieve number from
--                bit position in the input bit vector
--
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY code2bin IS
  PORT (
    req : IN  STD_LOGIC_VECTOR(3 DOWNTO 1);
    b   : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END code2bin;

ARCHITECTURE rtl OF code2bin IS
BEGIN

  b <= "11" WHEN req(3) = '0' ELSE
       "10" WHEN req(2) = '0' ELSE
       "01" WHEN req(1) = '0' ELSE
       "00";

END rtl;
