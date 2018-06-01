-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                      Oracle Version 10g
--                        (1/6/2018 7:55:59)
-- -----------------------------------------------------------------------------
--      Nom de la base : Biblioweb
--      Projet : Accueil Win'Design version 15
--      Auteur : ESIG
--      Date de dernière modification : 1/6/2018 7:55:43
-- -----------------------------------------------------------------------------

DROP TABLE AUTEUR CASCADE CONSTRAINTS;

DROP TABLE LIVRE CASCADE CONSTRAINTS;

DROP TABLE FORMAT CASCADE CONSTRAINTS;

DROP TABLE GENRE CASCADE CONSTRAINTS;

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
    NOM_AUTEUR VARCHAR2(128)  NULL,
    PRENOM_AUTEUR VARCHAR2(128)  NULL
,   CONSTRAINT PK_AUTEUR PRIMARY KEY (ID_AUTEUR)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : LIVRE
-- -----------------------------------------------------------------------------

CREATE TABLE LIVRE
   (
    ID_LIVRE NUMBER(2)  NOT NULL,
    ID_FORMAT CHAR(32)  NOT NULL,
    ID_AVANCEMENT NUMBER(2)  NOT NULL,
    ID_GENRE CHAR(32)  NOT NULL,
    TITRE_LIVRE VARCHAR2(128)  NULL,
    SYNOPSIS_LIVRE VARCHAR2(128)  NULL,
    ILLUSTRATION_LIVRE BLOB  NULL,
    DATEPARUTION_LIVRE DATE  NULL
,   CONSTRAINT PK_LIVRE PRIMARY KEY (ID_LIVRE)  
   ) ;

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE LIVRE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_LIVRE_FORMAT
     ON LIVRE (ID_FORMAT ASC)
    ;

CREATE  INDEX I_FK_LIVRE_AVANCEMENT
     ON LIVRE (ID_AVANCEMENT ASC)
    ;

CREATE  INDEX I_FK_LIVRE_GENRE
     ON LIVRE (ID_GENRE ASC)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : FORMAT
-- -----------------------------------------------------------------------------

CREATE TABLE FORMAT
   (
    ID_FORMAT CHAR(32)  NOT NULL,
    NOM_FORMAT CHAR(32)  NULL
,   CONSTRAINT PK_FORMAT PRIMARY KEY (ID_FORMAT)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : GENRE
-- -----------------------------------------------------------------------------

CREATE TABLE GENRE
   (
    ID_GENRE CHAR(32)  NOT NULL,
    NOM_GENRE CHAR(32)  NULL
,   CONSTRAINT PK_GENRE PRIMARY KEY (ID_GENRE)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : AVANCEMENT
-- -----------------------------------------------------------------------------

CREATE TABLE AVANCEMENT
   (
    ID_AVANCEMENT NUMBER(2)  NOT NULL,
    STATUT_AVANCEMENT VARCHAR2(128)  NULL   CHECK (STATUT_AVANCEMENT IN ('LU', 'ENC', 'NLU'))
,   CONSTRAINT PK_AVANCEMENT PRIMARY KEY (ID_AVANCEMENT)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : EDITEUR
-- -----------------------------------------------------------------------------

CREATE TABLE EDITEUR
   (
    ID_EDITEUR NUMBER(2)  NOT NULL,
    NOM_EDITEUR VARCHAR2(128)  NULL
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
--       INDEX DE LA TABLE EST_PUBLIE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EST_PUBLIE_LIVRE
     ON EST_PUBLIE (ID_LIVRE ASC)
    ;

CREATE  INDEX I_FK_EST_PUBLIE_EDITEUR
     ON EST_PUBLIE (ID_EDITEUR ASC)
    ;

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
--       INDEX DE LA TABLE TRAVAILLE_AVEC
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_TRAVAILLE_AVEC_AUTEUR
     ON TRAVAILLE_AVEC (ID_AUTEUR ASC)
    ;

CREATE  INDEX I_FK_TRAVAILLE_AVEC_EDITEUR
     ON TRAVAILLE_AVEC (ID_EDITEUR ASC)
    ;

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
--       INDEX DE LA TABLE ECRIT_PAR
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_ECRIT_PAR_LIVRE
     ON ECRIT_PAR (ID_LIVRE ASC)
    ;

CREATE  INDEX I_FK_ECRIT_PAR_AUTEUR
     ON ECRIT_PAR (ID_AUTEUR ASC)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE LIVRE ADD (
     CONSTRAINT FK_LIVRE_FORMAT
          FOREIGN KEY (ID_FORMAT)
               REFERENCES FORMAT (ID_FORMAT))   ;

ALTER TABLE LIVRE ADD (
     CONSTRAINT FK_LIVRE_AVANCEMENT
          FOREIGN KEY (ID_AVANCEMENT)
               REFERENCES AVANCEMENT (ID_AVANCEMENT))   ;

ALTER TABLE LIVRE ADD (
     CONSTRAINT FK_LIVRE_GENRE
          FOREIGN KEY (ID_GENRE)
               REFERENCES GENRE (ID_GENRE))   ;

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