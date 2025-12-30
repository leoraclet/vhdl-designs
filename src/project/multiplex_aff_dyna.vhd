LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY multiplexeur_affdyna IS
  PORT (
    sel                : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
    eHD, eHU, eMD, eMU : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    sDyn               : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)

  );
END multiplexeur_affdyna;

ARCHITECTURE rtl OF multiplexeur_affdyna IS

BEGIN

  WITH sel SELECT
    sDyn <= eHD WHEN "00",
    eHU WHEN "01",
    eMD WHEN "10",
    eMU WHEN "11",
    "0000" WHEN OTHERS;

END rtl;
