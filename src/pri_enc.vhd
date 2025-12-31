----------------------------------------------------------------------
--
-- Design unit:   Priority encoder
-- File name:     pri_enc.vhd
-- Description:   Combinatorial block used to encode the level
--                of the incoming interrupt requests. Up to seven
--                requests (also simultaneous) are allowed.
--                The level at the output be the level of the
--                active request having the highest priority.
--                The highest priority request - 1, the lowest - 7.
--
---------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY pri_enc IS
  PORT (
    req : IN  STD_LOGIC_VECTOR(1 TO 7);
    int : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
  );
END pri_enc;

ARCHITECTURE rtl OF pri_enc IS
  --  SIGNAL c_int : STD_LOGIC_VECTOR(4 DOWNTO 0);

BEGIN
  int <= "001" WHEN req(1) = '1' ELSE
         "010" WHEN req(2) = '1' ELSE
         "011" WHEN req(3) = '1' ELSE
         "100" WHEN req(4) = '1' ELSE
         "101" WHEN req(5) = '1' ELSE
         "110" WHEN req(6) = '1' ELSE
         "111" WHEN req(7) = '1' ELSE
         "000";

END rtl;
