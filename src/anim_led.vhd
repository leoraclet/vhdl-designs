----------------------------------------------------------------------
--
-- Place:         IUT Saint-Etienne
-- Design unit:   Animated LED unit
-- File name:     anim_led.vhd
-- Description:   The circuit =>
-- System:        VHDL'93
-- Author:        Léo Raclet
-- Date:          26/01/2022
-- Revision:
-- Last changes:  -
--
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY anim_led IS
  PORT (
    clk            : IN  STD_LOGIC;
    rst            : IN  STD_LOGIC;
    b1, b2         : IN  STD_LOGIC;
    l1, l2, l3, l4 : OUT STD_LOGIC);
END anim_led;

ARCHITECTURE rtl OF anim_led IS

  SIGNAL led : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL l   : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

BEGIN
  PROCESS (clk, rst)
  BEGIN
    IF rst = '0' THEN
      l <= "0000";
    ELSIF rising_edge(clk) THEN
      IF b1 = '1' THEN
        IF l(0) = '0' THEN
          led(0) <= '1';
        ELSE
          led(1) <= '1';
        END IF;
      END IF;
      IF b2 = '1' THEN
        IF l(2) = '0' THEN
          led(2) <= '1';
        ELSE
          led(3) <= '1';
        END IF;
      END IF;
      IF b1 = '0' THEN
        IF led(0) = '1' THEN
          l(0) <= '1';
        END IF;
        IF led(1) = '1' THEN
          l(1) <= '1';
        END IF;
      END IF;
      IF b2 = '0' THEN
        IF led(2) = '1' THEN
          l(2) <= '1';
        END IF;
        IF led(3) = '1' THEN
          l(3) <= '1';
        END IF;
      END IF;
    END IF;
  END PROCESS;

  l1 <= l(0);
  l2 <= l(1);
  l3 <= l(2);
  l4 <= l(3);

END rtl;
