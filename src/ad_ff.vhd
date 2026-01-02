----------------------------------------------------------------------
--
-- Design unit:   Asynchronous D flip-flop
-- File name:     ad_ff.vhd
-- Description:   Simple sequential block
--
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ad_ff IS
  PORT (
    d   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    ena : IN  STD_LOGIC;
    q   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0'));
END ad_ff;

ARCHITECTURE rtl OF ad_ff IS
BEGIN
  PROCESS (d, ena)
  BEGIN
    IF ena = '1' THEN
      q <= d;
    END IF;
  END PROCESS;
END rtl;
