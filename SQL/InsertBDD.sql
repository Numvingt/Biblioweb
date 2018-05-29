-- -----------------------------------------------------------------------------
--             Insertion des données dans la BDD Biblioweb
-- -----------------------------------------------------------------------------
--      Nom de la base : Biblioweb
--      Projet : Projet Individuel
--      Auteur : NOSELLAL
--      Date de dernière modification : 25/5/2018
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
--       SUPPRESSION DES SEQUENCES 
-- -----------------------------------------------------------------------------

DROP SEQUENCE IdLivre;
DROP SEQUENCE IdAuteur;
DROP SEQUENCE IdEditeur;
DROP SEQUENCE IdAvancement;

-- -----------------------------------------------------------------------------
--       CREATION DES SEQUENCES 
-- -----------------------------------------------------------------------------

CREATE SEQUENCE IdLivre
	MINVALUE      1
	START WITH    1
	INCREMENT BY  1
	MAXVALUE     99
	NOCYCLE;
	
CREATE SEQUENCE IdAuteur
	MINVALUE      1
	START WITH    1
	INCREMENT BY  1
	MAXVALUE     99
	NOCYCLE;

CREATE SEQUENCE IdEditeur
	MINVALUE      1
	START WITH    1
	INCREMENT BY  1
	MAXVALUE     99
	NOCYCLE;
	
CREATE SEQUENCE IdAvancement
	MINVALUE      1
	START WITH    1
	INCREMENT BY  1
	MAXVALUE     99
	NOCYCLE;
	
-- -----------------------------------------------------------------------------
--       SUPPRESSION DU CONTENU DES TABLES
-- -----------------------------------------------------------------------------

DELETE FROM ECRIT_PAR;

DELETE FROM TRAVAILLE_AVEC;

DELETE FROM EST_PUBLIE;

DELETE FROM LIVRE;

DELETE FROM EDITEUR;

DELETE FROM AVANCEMENT;

DELETE FROM AUTEUR;

-- -----------------------------------------------------------------------------
--       INSERTION DES DONNEES
-- -----------------------------------------------------------------------------

-- Insertions préalables
ALTER SESSION SET NLS_DATE_FORMAT = "MM/YYYY";
-- -----------------------------------------------------------------------------
-- Transaction n°1 : Remplissage de la table d'avancement
INSERT INTO AVANCEMENT VALUES (IdAvancement.nextval,'LU');
INSERT INTO AVANCEMENT VALUES (IdAvancement.nextval,'NLU');
INSERT INTO AVANCEMENT VALUES (IdAvancement.nextval,'ENC');

COMMIT;
-- -----------------------------------------------------------------------------
-- Transaction n°2 : "1984" de G.Orwells
INSERT INTO LIVRE VALUES (IdLivre.nextval,1,'1984','11/1972','De tous les carrefours importants, le visage à la moustache noire vous fixait du regard. Il y en avait un sur le mur d''en face. BIG BROTHER VOUS REGARDE, répétait la légende, tandis que le regard des yeux noirs pénétrait les yeux de WINSTON... Au loin, un hélicoptère glissa entre les toits, plana un moment, telle une mouche bleue, puis repartit comme une flèche, dans un vol courbe. C''était une patrouille qui venait mettre le nez aux fenêtres des gens. Mais les patrouilles n''avaient pas d''importance. Seule comptait la Police de la Pensée.',NULL);
INSERT INTO AUTEUR VALUES (IdAuteur.nextval,'Orwell','George','GEORGE ORWELL (1903-1950) a été policier aux Indes, clochard à Paris, combattant en Espagne, speaker à la BBC et surtout un grand écrivain : La vache enragée, Et vive l''Aspidistra, Hommage à la Catalogne, La ferme des animaux, et le prophétique 1984, peinture d''un terrifiant monde totalitaire.');
INSERT INTO EDITEUR VALUES (IdEditeur.nextval,'Editions Gallimard');
INSERT INTO EST_PUBLIE VALUES (IdLivre.currval,IdEditeur.currval);
INSERT INTO TRAVAILLE_AVEC VALUES (IdAuteur.currval,IdEditeur.currval);
INSERT INTO ECRIT_PAR VALUES (IdLivre.currval,IdAuteur.currval);

COMMIT;

