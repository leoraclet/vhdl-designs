----------------------------------------------------------------------
--
-- Design unit:   4-bits register
-- File name:     reg_4bits.vhd
-- Description:   Simple sequential block using D Flip-Flop to store
--                4 bits of information
--
----------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY reg_4bits IS
  PORT (
    clk   : IN  STD_LOGIC;
    D     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    reset : IN  STD_LOGIC;
    Q     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END reg_4bits;

ARCHITECTURE rtl OF reg_4bits IS
BEGIN
  PROCESS (clk, reset)
  BEGIN
    IF rising_edge(clk) THEN
      IF reset = '1' THEN
        Q <= "0000";
      ELSE
        Q <= D;
      END IF;
    END IF;
  END PROCESS;
END rtl;
