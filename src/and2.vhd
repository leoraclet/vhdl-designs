----------------------------------------------------------------------
--
-- Place:         IUT Saint-Etienne
-- Design unit:   Simple 2-bits AND logic gate
-- File name:     and2.vhd
-- Description:   The circuit =>
-- System:        VHDL'93
-- Author:        Léo Raclet
-- Date:          26/01/2022
-- Revision:      December 2025
-- Last changes:  -
--
----------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY and2 IS
  PORT (
    x1 : IN  STD_LOGIC;
    x2 : IN  STD_LOGIC;
    y  : OUT STD_LOGIC
  );
END and2;

ARCHITECTURE rtl OF and2 IS
BEGIN
  y <= x1 AND x2;
END rtl;
