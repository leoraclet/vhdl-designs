LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY tb_chrono_ski IS
END ENTITY;

ARCHITECTURE rtl OF tb_chrono_ski IS
  SIGNAL clk, init, CD, CA, start, a1, b1, c1, d1, e1, f1, g1, a2, b2, c2, d2, e2, f2, g2, L : STD_LOGIC;

  COMPONENT chrono_ski IS
    PORT (
      clk                        : IN  STD_LOGIC;
      init                       : IN  STD_LOGIC;
      CD                         : IN  STD_LOGIC;
      CA                         : IN  STD_LOGIC;
      start                      : IN  STD_LOGIC;
      a1, b1, c1, d1, e1, f1, g1 : OUT STD_LOGIC;
      a2, b2, c2, d2, e2, f2, g2 : OUT STD_LOGIC;
      L                          : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN

  clk   <= '0';
  init  <= '0', '1' AFTER 2 ns;
  start <= '0', '1' AFTER 15 ns;
  CA    <= '0', '1' AFTER 60 ns;
  CD    <= '0', '1' AFTER 100 ns;

  U0 : chrono_ski
  PORT MAP(
    clk   => clk,
    init  => init,
    CD    => CD,
    CA    => CA,
    start => start,
    a1    => a1,
    b1    => b1,
    c1    => c1,
    d1    => d1,
    e1    => e1,
    f1    => f1,
    g1    => g1,
    a2    => a2,
    b2    => b2,
    c2    => c2,
    d2    => d2,
    e2    => e2,
    f2    => f2,
    g2    => g2,
    L     => L
  );

  PROCESS
  BEGIN
    WAIT FOR 10 ns;
    clk <= NOT clk;
  END PROCESS;
END ARCHITECTURE;
