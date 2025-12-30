LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY bascule_d IS
  PORT (
    d, clk, reset : IN  STD_LOGIC;
    q, notq       : OUT STD_LOGIC
  );
END ENTITY;

ARCHITECTURE Behavioral OF bascule_d IS
BEGIN
  PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      q    <= '0';
      notq <= '1';
    ELSIF clk'event AND clk = '1' THEN
      q    <= d;
      notq <= NOT d;
    END IF;
  END PROCESS;
END ARCHITECTURE;
