---------------------------------
-- IUT Saint-Etienne
-- Filename:  cmpt4_bidirena.vhd
---------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY inc4bits IS
  PORT (
    clk     : IN  STD_LOGIC;
    swah    : IN  STD_LOGIC;
    rst     : IN  STD_LOGIC;
    ena_in  : IN  STD_LOGIC;
    lim     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    inc     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    ena_out : OUT STD_LOGIC
  );
END inc4bits;

ARCHITECTURE rtl OF inc4bits IS
  SIGNAL s : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

BEGIN
  PROCESS (clk, rst)
  BEGIN
    IF rst = '1' THEN
      s <= "0000";
    ELSIF rising_edge(clk) THEN
      IF ena_in = '1' AND swah = '1' THEN
        IF s = lim THEN
          s       <= "0000";
          ena_out <= '1';
        ELSE
          s <= s + 1;
        END IF;
      END IF;
    END IF;
  END PROCESS;

  inc <= s;

END rtl;
