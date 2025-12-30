LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY demultiplexeur_affdyna IS
  PORT (
    sel                        : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
    a1, b1, c1, d1, e1, f1, g1 : OUT STD_LOGIC;
    a2, b2, c2, d2, e2, f2, g2 : OUT STD_LOGIC;
    a3, b3, c3, d3, e3, f3, g3 : OUT STD_LOGIC;
    a4, b4, c4, d4, e4, f4, g4 : OUT STD_LOGIC;
    a, b, c, d, e, f, g        : IN  STD_LOGIC

  );
END demultiplexeur_affdyna;

ARCHITECTURE arch OF demultiplexeur_affdyna IS

BEGIN

  --Sortie pour l'afficheur 1 : Dizaine Heures
  a1 <= a WHEN sel = "00" ELSE
        '1';
  b1 <= b WHEN sel = "00" ELSE
        '1';
  c1 <= c WHEN sel = "00" ELSE
        '1';
  d1 <= d WHEN sel = "00" ELSE
        '1';
  e1 <= e WHEN sel = "00" ELSE
        '1';
  f1 <= f WHEN sel = "00" ELSE
        '1';
  g1 <= g WHEN sel = "00" ELSE
        '1';

  --Sortie pour l'afficheur 2 : Unit� Heures
  a2 <= a WHEN sel = "01" ELSE
        '1';
  b2 <= b WHEN sel = "01" ELSE
        '1';
  c2 <= c WHEN sel = "01" ELSE
        '1';
  d2 <= d WHEN sel = "01" ELSE
        '1';
  e2 <= e WHEN sel = "01" ELSE
        '1';
  f2 <= f WHEN sel = "01" ELSE
        '1';
  g2 <= g WHEN sel = "01" ELSE
        '1';

  --Sortie pour l'afficheur 3 : Dizaine Minutes
  a3 <= a WHEN sel = "10" ELSE
        '1';
  b3 <= b WHEN sel = "10" ELSE
        '1';
  c3 <= c WHEN sel = "10" ELSE
        '1';
  d3 <= d WHEN sel = "10" ELSE
        '1';
  e3 <= e WHEN sel = "10" ELSE
        '1';
  f3 <= f WHEN sel = "10" ELSE
        '1';
  g3 <= g WHEN sel = "10" ELSE
        '1';

  --Sortie pour l'afficheur 4 : Unit� Minutes
  a4 <= a WHEN sel = "11" ELSE
        '1';
  b4 <= b WHEN sel = "11" ELSE
        '1';
  c4 <= c WHEN sel = "11" ELSE
        '1';
  d4 <= d WHEN sel = "11" ELSE
        '1';
  e4 <= e WHEN sel = "11" ELSE
        '1';
  f4 <= f WHEN sel = "11" ELSE
        '1';
  g4 <= g WHEN sel = "11" ELSE
        '1';

END arch;
