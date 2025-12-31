----------------------------------------------------------------------
--
-- Design unit:   T-latch using a D-latch
-- File name:     t_latch.vhd
-- Description:   .
--
----------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY t_latch IS
  PORT (
    clk   : IN  STD_LOGIC;
    reset : IN  STD_LOGIC;
    Q     : OUT STD_LOGIC);
END t_latch;

ARCHITECTURE rtl OF t_latch IS
  COMPONENT d_latch_v2 IS
    PORT (
      clk   : IN  STD_LOGIC;
      ena   : IN  STD_LOGIC;
      D     : IN  STD_LOGIC;
      RESET : IN  STD_LOGIC;
      Q     : OUT STD_LOGIC;
      notQ  : OUT STD_LOGIC);
  END COMPONENT;
  SIGNAL tmp : STD_LOGIC;
BEGIN
  u1 : d_latch_v2 PORT MAP(
    clk   => clk,
    ena   => '1',
    D     => tmp,
    RESET => reset,
    Q     => Q,
    notQ  => tmp);
END rtl;
