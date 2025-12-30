----------------------------------------------------------------------
--
-- Design unit:   Four-channel multiplexer
-- File name:     mux4x8.vhd
-- Description:   Combinatorial block used to switch
--                one of the 8-bit inputs to the output.
-- Parameters:    No parameters
-- System:        VHDL'93
-- Autor:         Viktor Fischer, IUT UJM
-- Copyright:     IUT UJM 2006
-- Revision:      Version 1.00, September 2006
-- Last changes:  - ...
--
---------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux4x8 IS
  PORT (
    a     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    b     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    c     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    d     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    sel   : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
    oe    : IN  STD_LOGIC;
    d_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END mux4x8;

ARCHITECTURE rtl OF mux4x8 IS
  -- Internal signals declaration
  SIGNAL a_int, b_int : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL d_int        : STD_LOGIC_VECTOR(7 DOWNTO 0);

  -- Priority encoder declaration
  COMPONENT mux2x8
    PORT (
      a     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
      b     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
      sel   : IN  STD_LOGIC;
      d_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  END COMPONENT;

BEGIN
  u1 : mux2x8 PORT MAP(
    a     => a,
    b     => b,
    sel   => sel(0),
    d_out => a_int);

  u2 : mux2x8 PORT MAP(
    a     => c,
    b     => d,
    sel   => sel(0),
    d_out => b_int);

  u3 : mux2x8 PORT MAP(
    a     => a_int,
    b     => b_int,
    sel   => sel(1),
    d_out => d_int);

  -- Tri state outputs
  d_out <= d_int WHEN oe = '1' ELSE
           (OTHERS => 'Z');

END rtl;
