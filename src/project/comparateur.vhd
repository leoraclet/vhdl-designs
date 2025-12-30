LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY comparateur IS
  PORT (
    SWADA                                          : IN  STD_LOGIC;
    e1HD, e1HU, e1MD, e1MU, e2HD, e2HU, e2MD, e2MU : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
    led_out                                        : OUT STD_LOGIC
  );
END comparateur;

ARCHITECTURE rtl OF comparateur IS
  SIGNAL s0_interne, s1_interne, s2_interne, s3_interne, s4_interne : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN

  s0_interne <= e1HD XOR e2HD;
  s1_interne <= e1HU XOR e2HU;
  s2_interne <= e1MD XOR e2MD;
  s3_interne <= e1MU XOR e2MU;

  s4_interne <= s0_interne OR s1_interne OR s2_interne OR s3_interne;

  led_out <= NOT(s4_interne(0)) AND NOT(s4_interne(1)) AND NOT(s4_interne(2)) AND NOT(s4_interne(3)) AND SWADA;

END rtl;
