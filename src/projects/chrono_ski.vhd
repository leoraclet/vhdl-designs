LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY chrono_ski IS
  PORT (
    clk                        : IN  STD_LOGIC;
    init                       : IN  STD_LOGIC;
    CD                         : IN  STD_LOGIC;
    CA                         : IN  STD_LOGIC;
    start                      : IN  STD_LOGIC;
    a1, b1, c1, d1, e1, f1, g1 : OUT STD_LOGIC;
    a2, b2, c2, d2, e2, f2, g2 : OUT STD_LOGIC;
    L                          : OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE rtl OF chrono_ski IS
  TYPE state_type IS (s0, s1, s2, s3);
  SIGNAL state    : state_type;
  SIGNAL cmpt1    : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL cmpt2    : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL ena_cmpt : STD_LOGIC;

  COMPONENT afficheur_7_segments IS
    PORT (
      entree              : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      a, b, c, d, e, f, g : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  PROCESS (clk, init)
  BEGIN
    IF init = '0' THEN
      state    <= s0;
      ena_cmpt <= '1';
    ELSIF rising_edge(clk) THEN
      CASE state IS
        WHEN s0 =>
          IF start = '1' THEN
            state <= s1;
            cmpt1 <= "0000";
            cmpt2 <= "0000";
          END IF;
        WHEN s1 =>
          IF CD = '1' THEN
            state <= s2;
            L     <= '1';
          END IF;
        WHEN s2 =>
          IF CA = '1' THEN
            state <= s3;
            L     <= '0';
          ELSE
            IF ena_cmpt = '1' THEN
              IF cmpt1 = "1001" THEN
                cmpt1 <= "0000";
                cmpt2 <= cmpt2 + 1;
              ELSE
                cmpt1 <= cmpt1 + 1;
              END IF;
            END IF;
          END IF;
        WHEN OTHERS =>
      END CASE;
    END IF;
  END PROCESS;

  U0 : afficheur_7_segments
  PORT MAP(
    entree => cmpt1,
    a      => a1,
    b      => b1,
    c      => c1,
    d      => d1,
    e      => e1,
    f      => f1,
    g      => g1
  );

  U1 : afficheur_7_segments
  PORT MAP(
    entree => cmpt2,
    a      => a2,
    b      => b2,
    c      => c2,
    d      => d2,
    e      => e2,
    f      => f2,
    g      => g2
  );

END ARCHITECTURE;
