----------------------------------------------------------------------
--
-- Design unit:   Asynchronous memory initialization control unit
-- File name:     init_mem.vhd
-- Description:   A state machine example
-- Parameters:    No parameters
-- System:        VHDL'93
-- Autor:         Viktor Fischer, IUT UJM
-- Copyright:     IUT UJM 2006
-- Revision:      Version 1.00, December 2007
-- Last changes:  - ...
--
---------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY init_mem IS
  PORT (
    clk, start : IN  STD_LOGIC;
    addr, data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    n_cs, n_wr : OUT STD_LOGIC := '1'
  );
END init_mem;

ARCHITECTURE rtl OF init_mem IS
  TYPE memini_states IS (wait4start,
    idle,
    addr_prep,
    data_prep,
    transmission,
    transm_end,
    deselect_mem);
  SIGNAL sm_memini    : memini_states;
  SIGNAL cnt_int      : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL data_out, cs : STD_LOGIC;

BEGIN

  -- State machine definition
  PROCESS (clk, start)
  BEGIN
    IF (start = '1') THEN
      cnt_int <= (OTHERS => '0'); -- Counter initialization
    ELSIF rising_edge(clk) THEN
      IF sm_memini = deselect_mem THEN
        cnt_int <= cnt_int + 1;
      END IF;
    END IF;
  END PROCESS;
  --
  PROCESS (clk, start)
  BEGIN
    IF rising_edge(clk) THEN
      CASE sm_memini IS
        WHEN wait4start =>
          IF start = '1' THEN
            sm_memini <= idle;
          END IF;
          data_out <= '0';
          cs       <= '0'; -- Inverted signal n_CS
        WHEN idle =>
          sm_memini <= addr_prep;
          cs        <= '1';
        WHEN addr_prep =>
          sm_memini <= data_prep;
          data_out  <= '1';
        WHEN data_prep =>
          sm_memini <= transmission;
        WHEN transmission =>
          sm_memini <= transm_end;
          data_out  <= '0';
        WHEN transm_end =>
          sm_memini <= deselect_mem;
          cs        <= '0';
        WHEN deselect_mem =>
          IF cnt_int < 255 THEN
            sm_memini <= idle;
          ELSE
            sm_memini <= wait4start;
          END IF;
        WHEN OTHERS =>
          sm_memini <= wait4start;
      END CASE;
    END IF;
  END PROCESS;
  n_cs <= '0' WHEN cs = '1' ELSE
          '1';

  n_wr <= '0' WHEN (sm_memini = data_prep) ELSE
          '1';

  addr <= cnt_int;

  data <= cnt_int WHEN (data_out = '1') ELSE
          (OTHERS => 'Z');

END rtl;
