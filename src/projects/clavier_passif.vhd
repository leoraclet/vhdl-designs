LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY clavier_passif IS
  PORT (
    clk                 : IN  STD_LOGIC;
    resetb              : IN  STD_LOGIC;
    lignes              : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    colonnes            : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    a, b, c, d, e, f, g : OUT STD_LOGIC
  );
END ENTITY;

ARCHITECTURE rtl OF clavier_passif IS
  TYPE state_type IS (e0, e1, e2);
  SIGNAL state : state_type;
  SIGNAL cl    : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL s     : STD_LOGIC_VECTOR(3 DOWNTO 0);

  COMPONENT afficheur_7_segments IS
    PORT (
      entree              : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      a, b, c, d, e, f, g : OUT STD_LOGIC
    );
  END COMPONENT;
BEGIN
  U0 : afficheur_7_segments PORT MAP(s, a, b, c, d, e, f, g);

  PROCESS (clk, resetb)
  BEGIN
    IF resetb = '1' THEN
      cl    <= "1110";
      s     <= "0000";
      state <= e0;
    ELSIF rising_edge(clk) THEN
      CASE state IS
        WHEN e0 =>
          IF lignes = "1111" THEN
            IF cl = "1110" THEN
              cl <= "1101";
            ELSIF cl = "1101" THEN
              cl <= "1011";
            ELSIF cl = "1011" THEN
              cl <= "0111";
            ELSIF cl = "0111" THEN
              cl <= "1110";
            ELSE
              cl <= "1110";
            END IF;
          ELSE
            state <= e1;
          END IF;
        WHEN e1 =>
          IF lignes = "1110" THEN
            IF cl = "1011" THEN
              s <= "0000";
            ELSIF cl = "1101" THEN
              s <= "1011";
            ELSIF cl = "1110" THEN
              s <= "1111";
            ELSIF cl = "0111" THEN
              s <= "1010";
            END IF;
          ELSIF lignes = "1101" THEN
            IF cl = "1011" THEN
              s <= "1000";
            ELSIF cl = "1101" THEN
              s <= "1001";
            ELSIF cl = "1110" THEN
              s <= "1110";
            ELSIF cl = "0111" THEN
              s <= "0111";
            END IF;
          ELSIF lignes = "1011" THEN
            IF cl = "1011" THEN
              s <= "0101";
            ELSIF cl = "1101" THEN
              s <= "0110";
            ELSIF cl = "1110" THEN
              s <= "1101";
            ELSIF cl = "0111" THEN
              s <= "0100";
            END IF;
          ELSIF lignes = "0111" THEN
            IF cl = "1011" THEN
              s <= "0010";
            ELSIF cl = "1101" THEN
              s <= "0011";
            ELSIF cl = "1110" THEN
              s <= "1100";
            ELSIF cl = "0111" THEN
              s <= "0001";
            END IF;
          END IF;
          state <= e2;
        WHEN e2 =>
          IF lignes = "1111" THEN
            state <= e0;
          END IF;
      END CASE;
    END IF;
  END PROCESS;
  colonnes <= cl;
END ARCHITECTURE;
