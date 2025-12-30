LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY mux8x4 IS
  PORT (
    SWAH                                           : IN  STD_LOGIC;
    e1HD, e1HU, e1MD, e1MU, e2HD, e2HU, e2MD, e2MU : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    sHD, sHU, sMD, sMU                             : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END mux8x4;

ARCHITECTURE rtl OF mux8x4 IS

BEGIN

  WITH SWAH SELECT
    sHD <= e2HD WHEN '1',
    e1HD WHEN '0',
    "0000" WHEN OTHERS;
  WITH SWAH SELECT
    sHU <= e2HU WHEN '1',
    e1HU WHEN '0',
    "0000" WHEN OTHERS;
  WITH SWAH SELECT
    sMD <= e2MD WHEN '1',
    e1MD WHEN '0',
    "0000" WHEN OTHERS;
  WITH SWAH SELECT
    sMU <= e2MU WHEN '1',
    e1MU WHEN '0',
    "0000" WHEN OTHERS;

END rtl;
