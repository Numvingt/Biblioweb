-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour Biblioweb
-- -----------------------------------------------------------------------------
--      Nom de la base : Biblioweb
--      Projet : Projet Individuel
--      Auteur : NOSELLAL
--      Date de dernière modification : 24/5/2018
-- -----------------------------------------------------------------------------

DROP TABLE AUTEUR CASCADE CONSTRAINTS;

DROP TABLE LIVRE CASCADE CONSTRAINTS;

DROP TABLE AVANCEMENT CASCADE CONSTRAINTS;

DROP TABLE EDITEUR CASCADE CONSTRAINTS;

DROP TABLE EST_PUBLIE CASCADE CONSTRAINTS;

DROP TABLE TRAVAILLE_AVEC CASCADE CONSTRAINTS;

DROP TABLE ECRIT_PAR CASCADE CONSTRAINTS;

-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE Biblioweb;

-- -----------------------------------------------------------------------------
--       TABLE : AUTEUR
-- -----------------------------------------------------------------------------

CREATE TABLE AUTEUR
   (
    ID_AUTEUR NUMBER(2)  NOT NULL,
    NOM_AUTEUR VARCHAR2(50)  NULL,
    PRENOM_AUTEUR VARCHAR2(50)  NULL
,   CONSTRAINT PK_AUTEUR PRIMARY KEY (ID_AUTEUR)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : LIVRE
-- -----------------------------------------------------------------------------

CREATE TABLE LIVRE
   (
    ID_LIVRE NUMBER(2)  NOT NULL,
    ID_AVANCEMENT NUMBER(2)  NOT NULL,
    TITRE_LIVRE VARCHAR2(50)  NULL,
    SYNOPSIS_LIVRE VARCHAR2(128)  NULL,
    ILLUSTRATION_LIVRE BLOB  NULL,
    DATEPARUTION_LIVRE DATE  NULL
,   CONSTRAINT PK_LIVRE PRIMARY KEY (ID_LIVRE)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : AVANCEMENT
-- -----------------------------------------------------------------------------

CREATE TABLE AVANCEMENT
   (
    ID_AVANCEMENT NUMBER(2)  NOT NULL,
    STATUT_AVANCEMENT VARCHAR2(3)  NULL   CHECK (STATUT_AVANCEMENT IN ('LU', 'ENC', 'NLU'))
,   CONSTRAINT PK_AVANCEMENT PRIMARY KEY (ID_AVANCEMENT)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : EDITEUR
-- -----------------------------------------------------------------------------

CREATE TABLE EDITEUR
   (
    ID_EDITEUR NUMBER(2)  NOT NULL,
    NOM_EDITEUR VARCHAR2(50)  NULL
,   CONSTRAINT PK_EDITEUR PRIMARY KEY (ID_EDITEUR)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : EST_PUBLIE
-- -----------------------------------------------------------------------------

CREATE TABLE EST_PUBLIE
   (
    ID_LIVRE NUMBER(2)  NOT NULL,
    ID_EDITEUR NUMBER(2)  NOT NULL
,   CONSTRAINT PK_EST_PUBLIE PRIMARY KEY (ID_LIVRE, ID_EDITEUR)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : TRAVAILLE_AVEC
-- -----------------------------------------------------------------------------

CREATE TABLE TRAVAILLE_AVEC
   (
    ID_AUTEUR NUMBER(2)  NOT NULL,
    ID_EDITEUR NUMBER(2)  NOT NULL
,   CONSTRAINT PK_TRAVAILLE_AVEC PRIMARY KEY (ID_AUTEUR, ID_EDITEUR)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : ECRIT_PAR
-- -----------------------------------------------------------------------------

CREATE TABLE ECRIT_PAR
   (
    ID_LIVRE NUMBER(2)  NOT NULL,
    ID_AUTEUR NUMBER(2)  NOT NULL
,   CONSTRAINT PK_ECRIT_PAR PRIMARY KEY (ID_LIVRE, ID_AUTEUR)  
   ) ;

-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE LIVRE ADD (
     CONSTRAINT FK_LIVRE_AVANCEMENT
          FOREIGN KEY (ID_AVANCEMENT)
               REFERENCES AVANCEMENT (ID_AVANCEMENT))   ;

ALTER TABLE EST_PUBLIE ADD (
     CONSTRAINT FK_EST_PUBLIE_LIVRE
          FOREIGN KEY (ID_LIVRE)
               REFERENCES LIVRE (ID_LIVRE))   ;

ALTER TABLE EST_PUBLIE ADD (
     CONSTRAINT FK_EST_PUBLIE_EDITEUR
          FOREIGN KEY (ID_EDITEUR)
               REFERENCES EDITEUR (ID_EDITEUR))   ;

ALTER TABLE TRAVAILLE_AVEC ADD (
     CONSTRAINT FK_TRAVAILLE_AVEC_AUTEUR
          FOREIGN KEY (ID_AUTEUR)
               REFERENCES AUTEUR (ID_AUTEUR))   ;

ALTER TABLE TRAVAILLE_AVEC ADD (
     CONSTRAINT FK_TRAVAILLE_AVEC_EDITEUR
          FOREIGN KEY (ID_EDITEUR)
               REFERENCES EDITEUR (ID_EDITEUR))   ;

ALTER TABLE ECRIT_PAR ADD (
     CONSTRAINT FK_ECRIT_PAR_LIVRE
          FOREIGN KEY (ID_LIVRE)
               REFERENCES LIVRE (ID_LIVRE))   ;

ALTER TABLE ECRIT_PAR ADD (
     CONSTRAINT FK_ECRIT_PAR_AUTEUR
          FOREIGN KEY (ID_AUTEUR)
               REFERENCES AUTEUR (ID_AUTEUR))   ;


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------