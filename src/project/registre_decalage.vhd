LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY registre_decalage IS
  PORT (
    entree, clk, reset : IN  STD_LOGIC;
    sortie             : OUT STD_LOGIC
  );
END ENTITY;

ARCHITECTURE Behavioral OF registre_decalage IS
  COMPONENT bascule_d
    PORT (
      d, clk, reset : IN  STD_LOGIC;
      q, notq       : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL q0, q1, q2, q3             : STD_LOGIC;
  SIGNAL notq0, notq1, notq2, notq3 : STD_LOGIC;
BEGIN
  U0 : bascule_d PORT MAP(entree, clk, reset, q0, notq0);
  U1 : bascule_d PORT MAP(q0, clk, reset, q1, notq1);
  U2 : bascule_d PORT MAP(q1, clk, reset, q2, notq2);
  U3 : bascule_d PORT MAP(q2, clk, reset, q3, notq3);
  sortie <= q3;
END ARCHITECTURE;
