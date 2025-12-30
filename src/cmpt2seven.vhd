---------------------------------
-- IUT Saint-Etienne
-- Filename:  cmpt2seven.vhd
-- Edited by: Leo Raclet
-- Date:      26/01/2022
---------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY cmpt2seven IS
  PORT (
    clk                 : IN  STD_LOGIC;
    dir                 : IN  STD_LOGIC;
    n_rst               : IN  STD_LOGIC;
    a, b, c, d, e, f, g : OUT STD_LOGIC);
END cmpt2seven;

ARCHITECTURE cmpt OF cmpt2seven IS

  SIGNAL u1_out : STD_LOGIC;
  SIGNAL u2_out : STD_LOGIC_VECTOR(3 DOWNTO 0);

  COMPONENT bin2seven
    PORT (
      bin                 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      a, b, c, d, e, f, g : OUT STD_LOGIC);
  END COMPONENT;

  COMPONENT cmpt4_bidirena
    PORT (
      clk   : IN  STD_LOGIC;
      ena   : IN  STD_LOGIC;
      dir   : IN  STD_LOGIC;
      n_rst : IN  STD_LOGIC;
      cmpto : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
  END COMPONENT;

  COMPONENT gen_ena
    PORT (
      clkin   : IN  STD_LOGIC;
      ena_out : OUT STD_LOGIC);
  END COMPONENT;

BEGIN

  u1 : gen_ena PORT MAP(
    clkin   => clk,
    ena_out => u1_out);

  u2 : cmpt4_bidirena PORT MAP(
    clk   => clk,
    ena   => u1_out,
    dir   => dir,
    n_rst => n_rst,
    cmpto => u2_out);

  u3 : bin2seven PORT MAP(
    bin => u2_out,
    a   => a,
    b   => b,
    c   => c,
    d   => d,
    e   => e,
    f   => f,
    g   => g);

END cmpt;
