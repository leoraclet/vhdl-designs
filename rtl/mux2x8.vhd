----------------------------------------------------------------------
--
-- Design unit:   Two-channel multiplexer
-- File name:     mux2x8.vhd
-- Description:   Combinatorial block used to switch
--                one of the 8-bit inputs to the output.
--
---------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux2x8 IS
  PORT (
    a     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    b     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    sel   : IN  STD_LOGIC;
    d_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END mux2x8;

ARCHITECTURE rtl OF mux2x8 IS
BEGIN
  d_out <= a WHEN sel = '0' ELSE
           b;
END rtl;
