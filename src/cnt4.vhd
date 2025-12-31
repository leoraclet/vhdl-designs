----------------------------------------------------------------------
--
-- Design unit:   Asynchronous 4-bit counter using D flip-flops
-- File name:     cnt4.vhd
-- Description:   Simple sequential block
--
----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY cnt4 IS
  PORT (
    clk : IN  STD_LOGIC;
    cnt : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END cnt4;

ARCHITECTURE rtl OF cnt4 IS
  SIGNAL d_reg      : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL d_reg2_out : STD_LOGIC;
  SIGNAL d_reg1_out : STD_LOGIC;
  SIGNAL d_reg0_out : STD_LOGIC;

BEGIN
  PROCESS (clk)
  BEGIN
    IF rising_edge(clk) THEN
      d_reg(0) <= NOT d_reg(0);
    END IF;
  END PROCESS;
  d_reg0_out <= d_reg(0);
  cnt(0)     <= NOT d_reg(0);

  PROCESS (d_reg0_out)
  BEGIN
    IF rising_edge(d_reg0_out) THEN
      d_reg(1) <= NOT d_reg(1);
    END IF;
  END PROCESS;
  d_reg1_out <= d_reg(1);
  cnt(1)     <= NOT d_reg(1);

  PROCESS (d_reg1_out)
  BEGIN
    IF rising_edge(d_reg1_out) THEN
      d_reg(2) <= NOT d_reg(2);
    END IF;
  END PROCESS;
  d_reg2_out <= d_reg(2);
  cnt(2)     <= NOT d_reg(2);

  PROCESS (d_reg2_out)
  BEGIN
    IF rising_edge(d_reg2_out) THEN
      d_reg(3) <= NOT d_reg(3);
    END IF;
  END PROCESS;
  cnt(3) <= NOT d_reg(3);

END rtl;
