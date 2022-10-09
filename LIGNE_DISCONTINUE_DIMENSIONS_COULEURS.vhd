library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Une procédure est un type de sous-programme en VHDL qui peut nous aider à éviter la répétition du code. 
--Il est parfois nécessaire d'effectuer des opérations identiques à plusieurs endroits de la conception.


PACKAGE LIGNE_DISCONTINUE_DIMENSIONS_COULEURS IS
PROCEDURE LIGNE_DISCONTINUE
(
  SIGNAL LIGNE_DISCONTINUE_current_pos_X,LIGNE_DISCONTINUE_current_pos_Y,Xpos,Ypos:IN INTEGER;
  SIGNAL RGB_LIGNE_DISCONTINUE:OUT STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL DRAWING_LIGNE_DISCONTINUE: OUT STD_LOGIC;
  CONSTANT LARGEUR_LIGNE_DISCONTINUE:INTEGER;
  CONSTANT LONGUEUR_LIGNE_DISCONTINUE:INTEGER;
  CONSTANT ecart: INTEGER;
  CONSTANT discontinuite: INTEGER
  );
END LIGNE_DISCONTINUE_DIMENSIONS_COULEURS;



PACKAGE BODY LIGNE_DISCONTINUE_DIMENSIONS_COULEURS IS
PROCEDURE LIGNE_DISCONTINUE
(
  SIGNAL LIGNE_DISCONTINUE_current_pos_X,LIGNE_DISCONTINUE_current_pos_Y,Xpos,Ypos:IN INTEGER;
  SIGNAL RGB_LIGNE_DISCONTINUE:OUT STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL DRAWING_LIGNE_DISCONTINUE: OUT STD_LOGIC;
  CONSTANT LARGEUR_LIGNE_DISCONTINUE:INTEGER;
  CONSTANT LONGUEUR_LIGNE_DISCONTINUE:INTEGER;
  CONSTANT ecart : INTEGER;
--CONSTANT ecart2: INTEGER;
  CONSTANT discontinuite : INTEGER
--CONSTANT discontinuite2 :INTEGER
  )
  IS
  
