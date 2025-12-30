LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY decodeur_pap IS
  PORT (
    step               : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    PA1, PA2, PB1, PB2 : OUT STD_LOGIC
  );
END ENTITY;

ARCHITECTURE Behavioral OF decodeur_pap IS
  SIGNAL s : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
BEGIN
  WITH step SELECT
    s <= "1010" WHEN "0000",
    "1110" WHEN "0001",
    "0110" WHEN "0010",
    "0111" WHEN "0011",
    "0101" WHEN "0100",
    "1101" WHEN "0101",
    "1001" WHEN "0110",
    "1011" WHEN OTHERS;

  PA1 <= s(3);
  PA2 <= s(2);
  PB1 <= s(1);
  PB2 <= s(0);

END ARCHITECTURE;
