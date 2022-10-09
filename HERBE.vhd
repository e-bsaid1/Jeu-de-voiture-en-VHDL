library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Une procédure est un type de sous-programme en VHDL qui peut nous aider à éviter la répétition du code. 
--Il est parfois nécessaire d'effectuer des opérations identiques à plusieurs endroits de la conception.


PACKAGE HERBE_DIMENSIONS_COULEURS IS
PROCEDURE HERBE
(
  SIGNAL HERBE_current_pos_X,HERBE_current_pos_Y,Xpos,Ypos:IN INTEGER;
  SIGNAL RGB_HERBE:OUT STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL DRAWING_HERBE: OUT STD_LOGIC;
  CONSTANT LARGEUR_HERBE:INTEGER;
  CONSTANT LONGUEUR_HERBE:INTEGER
  );
END HERBE_DIMENSIONS_COULEURS;



PACKAGE BODY HERBE_DIMENSIONS_COULEURS IS
PROCEDURE HERBE
(
  SIGNAL HERBE_current_pos_X,HERBE_current_pos_Y,Xpos,Ypos:IN INTEGER;
  SIGNAL RGB_HERBE:OUT STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL DRAWING_HERBE: OUT STD_LOGIC;
  CONSTANT LARGEUR_HERBE:INTEGER;
  CONSTANT LONGUEUR_HERBE:INTEGER)
  IS
  
---------- Si le compteur atteint se situe dans les X et Y mentionnés ci-dessous, faire apparaitre le gazon
  BEGIN
    IF((HERBE_current_pos_X>Xpos) AND (HERBE_current_pos_X<(Xpos+LARGEUR_HERBE)) AND (HERBE_current_pos_Y>Ypos) AND (HERBE_current_pos_Y<(Ypos+LONGUEUR_HERBE)))THEN
	    RGB_HERBE<="1111";
	    DRAWING_HERBE<='1';
		 
		 ELSE 
		 DRAWING_HERBE<='0';
 END IF;
 
END HERBE;
END HERBE_DIMENSIONS_COULEURS;