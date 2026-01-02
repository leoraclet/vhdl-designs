----------------------------------------------------------------------
--
-- Design unit:   Synchronous D flip-flop
-- File name:     d_ff.vhd
-- Description:   Asynchronous reset
--
---------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d_ff IS
  PORT (
    clk, raz : IN  STD_LOGIC;
    d        : IN  STD_LOGIC;
    q        : OUT STD_LOGIC);
END d_ff;

ARCHITECTURE rtl OF d_ff IS
BEGIN
  PROCESS (clk, raz)
  BEGIN
    IF raz = '0' THEN
      q <= '0';
    ELSIF rising_edge(clk) THEN
      q <= d;
    END IF;
  END PROCESS;
END rtl;
