LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY multiplex IS
  PORT (
    e0, e1 : IN  STD_LOGIC;
    sel    : IN  STD_LOGIC;
    s      : OUT STD_LOGIC
  );
END ENTITY;

ARCHITECTURE rtl OF multiplex IS
BEGIN
  s <= e0 WHEN sel = '0' ELSE
       e1;
END ARCHITECTURE;
