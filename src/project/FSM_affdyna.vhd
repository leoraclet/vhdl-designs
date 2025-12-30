LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY machine_affdyna IS
  PORT (
    rst, clk : IN  STD_LOGIC;
    s_sel    : OUT STD_LOGIC_VECTOR(1 DOWNTO 0));
END machine_affdyna;

ARCHITECTURE cmpt OF machine_affdyna IS
  TYPE state_machine IS(sortieHD, wait1, sortieHU, wait2, sortieMD, wait3, sortieMU, wait4);
  SIGNAL state : state_machine;
BEGIN
  PROCESS (clk, rst)
  BEGIN
    --Reset machine
    IF rst = '1' THEN
      state <= sortieHD;
    ELSIF rising_edge(clk) THEN
      CASE state IS
          --Etats
        WHEN sortieHD => state    <= wait1;
        WHEN wait1    => state    <= sortieHU;
        WHEN sortieHU => state    <= wait2;
        WHEN wait2    => state    <= sortieMD;
        WHEN sortieMD => state    <= wait3;
        WHEN wait3    => state    <= sortieMU;
        WHEN sortieMU => state    <= wait4;
        WHEN wait4    => state    <= sortieHD;
      END CASE;
    END IF;
  END PROCESS;

  --Affectation des sorties
  s_sel <= "00" WHEN (state = sortieHD OR state = wait1) ELSE
           "01" WHEN(state = sortieHU OR state = wait2) ELSE
           "10" WHEN(state = sortieMD OR state = wait3) ELSE
           "11";
END cmpt;
