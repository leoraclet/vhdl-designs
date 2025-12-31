----------------------------------------------------------------------
--
-- Design unit:   .
-- File name:     mux4x1.vhd
-- Description:   .
--
----------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux4x1 IS
  PORT (
    A    : IN  STD_LOGIC;
    B    : IN  STD_LOGIC;
    C    : IN  STD_LOGIC;
    D    : IN  STD_LOGIC;
    COMM : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
    S1   : OUT STD_LOGIC;
    S2   : OUT STD_LOGIC;
    S3   : OUT STD_LOGIC);
END mux4x1;

ARCHITECTURE rtl OF mux4x1 IS
BEGIN
  S1 <= (A AND (NOT(COMM(0)) AND NOT(COMM(1)))) OR
        (B AND (COMM(0) AND NOT(COMM(1)))) OR
        (C AND (NOT(COMM(0)) AND COMM(1))) OR
        (D AND (COMM(0) AND COMM(1)));
  WITH COMM SELECT
    S2 <= A WHEN "00",
    B WHEN "01",
    C WHEN "10",
    D WHEN OTHERS;

  PROCESS (COMM)
  BEGIN
    CASE COMM IS
      WHEN "00"   => S3   <= A;
      WHEN "01"   => S3   <= B;
      WHEN "10"   => S3   <= C;
      WHEN OTHERS => S3   <= D;
    END CASE;
  END PROCESS;

END rtl;
