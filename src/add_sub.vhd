LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY add_sub IS
  PORT (
    op         : IN  STD_LOGIC;
    a          : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    b          : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    s          : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    n, z, c, v : OUT STD_LOGIC
  );
END add_sub;

ARCHITECTURE rtl OF add_sub IS
  COMPONENT fa IS
    PORT (
      a     : IN  STD_LOGIC;
      b     : IN  STD_LOGIC;
      c_in  : IN  STD_LOGIC;
      sum   : OUT STD_LOGIC;
      c_out : OUT STD_LOGIC
    );
  END COMPONENT;
  SIGNAL c_int : STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL b_int : STD_LOGIC_VECTOR(3 DOWNTO 0);

  SIGNAL s_int, n_s_int : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
  c_int(0) <= op;

  n_s_int <= NOT s_int;

  b_int <= b WHEN op = '0' ELSE
           NOT b;

  s <= s_int;

  z <= n_s_int(0) AND n_s_int(1) AND n_s_int(2) AND n_s_int(3);
  n <= s_int(3);
  c <= c_int(4);
  v <= c_int(3) XOR c_int(4);

  mon_inst0 : fa PORT MAP(
    a     => a(0),
    b     => b_int(0),
    c_in  => c_int(0),
    sum   => s_int(0),
    c_out => c_int(1)
  );
  mon_inst1 : fa PORT MAP(
    a     => a(1),
    b     => b_int(1),
    c_in  => c_int(1),
    sum   => s_int(1),
    c_out => c_int(2)
  );
  mon_inst2 : fa PORT MAP(
    a     => a(2),
    b     => b_int(2),
    c_in  => c_int(2),
    sum   => s_int(2),
    c_out => c_int(3)
  );
  mon_inst3 : fa PORT MAP(
    a     => a(3),
    b     => b_int(3),
    c_in  => c_int(3),
    sum   => s_int(3),
    c_out => c_int(4)
  );

END rtl;
