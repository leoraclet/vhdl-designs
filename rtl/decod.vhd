----------------------------------------------------------------------
--
-- Design unit:   Address decoder with latch
-- File name:     decod.vhd
-- Description:   Ssequential block used to decode addresses
--
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL; -- Necessary to make comparison

ENTITY decod IS
  GENERIC (BASE : NATURAL := 64);
  PORT (
    a_d : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    ale : IN  STD_LOGIC;
    hit : OUT STD_LOGIC);
END decod;

ARCHITECTURE rtl OF decod IS
BEGIN
  PROCESS (a_d, ale)
  BEGIN
    IF ale = '1' THEN
      IF (a_d(7 DOWNTO 0) >= BASE) THEN -- More universal solution
        -- IF (a_d(7) = '1') THEN -- Simpler solution
        hit <= '1';
      ELSE
        hit <= '0';
      END IF;
    END IF;
  END PROCESS;
END rtl;
