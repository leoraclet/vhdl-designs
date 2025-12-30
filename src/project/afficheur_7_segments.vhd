LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY afficheur_7_segments IS
  PORT (
    entree              : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    a, b, c, d, e, f, g : OUT STD_LOGIC
  );
END ENTITY;

ARCHITECTURE Behavioral OF afficheur_7_segments IS
  SIGNAL s : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
  WITH entree SELECT
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
    "0110001" WHEN "1100",
    "1000010" WHEN "1101",
    "0110000" WHEN "1110",
    "0111000" WHEN OTHERS;

  a <= NOT s(6);
  b <= NOT s(5);
  c <= NOT s(4);
  d <= NOT s(3);
  e <= NOT s(2);
  f <= NOT s(1);
  g <= NOT s(0);

  --  si actif haut, alors on inverse
  --   a <= not s(6);
  --   b <= not s(5);
  --   c <= not s(4);
  --   d <= not s(3);
  --   e <= not s(2);
  --   f <= not s(1);
  --   g <= not s(0);
END ARCHITECTURE;
