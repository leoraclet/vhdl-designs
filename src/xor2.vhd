----------------------------------------------------------------------
--
-- Place:         IUT Saint-Etienne
-- Design unit:   Binary XOR
-- File name:     xor2.vhd
-- Description:   .
-- Author:        Léo Raclet
-- Date:          18/10/2022
-- Revision:      December 2025
-- Last changes:  -
--
----------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY xor2 IS
  PORT (
    i1 : IN  STD_LOGIC;
    i2 : IN  STD_LOGIC;
    o  : OUT STD_LOGIC
  );
END xor2;

ARCHITECTURE rtl OF xor2 IS
BEGIN
  o <= i1 XOR i2;
END rtl;
