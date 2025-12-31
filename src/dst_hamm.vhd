----------------------------------------------------------------------
--
-- Design unit:   Computes hamming distance between two 4-bits inputs
-- File name:     dst_hamm.vhd
-- Description:   .
--
----------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY dst_hamm IS
  PORT (
    E1 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    E2 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    S  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
END dst_hamm;

ARCHITECTURE rtl OF dst_hamm IS
  COMPONENT pds_hamm IS
    PORT (
      E : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      S : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
  END COMPONENT;

  SIGNAL HW1 : STD_LOGIC_VECTOR(2 DOWNTO 0);
  SIGNAL HW2 : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
  c1 : pds_hamm PORT MAP(E1, HW1);
  c2 : pds_hamm PORT MAP(E2, HW2);

  S <= HW1 XOR HW2;

END rtl;
