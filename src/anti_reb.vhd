----------------------------------------------------------------------
--
-- Design unit:   Simple de-bouncer unit
-- File name:     anti_reb.vhd
-- Description:   The circuit permits to de-bounce the signal from
--                a mechanical switch. It uses a 100 Hz clock signal
--                in order to sample the switch output signal. The
--                original signal and registered signals are compared:
--                if they are identical, they determine the value
--                saved in the next flip-flop. If they are different,
--                the flip-flop value is not modified.
--
---------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY anti_reb IS
  PORT (
    clk100              : IN  STD_LOGIC;
    bouton              : IN  STD_LOGIC;
    bouton_sans_rebonds : OUT STD_LOGIC);
END anti_reb;

ARCHITECTURE rtl OF anti_reb IS
  SIGNAL bouton_reg : STD_LOGIC;
BEGIN
  PROCESS (clk100)
  BEGIN
    IF rising_edge(clk100) THEN
      bouton_reg <= bouton;
      IF (bouton_reg = bouton) THEN
        bouton_sans_rebonds <= bouton;
      END IF;
    END IF;
  END PROCESS;
END rtl;
