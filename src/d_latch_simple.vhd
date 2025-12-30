----------------------------------------------------------------------
--
-- Design unit:   Asynchronous D flip-flop - D Latch
-- File name:     d_latch.vhd
-- Description:   Simple sequential block
-- Parameters:    No parameters
-- System:        VHDL'93
-- Autor:         Viktor Fischer, IUT UJM
-- Copyright:     IUT UJM 2006
-- Revision:      Version 1.00, October 2006
-- Last changes:  - ...
---------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d_latch_simple IS
  PORT (
    d   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    ena : IN  STD_LOGIC;
    q   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0'));
END d_latch_simple;

ARCHITECTURE rtl OF d_latch_simple IS
BEGIN
  PROCESS (d, ena)
  BEGIN
    IF ena = '1' THEN
      q <= d;
    END IF;
  END PROCESS;
END rtl;
