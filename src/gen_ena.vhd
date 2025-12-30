-----------------------------
-- IUT Saint-Etienne
-- Filename:  gen_ena.vhd
-- Edited by: Leo Raclet
-- Date:      26/01/2022
-----------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY gen_ena IS
  PORT (
    clkin   : IN  STD_LOGIC;
    ena_out : OUT STD_LOGIC);
END gen_ena;

ARCHITECTURE ena OF gen_ena IS
  SIGNAL s : STD_LOGIC_VECTOR(25 DOWNTO 0) := "00000000000000000000000000"; -- 26 bits to count to: (50 x 10^6) - 1

BEGIN
  PROCESS (clkin)
  BEGIN
    IF rising_edge(clkin) THEN
      IF s = "00000000000000000000100000" THEN -- On choisit ici une valeur de 32, car compter jusqu'� (50 x 10^6) - 1 serait beacuoup trop long
        s <= "00000000000000000000000000";
      ELSE
        s <= s + 1;
      END IF;
    END IF;

    IF s = "00000000000000000000000000" THEN
      ena_out <= '1';
    ELSE
      ena_out <= '0';
    END IF;
  END PROCESS;
END ena;