---------- Si le compteur atteint se situe dans les X et Y mentionnés ci-dessous, faire apparaitre le gazon
  BEGIN
  
  ------------- Première bande de ligne discontinue
    --- Si la ligne discontinue est entre 252 et LARGE_LIGNE_DISCONTINUE en X, 
	 --- et entre 0 et LONGUEUR_LIGNE_Discontinue en Y alors afficher notre ligne  
    IF   (   (LIGNE_DISCONTINUE_current_pos_X>Xpos) 
	      AND (LIGNE_DISCONTINUE_current_pos_X<Xpos+LARGEUR_LIGNE_DISCONTINUE)
	      AND (LIGNE_DISCONTINUE_current_pos_Y>Ypos) 
	      AND (LIGNE_DISCONTINUE_current_pos_Y<Ypos+LONGUEUR_LIGNE_DISCONTINUE))THEN
	     
		     RGB_LIGNE_DISCONTINUE<="1111";
	        DRAWING_LIGNE_DISCONTINUE<='1';
			 
			  
		 ------------- Seconde bande de ligne discontinue
    --- Si la ligne discontinue est entre 252 et LARGE_LIGNE_DISCONTINUE en X, 
	 --- et entre la longueur de notre ligne plus la discontinuité en Y ET la longueur de la ligne précédente alors afficher notre ligne 
	 ELSIF(    (LIGNE_DISCONTINUE_current_pos_X>Xpos) 
	       AND (LIGNE_DISCONTINUE_current_pos_X<Xpos+LARGEUR_LIGNE_DISCONTINUE) 
			 AND (LIGNE_DISCONTINUE_current_pos_Y>Ypos+LONGUEUR_LIGNE_DISCONTINUE+discontinuite) 
			 AND (LIGNE_DISCONTINUE_current_pos_Y<Ypos+2*LONGUEUR_LIGNE_DISCONTINUE+discontinuite))THEN
			 
	        RGB_LIGNE_DISCONTINUE<="1111";
	        DRAWING_LIGNE_DISCONTINUE<='1'; 
		 
		 
		 
	 ELSIF(    (LIGNE_DISCONTINUE_current_pos_X>Xpos)
	       AND (LIGNE_DISCONTINUE_current_pos_X<Xpos+LARGEUR_LIGNE_DISCONTINUE)
			 AND (LIGNE_DISCONTINUE_current_pos_Y>Ypos+2*LONGUEUR_LIGNE_DISCONTINUE+2*discontinuite) 
			 AND (LIGNE_DISCONTINUE_current_pos_Y<Ypos+3*LONGUEUR_LIGNE_DISCONTINUE+2*discontinuite))THEN
	      
			   RGB_LIGNE_DISCONTINUE<="1111";
	         DRAWING_LIGNE_DISCONTINUE<='1';
				
				
	 ELSIF(    (LIGNE_DISCONTINUE_current_pos_X>Xpos)
	       AND (LIGNE_DISCONTINUE_current_pos_X<Xpos+LARGEUR_LIGNE_DISCONTINUE)
			 AND (LIGNE_DISCONTINUE_current_pos_Y>Ypos+3*LONGUEUR_LIGNE_DISCONTINUE+3*discontinuite) 
			 AND (LIGNE_DISCONTINUE_current_pos_Y<Ypos+4*LONGUEUR_LIGNE_DISCONTINUE+3*discontinuite))THEN
	      
			   RGB_LIGNE_DISCONTINUE<="1111";
	         DRAWING_LIGNE_DISCONTINUE<='1';
		 
	---- Seconde bande de ligne discontinue	 
		 
	 ELSIF(    (LIGNE_DISCONTINUE_current_pos_X>Xpos+ecart) 
	       AND (LIGNE_DISCONTINUE_current_pos_X<(ecart+Xpos+LARGEUR_LIGNE_DISCONTINUE)) 
			 AND (LIGNE_DISCONTINUE_current_pos_Y>Ypos) 
			 AND (LIGNE_DISCONTINUE_current_pos_Y<(Ypos+LONGUEUR_LIGNE_DISCONTINUE)))THEN
	       
			 RGB_LIGNE_DISCONTINUE<="1111";
	       DRAWING_LIGNE_DISCONTINUE<='1'; 
		 
	 ELSIF(    (LIGNE_DISCONTINUE_current_pos_X>Xpos+ecart) 
	       AND (LIGNE_DISCONTINUE_current_pos_X<(Xpos+ecart+LARGEUR_LIGNE_DISCONTINUE)) 
			 AND (LIGNE_DISCONTINUE_current_pos_Y>Ypos+(LONGUEUR_LIGNE_DISCONTINUE+discontinuite)) 
			 AND (LIGNE_DISCONTINUE_current_pos_Y<(Ypos+(2*LONGUEUR_LIGNE_DISCONTINUE)+discontinuite)))THEN
	       
			 RGB_LIGNE_DISCONTINUE<="1111";
	       DRAWING_LIGNE_DISCONTINUE<='1'; 
	
    ELSIF(     (LIGNE_DISCONTINUE_current_pos_X>Xpos+ecart)
	        AND (LIGNE_DISCONTINUE_current_pos_X<(Xpos+ecart+LARGEUR_LIGNE_DISCONTINUE)) 
			  AND (LIGNE_DISCONTINUE_current_pos_Y>Ypos+2*LONGUEUR_LIGNE_DISCONTINUE+2*discontinuite) 
			  AND (LIGNE_DISCONTINUE_current_pos_Y<Ypos+3*LONGUEUR_LIGNE_DISCONTINUE+2*discontinuite))THEN
			  
			  RGB_LIGNE_DISCONTINUE<="1111";
	       DRAWING_LIGNE_DISCONTINUE<='1'; 
			  
	 ELSIF(     (LIGNE_DISCONTINUE_current_pos_X>Xpos+ecart)
	          AND (LIGNE_DISCONTINUE_current_pos_X<Xpos+ecart+LARGEUR_LIGNE_DISCONTINUE)
			    AND (LIGNE_DISCONTINUE_current_pos_Y>Ypos+3*LONGUEUR_LIGNE_DISCONTINUE+3*discontinuite) 
			    AND (LIGNE_DISCONTINUE_current_pos_Y<Ypos+4*LONGUEUR_LIGNE_DISCONTINUE+3*discontinuite))THEN
	      
			    RGB_LIGNE_DISCONTINUE<="1111";
	          DRAWING_LIGNE_DISCONTINUE<='1';

  ---- Troisième bande de ligne discontinue 

      ELSIF(    (LIGNE_DISCONTINUE_current_pos_X>(Xpos+2*ecart)) 
            AND (LIGNE_DISCONTINUE_current_pos_X<(Xpos+2*ecart+LARGEUR_LIGNE_DISCONTINUE)) 
		      AND (LIGNE_DISCONTINUE_current_pos_Y>Ypos) 
		      AND (LIGNE_DISCONTINUE_current_pos_Y<Ypos+LONGUEUR_LIGNE_DISCONTINUE))THEN
			 
			 RGB_LIGNE_DISCONTINUE<="1111";
	       DRAWING_LIGNE_DISCONTINUE<='1'; 
		  
		  
      ELSIF(    (LIGNE_DISCONTINUE_current_pos_X>Xpos+2*ecart) 
	         AND (LIGNE_DISCONTINUE_current_pos_X<(Xpos+2*ecart+LARGEUR_LIGNE_DISCONTINUE)) 
			   AND (LIGNE_DISCONTINUE_current_pos_Y>Ypos+(LONGUEUR_LIGNE_DISCONTINUE+discontinuite)) 
			   AND (LIGNE_DISCONTINUE_current_pos_Y<(Ypos+(2*LONGUEUR_LIGNE_DISCONTINUE)+discontinuite)))THEN
	       
			   RGB_LIGNE_DISCONTINUE<="1111";
	         DRAWING_LIGNE_DISCONTINUE<='1'; 
	
      ELSIF(     (LIGNE_DISCONTINUE_current_pos_X>Xpos+2*ecart)
	          AND (LIGNE_DISCONTINUE_current_pos_X<(Xpos+2*ecart+LARGEUR_LIGNE_DISCONTINUE)) 
			    AND (LIGNE_DISCONTINUE_current_pos_Y>Ypos+2*LONGUEUR_LIGNE_DISCONTINUE+2*discontinuite) 
			    AND (LIGNE_DISCONTINUE_current_pos_Y<Ypos+3*LONGUEUR_LIGNE_DISCONTINUE+2*discontinuite))THEN
			  
			  RGB_LIGNE_DISCONTINUE<="1111";
	       DRAWING_LIGNE_DISCONTINUE<='1'; 
			  
			  
			  
	   ELSIF(     (LIGNE_DISCONTINUE_current_pos_X>Xpos+2*ecart)
	          AND (LIGNE_DISCONTINUE_current_pos_X<Xpos+2*ecart+LARGEUR_LIGNE_DISCONTINUE)
			    AND (LIGNE_DISCONTINUE_current_pos_Y>Ypos+3*LONGUEUR_LIGNE_DISCONTINUE+3*discontinuite) 
			    AND (LIGNE_DISCONTINUE_current_pos_Y<Ypos+4*LONGUEUR_LIGNE_DISCONTINUE+3*discontinuite))THEN
			  
			  RGB_LIGNE_DISCONTINUE<="1111";
	        DRAWING_LIGNE_DISCONTINUE<='1';
	           		 
		 
	 ELSE 
		 DRAWING_LIGNE_DISCONTINUE<='0';
 END IF;
 
END LIGNE_DISCONTINUE;
END LIGNE_DISCONTINUE_DIMENSIONS_COULEURS;