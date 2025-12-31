-----------------------------
-- IUT Saint-Etienne
-- Filename:  gen_ena.vhd
-----------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY gen_ena IS
  PORT (
    clkin   : IN  STD_LOGIC;
    rst     : IN  STD_LOGIC;
    ena_out : OUT STD_LOGIC);
END gen_ena;

ARCHITECTURE rtl OF gen_ena IS
  SIGNAL s : STD_LOGIC_VECTOR(25 DOWNTO 0) := "00000000000000000000000000"; -- 26 bits to count to: (50 x 10^6) - 1

BEGIN
  PROCESS (clkin, rst)
  BEGIN
    IF rst = '1' THEN
      s <= "00000000000000000000000000";
    ELSIF rising_edge(clkin) THEN
      IF s = "10111110101111000001111111" THEN -- On compte jusqu'à (50 x 10^6) - 1, car F = 50 MHz: 10111110101111000001111111
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
END rtl;
