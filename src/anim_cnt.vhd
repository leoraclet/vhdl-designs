-----------------------------
-- IUT Saint-Etienne
-- Filename:  anim_cnt.vhd
-----------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY anim_cnt IS
  PORT (
    clk     : IN  STD_LOGIC;
    n_reset : IN  STD_LOGIC;
    cnt     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END anim_cnt;

ARCHITECTURE rtl OF anim_cnt IS

  TYPE states IS (e1, e2, e3, e4);

  SIGNAL sm       : states;
  SIGNAL dir, ena : STD_LOGIC;
  SIGNAL cnt_s    : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

  COMPONENT gen_ena
    PORT (
      clkin   : IN  STD_LOGIC;
      ena_out : OUT STD_LOGIC);
  END COMPONENT;

BEGIN

  u1 : gen_ena PORT MAP(
    clkin   => clk,
    ena_out => ena);
  PROCESS (clk, n_reset)
  BEGIN
    IF n_reset = '0' THEN
      cnt_s <= "0000";
    ELSIF rising_edge(clk) THEN
      IF ena = '1' THEN
        IF dir = '0' THEN
          cnt_s <= cnt_s + 1;
        ELSE
          cnt_s <= cnt_s - 1;
        END IF;
      END IF;
    END IF;
  END PROCESS;

  PROCESS (clk, n_reset)
  BEGIN
    IF n_reset = '0' THEN
      sm <= e1;
    ELSIF rising_edge(clk) THEN
      IF ena = '1' THEN
        CASE sm IS
          WHEN e1 =>
            IF cnt_s = "1000" THEN
              sm <= e2;
            END IF;
          WHEN e2 =>
            IF cnt_s = "0110" THEN
              sm <= e3;
            END IF;
          WHEN e3 =>
            IF cnt_s = "0110" THEN
              sm <= e4;
            END IF;
          WHEN e4 =>
            IF cnt_s = "0001" THEN
              sm <= e1;
            END IF;
          WHEN OTHERS =>
            sm <= e1;
        END CASE;
      END IF;
    END IF;
  END PROCESS;

  dir <= '1' WHEN sm = e2 OR sm = e4 ELSE
         '0';
  cnt <= cnt_s;

END rtl;
