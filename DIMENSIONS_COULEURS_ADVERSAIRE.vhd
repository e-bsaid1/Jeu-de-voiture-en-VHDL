library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Une procÃ©dure est un type de sous-programme en VHDL qui peut nous aider Ã  Ã©viter la rÃ©pÃ©tition du code. 
--Il est parfois nÃ©cessaire d'effectuer des opÃ©rations identiques Ã  plusieurs endroits de la conception.


PACKAGE DIMENSIONS_COULEURS_ADVERSAIRE IS
	PROCEDURE ADVERSAIRE
	(
		SIGNAL ADVERSAIRE_current_pos_X,ADVERSAIRE_current_pos_Y,Xpos,Ypos:IN INTEGER RANGE 0 TO 300;
		SIGNAL DRAWING_ADVERSAIRE: OUT STD_LOGIC;
		CONSTANT LARGEUR_ADVERSAIRE:INTEGER;
		CONSTANT LONGUEUR_ADVERSAIRE:INTEGER;
		CONSTANT ecart_adversaire: INTEGER;
		CONSTANT intervalle_adversaire: INTEGER
	);
END DIMENSIONS_COULEURS_ADVERSAIRE;



PACKAGE BODY DIMENSIONS_COULEURS_ADVERSAIRE IS
	PROCEDURE ADVERSAIRE
	(
		SIGNAL ADVERSAIRE_current_pos_X,ADVERSAIRE_current_pos_Y,Xpos,Ypos:IN INTEGER;
		SIGNAL DRAWING_ADVERSAIRE: OUT STD_LOGIC;
		CONSTANT LARGEUR_ADVERSAIRE:INTEGER;
		CONSTANT LONGUEUR_ADVERSAIRE:INTEGER;
		CONSTANT ecart_adversaire : INTEGER;
		--CONSTANT ecart2: INTEGER;
		CONSTANT intervalle_adversaire : INTEGER
		--CONSTANT discontinuite2 :INTEGER
	 )
	 IS
  
	BEGIN
  
  ------------- Premier couple de voiture adverse, en premiÃ¨re voie 
    --- Si notre premiÃ¨re voiture adverse est entre XPOS et LARGEUR_ADVERSAIRE en X, 
	 --- et entre 0 et LONGUEUR_ADVERSAIRE en Y alors afficher notre ligne  
    IF   (   (ADVERSAIRE_current_pos_X>Xpos) 
	      AND (ADVERSAIRE_current_pos_X<Xpos+LARGEUR_ADVERSAIRE)
	      AND (ADVERSAIRE_current_pos_Y>Ypos) 
	      AND (ADVERSAIRE_current_pos_Y<Ypos+LONGUEUR_ADVERSAIRE))THEN
	     
	        DRAWING_ADVERSAIRE<='1';
			 
    --- Si notre seconde voiture adverse est entre XPOS et LARGEUR_ADVERSAIRE en X, 
	 --- et entre la longueur de notre voiture plus l'Ã©cart avec une voiture en Y ET la longueur de la ligne prÃ©cÃ©dente alors afficher notre ligne 
	 ELSIF(    (ADVERSAIRE_current_pos_X>Xpos) 
	       AND (ADVERSAIRE_current_pos_X<Xpos+LARGEUR_ADVERSAIRE) 
			 AND (ADVERSAIRE_current_pos_Y>Ypos+LONGUEUR_ADVERSAIRE+intervalle_adversaire) 
			 AND (ADVERSAIRE_current_pos_Y<Ypos+2*LONGUEUR_ADVERSAIRE+intervalle_adversaire))THEN
			 
	       
	        DRAWING_ADVERSAIRE<='1'; 
			  
	  ELSE 
		 DRAWING_ADVERSAIRE<='0';
 END IF;
 
END ADVERSAIRE;
END DIMENSIONS_COULEURS_ADVERSAIRE;