LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY tb_clavier_passif IS
END ENTITY;

ARCHITECTURE test OF tb_clavier_passif IS
  SIGNAL clk                 : STD_LOGIC                    := '0';
  SIGNAL resetb              : STD_LOGIC                    := '0';
  SIGNAL lignes              : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111";
  SIGNAL colonnes            : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL a, b, c, d, e, f, g : STD_LOGIC;

  COMPONENT clavier_passif IS
    PORT (
      clk                 : IN  STD_LOGIC;
      resetb              : IN  STD_LOGIC;
      lignes              : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      colonnes            : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      a, b, c, d, e, f, g : OUT STD_LOGIC
    );
  END COMPONENT;

BEGIN

  resetb <= '1', '0' AFTER 2 ns;
  lignes <= "0111" AFTER 100 ns;

  U0 : clavier_passif
  PORT MAP(
    clk      => clk,
    resetb   => resetb,
    lignes   => lignes,
    colonnes => colonnes,
    a        => a,
    b        => b,
    c        => c,
    d        => d,
    e        => e,
    f        => f,
    g        => g
  );

  PROCESS
  BEGIN
    WAIT FOR 10 ns;
    clk <= NOT clk;
  END PROCESS;
END ARCHITECTURE;
