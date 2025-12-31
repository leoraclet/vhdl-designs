----------------------------------------------------------------------
--
-- Design unit:   Synchronous counter up to 5 using D flip-flops
-- File name:     cnt4.vhd
-- Description:   .
--
---------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY compteur IS
  PORT (
    clk   : IN  STD_LOGIC;
    reset : IN  STD_LOGIC;
    S     : OUT STD_LOGIC);
END compteur;

ARCHITECTURE rtl OF compteur IS
  SIGNAL Q : INTEGER RANGE 0 TO 5 := 0;
BEGIN
  PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Q <= 0;
      S <= '0';
    ELSIF rising_edge(clk) THEN
      IF Q = 5 THEN
        Q <= 0;
      ELSE
        Q <= Q + 1;
        IF Q >= 3 THEN
          S <= '1';
        ELSE
          S <= '0';
        END IF;
      END IF;
    END IF;
  END PROCESS;
END rtl;

--LIBRARY IEEE;
--USE IEEE.STD_LOGIC_1164.ALL;
--USE IEEE.STD_LOGIC_UNSIGNED.ALL;
--USE IEEE.NUMERIC_STD.ALL;
--
--ENTITY compteur IS
--	PORT (clk:   IN STD_LOGIC;
--				reset: IN STD_LOGIC;
--				S:     OUT STD_LOGIC);
--END compteur;
--
--ARCHITECTURE rtl OF compteur IS
--	SIGNAL Q: STD_LOGIC_VECTOR(2 DOWNTO 0);
--	SIGNAL D: STD_LOGIC_VECTOR(2 DOWNTO 0);
--BEGIN
--	PROCESS(clk, reset)
--	BEGIN
--		IF reset = '1' THEN
--			Q <= "000";
--		ELSIF rising_edge(clk) THEN
--			IF Q = "101" THEN
--				Q <= "000";
--			ELSE
--				S <= Q(0) OR (Q(1) AND Q(2));
--				Q <= Q + 1;
--			END IF;
--		END IF;
--	END PROCESS;
--
--	D(0) <= (Q(0) AND NOT(Q(1)) AND NOT(Q(2))) OR (NOT(Q(0)) AND Q(1) AND Q(2));
--	D(1) <= (NOT(Q(0)) AND NOT(Q(1)) AND Q(2)) OR (NOT(Q(0)) AND Q(1) AND NOT(Q(2)));
--	D(2) <= NOT(Q(2));
--
--END logique;
