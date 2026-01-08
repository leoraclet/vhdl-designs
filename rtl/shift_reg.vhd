----------------------------------------------------------------------
--
-- Design unit:   N-bits Shift Register
-- File name:     clk_halve.vhd
-- Description:   Sequential block that implements a N-bits shift
--                register using concatenation
--
----------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY shift_reg IS
  GENERIC (
    N : INTEGER := 32
  );
  PORT (
    clk      : IN  STD_LOGIC;                       -- Clock input
    reset    : IN  STD_LOGIC;                       -- Reset input (active high)
    data_in  : IN  STD_LOGIC;                       -- Serial data input
    data_out : OUT STD_LOGIC_VECTOR(N - 1 DOWNTO 0) -- Parallel data output
  );
END shift_reg;

ARCHITECTURE rtl OF shift_reg IS
  SIGNAL reg : STD_LOGIC_VECTOR(N - 1 DOWNTO 0) := (OTHERS => '0');
BEGIN
  PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      reg <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      reg <= reg(N - 2 DOWNTO 0) & data_in; -- Shift right and load new bit
    END IF;
  END PROCESS;

  data_out <= reg;
END rtl;
