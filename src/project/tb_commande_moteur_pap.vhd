LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_commande_moteur_pap IS
END ENTITY;

ARCHITECTURE test OF tb_commande_moteur_pap IS
  COMPONENT commande_moteur_pap
    PORT (
      clk                : IN  STD_LOGIC;
      dir                : IN  STD_LOGIC;
      stop               : IN  STD_LOGIC;
      n_rst              : IN  STD_LOGIC;
      fck                : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
      PA1, PA2, PB1, PB2 : OUT STD_LOGIC);
  END COMPONENT;

  SIGNAL clk, dir, stop, n_rst, PA1, PA2, PB1, PB2 : STD_LOGIC;
  SIGNAL fck                                       : STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN

  U0 : commande_moteur_pap
  PORT MAP(
    clk   => clk,
    dir   => dir,
    stop  => stop,
    n_rst => n_rst,
    fck   => fck,
    PA1   => PA1,
    PA2   => PA2,
    PB1   => PB1,
    PB2   => PB2);

  n_rst <= '0', '1' AFTER 150 ns;
  dir   <= '0';
  stop  <= '0';
  fck   <= "00";

  clock : PROCESS
  BEGIN
    clk <= '1', '0' AFTER 5 ns;
    WAIT FOR 10 ns;
  END PROCESS;

END ARCHITECTURE;
