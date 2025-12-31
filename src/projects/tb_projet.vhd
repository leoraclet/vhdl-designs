LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;

ENTITY tb_projet IS
END tb_projet;

ARCHITECTURE rtl OF tb_projet IS
  COMPONENT TP_Projet_Reveil IS
    PORT (
      clk                        : IN  STD_LOGIC;
      reset                      : IN  STD_LOGIC;
      swah                       : IN  STD_LOGIC;
      swada                      : IN  STD_LOGIC;
      BPsetH                     : IN  STD_LOGIC;
      BPsetM                     : IN  STD_LOGIC;
      led1                       : OUT STD_LOGIC;
      led2                       : OUT STD_LOGIC;
      a1, b1, c1, d1, e1, f1, g1 : OUT STD_LOGIC;
      a2, b2, c2, d2, e2, f2, g2 : OUT STD_LOGIC;
      a3, b3, c3, d3, e3, f3, g3 : OUT STD_LOGIC;
      a4, b4, c4, d4, e4, f4, g4 : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL t_clk, t_reset, t_swah, t_swada, t_BPsetH, t_BPsetM, t_led1, t_led2 : STD_LOGIC;
  SIGNAL t_a1, t_b1, t_c1, t_d1, t_e1, t_f1, t_g1                            : STD_LOGIC;
  SIGNAL t_a2, t_b2, t_c2, t_d2, t_e2, t_f2, t_g2                            : STD_LOGIC;
  SIGNAL t_a3, t_b3, t_c3, t_d3, t_e3, t_f3, t_g3                            : STD_LOGIC;
  SIGNAL t_a4, t_b4, t_c4, t_d4, t_e4, t_f4, t_g4                            : STD_LOGIC;

BEGIN

  t_reset  <= '1', '0' AFTER 4 ps;
  t_swah   <= '0';
  t_swada  <= '0', '1' AFTER 20 ps;
  t_BPsetH <= '1';
  t_BPsetM <= '1';

  TP_Projet_Reveil_inst : TP_Projet_Reveil
  PORT MAP(
    clk    => t_clk,
    reset  => t_reset,
    swah   => t_swah,
    swada  => t_swada,
    BPsetH => t_BPsetH,
    BPsetM => t_BPsetM,
    led1   => t_led1,
    led2   => t_led2,
    a1     => t_a1,
    b1     => t_b1,
    c1     => t_c1,
    d1     => t_d1,
    e1     => t_e1,
    f1     => t_f1,
    g1     => t_g1,
    a2     => t_a2,
    b2     => t_b2,
    c2     => t_c2,
    d2     => t_d2,
    e2     => t_e2,
    f2     => t_f2,
    g2     => t_g2,
    a3     => t_a3,
    b3     => t_b3,
    c3     => t_c3,
    d3     => t_d3,
    e3     => t_e3,
    f3     => t_f3,
    g3     => t_g3,
    a4     => t_a4,
    b4     => t_b4,
    c4     => t_c4,
    d4     => t_d4,
    e4     => t_e4,
    f4     => t_f4,
    g4     => t_g4
  );

  PROCESS
  BEGIN
    t_clk <= '0', '1' AFTER 1 ps;
    WAIT FOR 2 ps;
  END PROCESS;

END ARCHITECTURE;
