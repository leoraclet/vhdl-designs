LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY afficheur_dyna IS
  PORT (
    rst, clk                   : IN  STD_LOGIC;
    eHD, eHU, eMD, eMU         : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    a1, b1, c1, d1, e1, f1, g1 : OUT STD_LOGIC;
    a2, b2, c2, d2, e2, f2, g2 : OUT STD_LOGIC;
    a3, b3, c3, d3, e3, f3, g3 : OUT STD_LOGIC;
    a4, b4, c4, d4, e4, f4, g4 : OUT STD_LOGIC);
END afficheur_dyna;

ARCHITECTURE arch OF afficheur_dyna IS

  COMPONENT multiplexeur_affdyna
    PORT (
      sel                : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
      eHD, eHU, eMD, eMU : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      sDyn               : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)

    );
  END COMPONENT;

  COMPONENT machine_affdyna
    PORT (
      rst, clk : IN  STD_LOGIC;
      s_sel    : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT demultiplexeur_affdyna
    PORT (
      sel                        : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
      a1, b1, c1, d1, e1, f1, g1 : OUT STD_LOGIC;
      a2, b2, c2, d2, e2, f2, g2 : OUT STD_LOGIC;
      a3, b3, c3, d3, e3, f3, g3 : OUT STD_LOGIC;
      a4, b4, c4, d4, e4, f4, g4 : OUT STD_LOGIC;
      a, b, c, d, e, f, g        : IN  STD_LOGIC

    );
  END COMPONENT;

  COMPONENT decodeur7seg
    PORT (
      input               : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      a, b, c, d, e, f, g : OUT STD_LOGIC);
  END COMPONENT;

  -- Signal Multiplex
  SIGNAL i_sDyn : STD_LOGIC_VECTOR(3 DOWNTO 0);
  -- Signal FSM
  SIGNAL i_sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
  -- Signal decodeur
  SIGNAL i_a, i_b, i_c, i_d, i_e, i_f, i_g : STD_LOGIC;
  -- Signal demux

BEGIN
  U0 : multiplexeur_affdyna PORT MAP(i_sel, eHD, eHU, eMD, eMU, i_sDyn);
  U1 : machine_affdyna PORT MAP(rst, clk, i_sel);
  U2 : decodeur7seg PORT MAP(i_sDyn, i_a, i_b, i_c, i_d, i_e, i_f, i_g);
  U3 : demultiplexeur_affdyna PORT MAP(
    i_sel,
    a1, b1, c1, d1, e1, f1, g1,
    a2, b2, c2, d2, e2, f2, g2,
    a3, b3, c3, d3, e3, f3, g3,
    a4, b4, c4, d4, e4, f4, g4,
    i_a, i_b, i_c, i_d, i_e, i_f, i_g);
END arch;
