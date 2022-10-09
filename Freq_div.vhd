library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY Freq_div IS -- controle tous les signaux du VGA
PORT
(
  CLK_50M : IN STD_LOGIC; --contrôle tous les signaux VGA
  RESET : IN STD_LOGIC;
  CLK_25M : OUT STD_LOGIC
);
END Freq_div; 

ARCHITECTURE MAIN OF Freq_div IS
SIGNAL CLK_INT : STD_LOGIC;


BEGIN 
PROCESS(CLK_50M,RESET)
BEGIN
  IF(RESET='1') THEN
     CLK_INT <= '0';
	  
  
  ELSIF(CLK_50M'EVENT AND CLK_50M ='1') THEN
     CLK_INT <= NOT CLK_INT;   
			
	  END IF;
END PROCESS;
	
	CLK_25M <= CLK_INT; 
	 
END MAIN; 
	 