---------------------------------
-- IUT Saint-Etienne
-- Filename:  bin2seven_eco.vhd
-- Edited by: Leo Raclet
-- Date:      25/01/2022
---------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bin2seven_eco IS
  PORT (
    bin                 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    marche              : IN  STD_LOGIC;
    a, b, c, d, e, f, g : OUT STD_LOGIC);
END bin2seven_eco;

ARCHITECTURE a OF bin2seven_eco IS
  SIGNAL s   : STD_LOGIC_VECTOR(6 DOWNTO 0);
  SIGNAL sel : STD_LOGIC_VECTOR(4 DOWNTO 0);

BEGIN

  sel <= marche & bin;

  WITH sel SELECT

    s <= "0000001" WHEN "10000",
    "1001111" WHEN "10001",
    "0010010" WHEN "10010",
    "0000110" WHEN "10011",
    "1001100" WHEN "10100",
    "0100100" WHEN "10101",
    "0100000" WHEN "10110",
    "0001111" WHEN "10111",
    "0000000" WHEN "11000",
    "0000100" WHEN "11001",
    "0001000" WHEN "11010",
    "1100000" WHEN "11011",
    "1110010" WHEN "11100",
    "1000010" WHEN "11101",
    "0110000" WHEN "11110",
    "0111000" WHEN "11111",
    "1111111" WHEN OTHERS;

  a <= s(6);
  b <= s(5);
  c <= s(4);
  d <= s(3);
  e <= s(2);
  f <= s(1);
  g <= s(0);

END a;
