----------------------------------------------------------------------
--
-- Design unit:   Synchronous D flip-flop
-- File name:     d_ff.vhd
-- Description:   Simple sequential block
-- Parameters:    No parameters
-- System:        VHDL'93
-- Autor:         Viktor Fischer, IUT UJM
-- Copyright:     IUT UJM 2006
-- Revision:      Version 1.00, December 2007
-- Last changes:  - ...
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
