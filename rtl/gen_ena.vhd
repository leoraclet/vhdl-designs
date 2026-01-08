----------------------------------------------------------------------
--
-- Design unit:   Arbitrary 26-bits frequency divider
-- File name:     gen_ena.vhd
-- Description:   Sequential block used to divides input clock frequency
--                in order to obtain a 1Hz output signal frequency.
--
--                This design was thought to be used on a device with
--                a 50 MHz clock by default, which means you need to
--                divide the clock by 50 x 10^6 to get a 1 Hz clock.
--                And it happens you only need 26 bits to represente*
--                that number
--
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY gen_ena IS
  PORT (
    clkin   : IN  STD_LOGIC;
    ena_out : OUT STD_LOGIC);
END gen_ena;

ARCHITECTURE rtl OF gen_ena IS
  SIGNAL s : STD_LOGIC_VECTOR(25 DOWNTO 0) := "00000000000000000000000000"; -- 26 bits to count to: (50 x 10^6) - 1

BEGIN
  PROCESS (clkin)
  BEGIN
    IF rising_edge(clkin) THEN
      IF s = "10111110101111000001111111" THEN -- We choose here the duration of our period: (50 x 10^6) - 1
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
