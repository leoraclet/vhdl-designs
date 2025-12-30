----------------------------------------------------------------------
--
-- Design unit:   Decoder binary (4 bits) to seven segments
-- File name:     bin2seven.vhd
-- Description:   Combinatorial block used to decode
--                4-bit binary input to 7 segment LED
--                display. Active segments are in level 0.
--                Segment coding
--                      aaaaa
--                     f     b
--                     f     b
--                      ggggg
--                     e     c
--                     e     c
--                      ddddd
--
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

ENTITY bin2seven_2 IS
  PORT (
    bin : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    a   : OUT STD_LOGIC;
    b   : OUT STD_LOGIC;
    c   : OUT STD_LOGIC;
    d   : OUT STD_LOGIC;
    e   : OUT STD_LOGIC;
    f   : OUT STD_LOGIC;
    g   : OUT STD_LOGIC
  );
END bin2seven_2;

ARCHITECTURE rtl OF bin2seven_2 IS
  SIGNAL leds : STD_LOGIC_VECTOR(6 DOWNTO 0);

BEGIN
  WITH bin SELECT
    --      abcdefg
    leds <= "0000001" WHEN "0000", -- 0
    "1001111" WHEN "0001",         -- 1
    "0010010" WHEN "0010",         -- 2
    "0000110" WHEN "0011",         -- 3
    "1001100" WHEN "0100",         -- 4
    "0100100" WHEN "0101",         -- 5
    "0100000" WHEN "0110",         -- 6
    "0001111" WHEN "0111",         -- 7
    "0000000" WHEN "1000",         -- 8
    "0000100" WHEN "1001",         -- 9
    "0001000" WHEN "1010",         -- a
    "1100000" WHEN "1011",         -- b
    "1100010" WHEN "1100",         -- c
    "1000010" WHEN "1101",         -- d
    "0110000" WHEN "1110",         -- e
    "0111000" WHEN OTHERS;         -- f

  a <= leds(6);
  b <= leds(5);
  c <= leds(4);
  d <= leds(3);
  e <= leds(2);
  f <= leds(1);
  g <= leds(0);

END rtl;
