-- -----------------------------------------------------------------------------
--             Insertion des donn�es dans la BDD Biblioweb
-- -----------------------------------------------------------------------------
--      Nom de la base : Biblioweb
--      Projet : Projet Individuel
--      Auteur : NOSELLAL
--      Date de derni�re modification : 25/5/2018
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

-- Insertions pr�alables
ALTER SESSION SET NLS_DATE_FORMAT = "MM/YYYY";
-- -----------------------------------------------------------------------------
-- Transaction n�1 : Remplissage de la table d'avancement
INSERT INTO AVANCEMENT VALUES (IdAvancement.nextval,'LU');
INSERT INTO AVANCEMENT VALUES (IdAvancement.nextval,'NLU');
INSERT INTO AVANCEMENT VALUES (IdAvancement.nextval,'ENC');

COMMIT;
-- -----------------------------------------------------------------------------
-- Transaction n�2 : "1984" de G.Orwells
INSERT INTO LIVRE VALUES (IdLivre.nextval,1,'1984','11/1972','De tous les carrefours importants, le visage � la moustache noire vous fixait du regard. Il y en avait un sur le mur d''en face. BIG BROTHER VOUS REGARDE, r�p�tait la l�gende, tandis que le regard des yeux noirs p�n�trait les yeux de WINSTON... Au loin, un h�licopt�re glissa entre les toits, plana un moment, telle une mouche bleue, puis repartit comme une fl�che, dans un vol courbe. C''�tait une patrouille qui venait mettre le nez aux fen�tres des gens. Mais les patrouilles n''avaient pas d''importance. Seule comptait la Police de la Pens�e.',NULL);
INSERT INTO AUTEUR VALUES (IdAuteur.nextval,'Orwell','George','GEORGE ORWELL (1903-1950) a �t� policier aux Indes, clochard � Paris, combattant en Espagne, speaker � la BBC et surtout un grand �crivain : La vache enrag�e, Et vive l''Aspidistra, Hommage � la Catalogne, La ferme des animaux, et le proph�tique 1984, peinture d''un terrifiant monde totalitaire.');
INSERT INTO EDITEUR VALUES (IdEditeur.nextval,'Editions Gallimard');
INSERT INTO EST_PUBLIE VALUES (IdLivre.currval,IdEditeur.currval);
INSERT INTO TRAVAILLE_AVEC VALUES (IdAuteur.currval,IdEditeur.currval);
INSERT INTO ECRIT_PAR VALUES (IdLivre.currval,IdAuteur.currval);

COMMIT;

-- Transaction n�2 : "Le meilleur des mondes" d'Aldous Huxley
INSERT INTO LIVRE VALUES (IdLivre.nextval,1,'Le meilleur des mondes','12/1998','Voici pr�s d''un si�cle, dans d''�tourdissantes visions, Aldous Huxley imagine une civilisation future jusque dans ses rouages les plus surprenants : un Etat Mondial, parfaitement hi�rarchis�, a cantonn� les derniers humains "sauvages" dans des r�serves. La culture in vitro des foetus a engendr� le r�gne des "Alphas ", g�n�tiquement d�termin�s � �tre l''�lite dirigeante. Les castes inf�rieures, elles, sont conditionn�es pour se satisfaire pleinement de leur sort. Dans cette soci�t� o� le bonheur est loi, famille, monogamie, sentiments sont bannis. Le meilleur des mondes est possible. Aujourd''hui, il nous para�t m�me familier...',NULL);
INSERT INTO AUTEUR VALUES (IdAuteur.nextval,'Huxley','Aldous','Aldous Huxley est n� le 26 juillet 1894, dans une famille appartenant � l''�lite intellectuelle britannique. A 16 ans, une maladie des yeux le rend presque aveugle. Il parvient pourtant � obtenir son dipl�me � Oxford, o� il rencontre de nombreux �crivains, et se lie d''amiti� avec D. H. Lawrence. En 1916, il publie un premier recueil de po�mes. Trois ans plus tard, il �pouse Maria Nys, qui lui donne un fils, Matthew. Install�s � Londres, ils voyagent en Inde et aux Etats-Unis. En 1931, quatre mois lui suffisent pour �crire Le Meilleur des mondes, qui conna�t rapidement un succ�s international. En 1937, il s''installe avec sa famille aux Etats-Unis, o� il devient sc�nariste pour Hollywood. En 1958, il publie Retour au meilleur des mondes. Dans les ann�es cinquante, il s''int�resse aux drogues psych�d�liques, et publie Les Portes de la perception en 1954, Le Ciel et l''Enfer en 1956 ou encore �le en 1962. En 1959, il se voit d�cerner le Award of Merit for die Novel par l''Acad�mie am�ricaine des Arts et Lettres. Il s''�teint en 1963.');
INSERT INTO EDITEUR VALUES (IdEditeur.nextval,'Pocket');
INSERT INTO EST_PUBLIE VALUES (IdLivre.currval,IdEditeur.currval);
INSERT INTO TRAVAILLE_AVEC VALUES (IdAuteur.currval,IdEditeur.currval);
INSERT INTO ECRIT_PAR VALUES (IdLivre.currval,Idauteur.currval);

COMMIT;

-- Transaction n�3 : "La Ligne verte" de Stephen King
INSERT INTO LIVRE VALUES (IdLivre.nextval,2,'La Ligne verte','3/1996','Paul Edgecombe, ancien gardien-chef d''un p�nitencier dans les ann�es 1930, entreprend d''�crire ses m�moires. Il revient sur l''affaire John Caffey - ce grand Noir au regard absent, condamn� � mort pour le viol et le meurtre de deux fillettes - qui d�fraya la chronique en 1932. La Ligne verte d�crit un univers �touffant et brutal, o� la d�fiance est la r�gle. Personne ne sort indemne de ce b�timent coup� du monde, o� cohabitent une �trange souris apprivois�e par un Cajun pyromane, le sadique Percy Wetmore, et Caffey, prisonnier sans probl�me. Assez rapidement convaincu de l''innocence de cet homme dot� de pouvoirs surnaturels, Paul fera tout pour le sauver de la chaise �lectrique. Aux fronti�res du roman noir et du fantastique, ce r�cit est aussi une brillante r�flexion sur la peine de mort. Un livre de Stephen King tr�s diff�rent de ses habituelles incursions dans l''horreur, terriblement efficace et d�rangeant.',NULL);
INSERT INTO AUTEUR VALUES (IdAuteur.nextval,'King','Stephen','Stephen King a �crit plus de 50 romans, tous best-sellers et plus de 200 nouvelles. Il est devenu un mythe vivant de la litt�rature am�ricaine (National Book Foundation Medal en 2003 pour sa contribution aux lettres am�ricaines, Grand Master du Prix Edgar Allan Poe en 2007). Lors de sa venue � Paris en novembre 2013 pour la promotion exceptionnelle de Dr Sleep, il avait r�uni pr�s de 200 journalistes venus du monde entier et plus de 3 000 fans lors d''une rencontre au Grand Rex. Carnets noirs, le second volet d''une trilogie initi�e avec Mr Mercedes, avait �t� r�compens� par le Edgar Award 2014 du meilleur roman.');
INSERT INTO EDITEUR VALUES (IdEditeur.nextval,'LGF/Le Livre de Poche');
INSERT INTO EST_PUBLIE VALUES (IdLivre.currval,IdEditeur.currval);
INSERT INTO TRAVAILLE_AVEC VALUES (IdAuteur.currval,IdEditeur.currval);
INSERT INTO ECRIT_PAR VALUES (IdLivre.currval,IdAuteur.currval);

COMMIT;
