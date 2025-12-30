----------------------------------------------------------------------
--
-- Design unit:   4-byte synchronous memory
-- File name:     mem4x8.vhd
-- Description:   4-byte synchronous memory: addr input is used to
--                address one of four internal registers for writing
--                or reading. n_wr signal defines direction:
--                0 - writing, 1 - reading
-- Parameters:    No parameters
-- System:        VHDL'93
-- Autor:         Viktor Fischer, IUT UJM
-- Copyright:     IUT UJM 2006
-- Revision:      Version 1.00, December 2007
-- Last changes:  - ...
--
---------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mem4x8 IS
  PORT (
    clk, n_wr : IN  STD_LOGIC;
    addr      : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
    din       : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
    dout      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END mem4x8;

ARCHITECTURE rtl OF mem4x8 IS
  SIGNAL reg0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL reg1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL reg2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL reg3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
  -- Sequentional part
  PROCESS (clk)
  BEGIN
    IF rising_edge(clk) THEN
      IF n_wr = '0' THEN
        CASE addr IS
          WHEN "00" =>
            reg0 <= din; -- Explicit memorization of reg1,reg2,reg3
          WHEN "01" =>
            reg1 <= din; -- Explicit memorization of reg0,reg2,reg3
          WHEN "10" =>
            reg2 <= din; -- Explicit memorization of reg0,reg1,reg3
          WHEN OTHERS =>
            reg3 <= din; -- Explicit memorization of reg0,reg1,reg2
        END CASE;
      END IF;
    END IF;
  END PROCESS;

  -- Combinatorial part
  WITH addr SELECT
    dout <= reg0 WHEN "00",
    reg1 WHEN "01",
    reg2 WHEN "10",
    reg3 WHEN OTHERS;
END rtl;
