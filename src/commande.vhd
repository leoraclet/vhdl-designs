----------------------------------------------------------------------
--
-- Design unit:   Commande of the lift in a two-floor building
-- File name:     commande.vhd
-- Description:   A state machine example
--
---------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY commande IS
  PORT (
    clk, reset       : IN  STD_LOGIC;
    call             : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
    led_up, led_down : OUT STD_LOGIC;
    cmnd_go          : OUT STD_LOGIC;
    cmnd_dir         : OUT STD_LOGIC
  );
END commande;

ARCHITECTURE rtl OF commande IS
  TYPE etats_etages IS (etage_rdc_stop,
    etage_1_stop,
    etage_1_mont,
    etage_1_desc,
    etage_2_stop);
  SIGNAL sm_ctrl : etats_etages;
BEGIN

  -- State machine definition
  PROCESS (clk, reset)
  BEGIN
    IF (reset = '0') THEN
      cmnd_go  <= '0'; -- Arret moteur
      cmnd_dir <= '1'; -- Direction montee par defaut
      led_up   <= '1'; -- Diode LED "up" eteinte
      led_down <= '1'; -- Diode LED "down" eteinte
      --
      sm_ctrl <= etage_rdc_stop;
    ELSIF rising_edge(clk) THEN
      CASE sm_ctrl IS
        WHEN etage_rdc_stop => -- En arret, en attente d'un appel
          IF call(2) = '0' THEN -- Monter au deuxieme
            cmnd_go  <= '1'; -- Moteur en marche
            cmnd_dir <= '1'; -- Direction montee
            led_up   <= '0'; -- LED "up" allumee
            led_down <= '1'; -- LED "down" eteinte
            sm_ctrl  <= etage_1_mont;
          ELSIF call(1) = '0' THEN -- Monter au premier
            cmnd_go  <= '1'; -- Moteur en marche
            cmnd_dir <= '1'; -- Direction montee
            led_up   <= '0'; -- LED "up" allumee
            led_down <= '1'; -- LED "down" eteinte
            sm_ctrl  <= etage_1_stop;
          ELSE -- On ne bouge pas
            cmnd_go <= '0'; -- Moteur arrete
            -- Direction non changee
            led_up   <= '1';            -- LED "up" eteinte
            led_down <= '1';            -- LED "down" eteinte
            sm_ctrl  <= etage_rdc_stop; -- On reste au RDC
          END IF;
        WHEN etage_1_mont => -- On continue de monter
          cmnd_go  <= '1'; -- Moteur en marche
          cmnd_dir <= '1'; -- Direction montee
          led_up   <= '0'; -- LED "up" allumee
          led_down <= '1'; -- LED "down" eteinte
          sm_ctrl  <= etage_2_stop;
        WHEN etage_1_desc => -- On continue de descendre
          cmnd_go  <= '1'; -- Moteur en marche
          cmnd_dir <= '0'; -- Direction descente
          led_up   <= '1'; -- LED "up" eteinte
          led_down <= '0'; -- LED "down" allumee
          sm_ctrl  <= etage_rdc_stop;
        WHEN etage_1_stop => -- En arret, en attente d'un appel
          IF call(2) = '0' THEN -- Monter au deuxieme
            cmnd_go  <= '1'; -- Moteur en marche
            cmnd_dir <= '1'; -- Direction montee
            led_up   <= '0'; -- LED "up" allumee
            led_down <= '1'; -- LED "down" eteinte
            sm_ctrl  <= etage_2_stop;
          ELSIF call(0) = '0' THEN -- Descendre au RDC
            cmnd_go  <= '1'; -- Moteur en marche
            cmnd_dir <= '0'; -- Direction descente
            led_up   <= '1'; -- LED "up" eteinte
            led_down <= '0'; -- LED "down" allumee
            sm_ctrl  <= etage_rdc_stop;
          ELSE -- On ne bouge pas
            cmnd_go <= '0'; -- Moteur arrete
            -- Direction non changee
            led_up   <= '1'; -- LED "up" eteinte
            led_down <= '1'; -- LED "down" eteinte
            sm_ctrl  <= etage_1_stop;
          END IF;
        WHEN etage_2_stop => -- En arret, en attente d'un appel
          IF call(1) = '0' THEN -- Descendre au premier
            cmnd_go  <= '1'; -- Moteur en marche
            cmnd_dir <= '0'; -- Direction descente
            led_up   <= '1'; -- LED "up" eteinte
            led_down <= '0'; -- LED "down" allumee
            sm_ctrl  <= etage_1_stop;
          ELSIF call(0) = '0' THEN -- Descendre au RDC
            cmnd_go  <= '1'; -- Moteur en marche
            cmnd_dir <= '0'; -- Direction descente
            led_up   <= '1'; -- LED "up" eteinte
            led_down <= '0'; -- LED "down" allumee
            sm_ctrl  <= etage_1_desc;
          ELSE -- On ne bouge pas
            cmnd_go <= '0'; -- Moteur arrete
            -- Direction non changee
            led_up   <= '1'; -- LED "up" eteinte
            led_down <= '1'; -- LED "down" eteinte
            sm_ctrl  <= etage_2_stop;
          END IF;
      END CASE;
    END IF;
  END PROCESS;
END rtl;
