----------------------------------------------------------------------
--
-- Place:         IUT Saint-Etienne
-- Design unit:   Hamming weight calculator
-- File name:     pds_hamm.vhd
-- Description:   .
-- Author:        Léo Raclet
-- Date:          18/10/2022
-- Revision:      December 2025
-- Last changes:  -
--
----------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY pds_hamm IS
  PORT (
    E  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0); -- 4-bits long word
    S1 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0); -- Result stored on 3 bits
    S2 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END pds_hamm;

ARCHITECTURE rtl OF pds_hamm IS
  SIGNAL A, B, C, D : STD_LOGIC;
BEGIN
  A <= E(0);
  B <= E(1);
  C <= E(2);
  D <= E(3);

  S1(0) <= A XOR B XOR C XOR D;
  S1(1) <= (C AND D AND NOT(A)) OR (B AND C AND NOT(D)) OR (C AND A AND NOT(B)) OR (A AND NOT(C) AND NOT(D)) OR (D AND NOT(A) AND B) OR (NOT(C) AND A AND B);
  S1(2) <= A AND B AND C AND D;

  -- Another way (more static) to achieve the same result
  -- The following truth table was used to derive the logic equations above
  --   WITH E SELECT
  --     S2 <= "000" WHEN "0000",
  --     "001" WHEN "0001",
  --     "001" WHEN "0010",
  --     "001" WHEN "0100",
  --     "001" WHEN "1000",
  --     "010" WHEN "0011",
  --     "010" WHEN "0101",
  --     "010" WHEN "1001",
  --     "010" WHEN "0110",
  --     "010" WHEN "1010",
  --     "010" WHEN "1100",
  --     "011" WHEN "0111",
  --     "011" WHEN "1011",
  --     "011" WHEN "1101",
  --     "011" WHEN "1110",
  --     "100" WHEN OTHERS;
END rtl;