-- Transaction n°2 : "Le meilleur des mondes" d'Aldous Huxley
INSERT INTO LIVRE VALUES (IdLivre.nextval,1,'Le meilleur des mondes','12/1998','Voici près d''un siècle, dans d''étourdissantes visions, Aldous Huxley imagine une civilisation future jusque dans ses rouages les plus surprenants : un Etat Mondial, parfaitement hiérarchisé, a cantonné les derniers humains "sauvages" dans des réserves. La culture in vitro des foetus a engendré le règne des "Alphas ", génétiquement déterminés à être l''élite dirigeante. Les castes inférieures, elles, sont conditionnées pour se satisfaire pleinement de leur sort. Dans cette société où le bonheur est loi, famille, monogamie, sentiments sont bannis. Le meilleur des mondes est possible. Aujourd''hui, il nous paraît même familier...',NULL);
INSERT INTO AUTEUR VALUES (IdAuteur.nextval,'Huxley','Aldous','Aldous Huxley est né le 26 juillet 1894, dans une famille appartenant à l''élite intellectuelle britannique. A 16 ans, une maladie des yeux le rend presque aveugle. Il parvient pourtant à obtenir son diplôme à Oxford, où il rencontre de nombreux écrivains, et se lie d''amitié avec D. H. Lawrence. En 1916, il publie un premier recueil de poèmes. Trois ans plus tard, il épouse Maria Nys, qui lui donne un fils, Matthew. Installés à Londres, ils voyagent en Inde et aux Etats-Unis. En 1931, quatre mois lui suffisent pour écrire Le Meilleur des mondes, qui connaît rapidement un succès international. En 1937, il s''installe avec sa famille aux Etats-Unis, où il devient scénariste pour Hollywood. En 1958, il publie Retour au meilleur des mondes. Dans les années cinquante, il s''intéresse aux drogues psychédéliques, et publie Les Portes de la perception en 1954, Le Ciel et l''Enfer en 1956 ou encore île en 1962. En 1959, il se voit décerner le Award of Merit for die Novel par l''Académie américaine des Arts et Lettres. Il s''éteint en 1963.');
INSERT INTO EDITEUR VALUES (IdEditeur.nextval,'Pocket');
INSERT INTO EST_PUBLIE VALUES (IdLivre.currval,IdEditeur.currval);
INSERT INTO TRAVAILLE_AVEC VALUES (IdAuteur.currval,IdEditeur.currval);
INSERT INTO ECRIT_PAR VALUES (IdLivre.currval,Idauteur.currval);

COMMIT;

-- Transaction n°3 : "La Ligne verte" de Stephen King
INSERT INTO LIVRE VALUES (IdLivre.nextval,2,'La Ligne verte','3/1996','Paul Edgecombe, ancien gardien-chef d''un pénitencier dans les années 1930, entreprend d''écrire ses mémoires. Il revient sur l''affaire John Caffey - ce grand Noir au regard absent, condamné à mort pour le viol et le meurtre de deux fillettes - qui défraya la chronique en 1932. La Ligne verte décrit un univers étouffant et brutal, où la défiance est la règle. Personne ne sort indemne de ce bâtiment coupé du monde, où cohabitent une étrange souris apprivoisée par un Cajun pyromane, le sadique Percy Wetmore, et Caffey, prisonnier sans problème. Assez rapidement convaincu de l''innocence de cet homme doté de pouvoirs surnaturels, Paul fera tout pour le sauver de la chaise électrique. Aux frontières du roman noir et du fantastique, ce récit est aussi une brillante réflexion sur la peine de mort. Un livre de Stephen King très différent de ses habituelles incursions dans l''horreur, terriblement efficace et dérangeant.',NULL);
INSERT INTO AUTEUR VALUES (IdAuteur.nextval,'King','Stephen','Stephen King a écrit plus de 50 romans, tous best-sellers et plus de 200 nouvelles. Il est devenu un mythe vivant de la littérature américaine (National Book Foundation Medal en 2003 pour sa contribution aux lettres américaines, Grand Master du Prix Edgar Allan Poe en 2007). Lors de sa venue à Paris en novembre 2013 pour la promotion exceptionnelle de Dr Sleep, il avait réuni près de 200 journalistes venus du monde entier et plus de 3 000 fans lors d''une rencontre au Grand Rex. Carnets noirs, le second volet d''une trilogie initiée avec Mr Mercedes, avait été récompensé par le Edgar Award 2014 du meilleur roman.');
INSERT INTO EDITEUR VALUES (IdEditeur.nextval,'LGF/Le Livre de Poche');
INSERT INTO EST_PUBLIE VALUES (IdLivre.currval,IdEditeur.currval);
INSERT INTO TRAVAILLE_AVEC VALUES (IdAuteur.currval,IdEditeur.currval);
INSERT INTO ECRIT_PAR VALUES (IdLivre.currval,IdAuteur.currval);

COMMIT;
