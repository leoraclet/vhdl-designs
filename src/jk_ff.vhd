----------------------------------------------------------------------
--
-- Design unit:   Synchronous JK flip-flop
-- File name:     jk_ff.vhd
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

ENTITY jk_ff IS
  PORT (
    clk  : IN  STD_LOGIC;
    j, k : IN  STD_LOGIC;
    q    : OUT STD_LOGIC);
END jk_ff;

ARCHITECTURE rtl OF jk_ff IS
  SIGNAL jk        : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL jk_ff_reg : STD_LOGIC := '0'; -- Initialisation de la bascule
  -- Importante pour la simulation!
BEGIN
  jk <= j & k; -- Concatenation de deux signaux
  -- pour creer un vecteur de deux bits

  PROCESS (clk)
  BEGIN
    IF falling_edge(clk) THEN
      CASE jk IS
        WHEN "11" =>
          jk_ff_reg <= NOT jk_ff_reg;
        WHEN "01" =>
          jk_ff_reg <= '0';
        WHEN "10" =>
          jk_ff_reg <= '1';
        WHEN OTHERS =>
          jk_ff_reg <= jk_ff_reg;
      END CASE;
    END IF;
  END PROCESS;
  q <= jk_ff_reg;
END rtl;
