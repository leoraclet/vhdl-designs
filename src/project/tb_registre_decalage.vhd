LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY tb_registre_decalage IS
END ENTITY;

ARCHITECTURE modele_test OF tb_registre_decalage IS
  COMPONENT registre_decalage
    PORT (
      entree, clk, reset : IN  STD_LOGIC;
      sortie             : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL entree_int, clk_int, reset_int, sortie_int : STD_LOGIC;
BEGIN
  U0 : registre_decalage PORT MAP(entree_int, clk_int, reset_int, sortie_int);
  entree_int <= '0', '1' AFTER 20 ns;
  reset_int  <= '0', '1' AFTER 80 ns, '0' AFTER 100 ns;

  clock : PROCESS
  BEGIN
    clk_int <= '1', '0' AFTER 5 ns;
    WAIT FOR 10 ns;
  END PROCESS;
END ARCHITECTURE;
