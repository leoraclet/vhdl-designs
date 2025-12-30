------------------------------------
--  IUT St-Etienne
--  Filename:  code2bin
--  Edited by: Leo Raclet
--  Date:      18/10/2021
------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY code2bin IS
  PORT (
    req : IN  STD_LOGIC_VECTOR(3 DOWNTO 1);
    b   : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END code2bin;

ARCHITECTURE fd OF code2bin IS
BEGIN

  b <= "11" WHEN req(3) = '0' ELSE
       "10" WHEN req(2) = '0' ELSE
       "01" WHEN req(1) = '0' ELSE
       "00";

END fd;
