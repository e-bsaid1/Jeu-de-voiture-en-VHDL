LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY LFSR_32 IS
  PORT (clk, reset: IN std_logic;
        output: OUT std_logic_vector (31 DOWNTO 0)
		  );
END LFSR_32;

ARCHITECTURE LFSR32_BEHAVIOR OF LFSR_32 IS
  SIGNAL etat_actuel, etat_futur: std_logic_vector (7 DOWNTO 0);
  SIGNAL retour: std_logic;

  BEGIN

  PROCESS (clk,reset)
  BEGIN
    IF (reset = '1') THEN
      etat_actuel <= (OTHERS =>'0');
    ELSIF (rising_edge(clk)) THEN
      etat_actuel <= etat_futur;
    END IF;
  END PROCESS;
  
  retour <= etat_actuel(6) XOR etat_actuel(5) XOR etat_actuel(4) XOR etat_actuel(3) XOR etat_actuel(2) XOR etat_actuel(0);
  etat_futur <= retour & etat_actuel(31 DOWNTO 0);
  output <= etat_actuel;
  
END LFSR32_BEHAVIOR;
  
  

	