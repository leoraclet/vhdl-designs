LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY TP_Projet_Reveil IS
  PORT (
    clk                        : IN  STD_LOGIC;
    reset                      : IN  STD_LOGIC;
    swah                       : IN  STD_LOGIC;
    swada                      : IN  STD_LOGIC;
    BPsetH                     : IN  STD_LOGIC;
    BPsetM                     : IN  STD_LOGIC;
    led1                       : OUT STD_LOGIC;
    led2                       : OUT STD_LOGIC;
    a1, b1, c1, d1, e1, f1, g1 : OUT STD_LOGIC;
    a2, b2, c2, d2, e2, f2, g2 : OUT STD_LOGIC;
    a3, b3, c3, d3, e3, f3, g3 : OUT STD_LOGIC;
    a4, b4, c4, d4, e4, f4, g4 : OUT STD_LOGIC
  );
END ENTITY;

ARCHITECTURE rtl OF TP_Projet_Reveil IS

  --------------------------------------------------
  -- Frequency divider
  --------------------------------------------------

  COMPONENT gen_ena IS
    PORT (
      clkin   : IN  STD_LOGIC;
      rst     : IN  STD_LOGIC;
      ena_out : OUT STD_LOGIC
    );
  END COMPONENT;

  --------------------------------------------------
  -- Counter
  --------------------------------------------------

  COMPONENT cmpt4 IS
    PORT (
      clk     : IN  STD_LOGIC;
      ena_in  : IN  STD_LOGIC;
      rst     : IN  STD_LOGIC;
      lim     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      cmpto   : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      ena_out : OUT STD_LOGIC
    );
  END COMPONENT;

  --------------------------------------------------
  -- Comparator
  --------------------------------------------------

  COMPONENT comparateur IS
    PORT (
      SWADA                                          : IN  STD_LOGIC;
      e1HD, e1HU, e1MD, e1MU, e2HD, e2HU, e2MD, e2MU : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      led_out                                        : OUT STD_LOGIC
    );
  END COMPONENT;

  --------------------------------------------------
  -- Multiplexer
  --------------------------------------------------

  COMPONENT mux8x4 IS
    PORT (
      SWAH                                           : IN  STD_LOGIC;
      e1HD, e1HU, e1MD, e1MU, e2HD, e2HU, e2MD, e2MU : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      sHD, sHU, sMD, sMU                             : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  --------------------------------------------------
  -- Decoder
  --------------------------------------------------

  COMPONENT bin2seven IS
    PORT (
      bin                 : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      a, b, c, d, e, f, g : OUT STD_LOGIC
    );
  END COMPONENT;

  --------------------------------------------------
  -- Clock divider
  --------------------------------------------------

  COMPONENT clk_halve IS
    PORT (
      clkin   : IN  STD_LOGIC;
      ena_in  : IN  STD_LOGIC;
      rst     : IN  STD_LOGIC;
      ena_out : OUT STD_LOGIC);
  END COMPONENT;

  --------------------------------------------------
  -- Incrementer
  --------------------------------------------------

  COMPONENT inc4bits IS
    PORT (
      clk     : IN  STD_LOGIC;
      swah    : IN  STD_LOGIC;
      rst     : IN  STD_LOGIC;
      ena_in  : IN  STD_LOGIC;
      lim     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      inc     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      ena_out : OUT STD_LOGIC
    );
  END COMPONENT;

  --------------------------------------------------
  -- Signals
  --------------------------------------------------

  -- Clock dividers
  SIGNAL clk_div2_ena : STD_LOGIC;
  SIGNAL clk_div_ena  : STD_LOGIC;

  -- Counters
  SIGNAL cmpt_out1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL cmpt_out2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL cmpt_out3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL cmpt_out4 : STD_LOGIC_VECTOR(3 DOWNTO 0);

  -- Counters outputs
  SIGNAL cmpt_ena2_out : STD_LOGIC;
  SIGNAL cmpt_ena3_out : STD_LOGIC;
  SIGNAL cmpt_ena4_out : STD_LOGIC;
  SIGNAL cmpt_ena5_out : STD_LOGIC;
  SIGNAL cmpt_ena6_out : STD_LOGIC;

  -- Counters enables
  SIGNAL cmpt4_ena1_in : STD_LOGIC;
  SIGNAL cmpt4_ena2_in : STD_LOGIC;
  SIGNAL cmpt4_ena3_in : STD_LOGIC;
  SIGNAL cmpt4_ena4_in : STD_LOGIC;
  SIGNAL cmpt4_ena5_in : STD_LOGIC;

  -- Counters limits
  SIGNAL cmpt2_lim : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";

  -- Comparator
  SIGNAL comp_out : STD_LOGIC;

  -- Multiplexer
  SIGNAL mux_out1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL mux_out2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL mux_out3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL mux_out4 : STD_LOGIC_VECTOR(3 DOWNTO 0);

  -- Incrementers outputs
  SIGNAL inc_out1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL inc_out2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL inc_out3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL inc_out4 : STD_LOGIC_VECTOR(3 DOWNTO 0);

  -- Incrementers enables
  SIGNAL inc_ena1_in  : STD_LOGIC;
  SIGNAL inc_ena2_in  : STD_LOGIC;
  SIGNAL inc_ena1_out : STD_LOGIC;
  SIGNAL inc_ena2_out : STD_LOGIC;

  -- Incrementer output limits
  SIGNAL inc_2_lim : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";

BEGIN

  -- LEDs
  led1 <= swada;
  led2 <= comp_out AND clk_div2_ena;

  --------------------------------------------------
  -- Clock dividers
  --------------------------------------------------

  clk_div : gen_ena
  PORT MAP
  (
    clkin   => clk,
    rst     => reset,
    ena_out => clk_div_ena
  );

  clk_div2 : clk_halve
  PORT MAP
  (
    clkin   => clk,
    ena_in  => clk_div_ena,
    rst     => reset,
    ena_out => clk_div2_ena
  );

  --------------------------------------------------
  -- Decoders
  --------------------------------------------------

  dec1 : bin2seven
  PORT MAP
  (
    bin => mux_out1,
    a   => a1,
    b   => b1,
    c   => c1,
    d   => d1,
    e   => e1,
    f   => f1,
    g   => g1
  );

  dec2 : bin2seven
  PORT MAP
  (
    bin => mux_out2,
    a   => a2,
    b   => b2,
    c   => c2,
    d   => d2,
    e   => e2,
    f   => f2,
    g   => g2
  );

  dec3 : bin2seven
  PORT MAP
  (
    bin => mux_out3,
    a   => a3,
    b   => b3,
    c   => c3,
    d   => d3,
    e   => e3,
    f   => f3,
    g   => g3
  );

  dec4 : bin2seven
  PORT MAP
  (
    bin => mux_out4,
    a   => a4,
    b   => b4,
    c   => c4,
    d   => d4,
    e   => e4,
    f   => f4,
    g   => g4
  );

  --------------------------------------------------
  -- Comparator
  --------------------------------------------------

  comp : comparateur
  PORT MAP
  (
    SWADA   => swada,
    e1HD    => cmpt_out1,
    e1HU    => cmpt_out2,
    e1MD    => cmpt_out3,
    e1MU    => cmpt_out4,
    e2HD    => inc_out1,
    e2HU    => inc_out2,
    e2MD    => inc_out3,
    e2MU    => inc_out4,
    led_out => comp_out
  );

  --------------------------------------------------
  -- Incrementers
  --------------------------------------------------

  inc_ena1_in <= swah AND NOT BPsetH;
  inc_ena2_in <= swah AND NOT BPsetM;

  inc1_HD : inc4bits
  PORT MAP
  (
    clk     => clk,
    swah    => swah,
    rst     => reset,
    ena_in  => inc_ena2_out,
    lim     => "0010",
    inc     => inc_out1,
    ena_out => OPEN
  );

  inc2_HU : inc4bits
  PORT MAP
  (
    clk     => clk,
    swah    => swah,
    rst     => reset,
    ena_in  => inc_ena2_in,
    lim     => inc_2_lim,
    inc     => inc_out2,
    ena_out => inc_ena2_out
  );

  inc3_MD : inc4bits
  PORT MAP
  (
    clk     => clk,
    swah    => swah,
    rst     => reset,
    ena_in  => inc_ena1_out,
    lim     => "0101",
    inc     => inc_out3,
    ena_out => OPEN
  );

  inc4_MU : inc4bits
  PORT MAP
  (
    clk     => clk,
    swah    => swah,
    rst     => reset,
    ena_in  => inc_ena1_in,
    lim     => "1001",
    inc     => inc_out4,
    ena_out => inc_ena1_out
  );

  --------------------------------------------------
  -- Multiplexer
  --------------------------------------------------

  mux : mux8x4
  PORT MAP
  (
    SWAH => swah,
    e1HD => cmpt_out1,
    e1HU => cmpt_out2,
    e1MD => cmpt_out3,
    e1MU => cmpt_out4,
    e2HD => inc_out1,
    e2HU => inc_out2,
    e2MD => inc_out3,
    e2MU => inc_out4,
    sHD  => mux_out1,
    sHU  => mux_out2,
    sMD  => mux_out3,
    sMU  => mux_out4
  );

  --------------------------------------------------
  -- Counters
  --------------------------------------------------

  cmpt4_ena1_in <= cmpt_ena2_out AND clk_div_ena;
  cmpt4_ena2_in <= (cmpt_ena3_out AND cmpt_ena4_out AND clk_div_ena) OR (NOT SWAH AND NOT BPsetH);
  cmpt4_ena3_in <= cmpt_ena4_out AND clk_div_ena;
  cmpt4_ena4_in <= (cmpt_ena5_out AND cmpt_ena6_out AND clk_div_ena) OR (NOT SWAH AND NOT BPsetM);
  cmpt4_ena5_in <= cmpt_ena6_out AND clk_div_ena;

  -- Instantiate the counters
  cmpt_1 : cmpt4
  PORT MAP
  (
    clk     => clk,
    ena_in  => cmpt4_ena1_in,
    rst     => reset,
    lim     => "0010",
    cmpto   => cmpt_out1,
    ena_out => OPEN
  );

  cmpt_2 : cmpt4
  PORT MAP
  (
    clk     => clk,
    ena_in  => cmpt4_ena2_in,
    rst     => reset,
    lim     => cmpt2_lim,
    cmpto   => cmpt_out2,
    ena_out => cmpt_ena2_out
  );

  cmpt_3 : cmpt4
  PORT MAP
  (
    clk     => clk,
    ena_in  => cmpt4_ena3_in,
    rst     => reset,
    lim     => "0101",
    cmpto   => cmpt_out3,
    ena_out => cmpt_ena3_out
  );

  cmpt_4 : cmpt4
  PORT MAP
  (
    clk     => clk,
    ena_in  => cmpt4_ena4_in,
    rst     => reset,
    lim     => "1001",
    cmpto   => cmpt_out4,
    ena_out => cmpt_ena4_out
  );

  cmpt_5 : cmpt4
  PORT MAP
  (
    clk     => clk,
    ena_in  => cmpt4_ena5_in,
    rst     => reset,
    lim     => "0101",
    cmpto   => OPEN,
    ena_out => cmpt_ena5_out
  );

  cmpt_6 : cmpt4
  PORT MAP
  (
    clk     => clk,
    ena_in  => clk_div_ena,
    rst     => reset,
    lim     => "1001",
    cmpto   => OPEN,
    ena_out => cmpt_ena6_out
  );

  --------------------------------------------------
  -- Process
  --------------------------------------------------

  PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      inc_2_lim <= "1001";
      cmpt2_lim <= "1001";
    ELSIF rising_edge(clk) THEN
      IF inc_out1 = "0010" THEN
        inc_2_lim <= "0100";
      END IF;
      IF cmpt_out2 = "0010" THEN
        cmpt2_lim <= "0100";
      END IF;
    END IF;
  END PROCESS;

END ARCHITECTURE;
