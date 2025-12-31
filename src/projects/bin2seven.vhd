-----------------------------
-- IUT Saint-Etienne
-- Filename:  bin2seven.vhd
-----------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bin2seven IS
  PORT (
    bin                 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    a, b, c, d, e, f, g : OUT STD_LOGIC);
END bin2seven;

ARCHITECTURE rtl OF bin2seven IS
  SIGNAL s : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN

  WITH bin SELECT

    s <= "0000001" WHEN "0000",
    "1001111" WHEN "0001",
    "0010010" WHEN "0010",
    "0000110" WHEN "0011",
    "1001100" WHEN "0100",
    "0100100" WHEN "0101",
    "0100000" WHEN "0110",
    "0001111" WHEN "0111",
    "0000000" WHEN "1000",
    "0000100" WHEN "1001",
    "0001000" WHEN "1010",
    "1100000" WHEN "1011",
    "1110010" WHEN "1100",
    "1000010" WHEN "1101",
    "0110000" WHEN "1110",
    "0111000" WHEN OTHERS;

  -- Afficheur à anodes communes

  -- a <= s(6);
  -- b <= s(5);
  -- c <= s(4);
  -- d <= s(3);
  -- e <= s(2);
  -- f <= s(1);
  -- g <= s(0);

  -- Afficheur à cathodes communes
  -- Il suffit d'inverser tous les bits de sortie

  a <= NOT s(6);
  b <= NOT s(5);
  c <= NOT s(4);
  d <= NOT s(3);
  e <= NOT s(2);
  f <= NOT s(1);
  g <= NOT s(0);

END rtl;
