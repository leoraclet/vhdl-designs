----------------------------------------------------------------------
--
-- Design unit:   Synchronous 8-bit register
-- File name:     reg.vhd
-- Description:   Simple sequential block used to store 8 bits
--
---------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg IS
  PORT (
    clk, raz : IN  STD_LOGIC;
    ena      : IN  STD_LOGIC;
    d        : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    q        : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END reg;

ARCHITECTURE rtl OF reg IS
  SIGNAL q_int : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
  PROCESS (clk, raz)
  BEGIN
    IF raz = '1' THEN
      q_int <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      IF ena = '1' THEN
        q_int <= d;
        --   ELSE -- Memorisation explicite
        --     q_int <= q_int; -- Memorisation explicite
      END IF;
    END IF;
  END PROCESS;
  q <= q_int;
END rtl;
