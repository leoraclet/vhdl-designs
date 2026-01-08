----------------------------------------------------------------------
--
-- Design unit:   Synchronous 8-bit bi-directional counter
-- File name:     cnt256.vhd
-- Description:   Sequential block used to count up and down on 8
--                bits synchronously
--
----------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY cnt256 IS
  PORT (
    clk  : IN  STD_LOGIC;
    load : IN  STD_LOGIC;
    dir  : IN  STD_LOGIC;
    ena  : IN  STD_LOGIC;
    rst  : IN  STD_LOGIC;
    init : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    cnt  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END cnt256;

ARCHITECTURE rtl OF cnt256 IS
  SIGNAL cnt_int : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN

  PROCESS (clk)
  BEGIN
    IF rst = '0' THEN
      cnt_int <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      IF (load = '1') THEN
        cnt_int <= init;
      ELSE
        IF ena = '0' THEN
          cnt_int <= cnt_int;
        ELSE
          IF dir = '1' THEN
            cnt_int <= cnt_int + 1;
          ELSE
            cnt_int <= cnt_int - 1;
          END IF;
        END IF;
      END IF;
    END IF;
  END PROCESS;
  cnt <= cnt_int;
END rtl;
