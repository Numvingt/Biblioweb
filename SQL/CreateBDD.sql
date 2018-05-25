-- -----------------------------------------------------------------------------
--             G�n�ration d'une base de donn�es pour Biblioweb
-- -----------------------------------------------------------------------------
--      Nom de la base : Biblioweb
--      Projet : Projet Individuel
--      Auteur : NOSELLAL
--      Date de derni�re modification : 25/5/2018
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
--       SUPPRESSION DES TABLES 
-- -----------------------------------------------------------------------------

DROP TABLE ECRIT_PAR;

DROP TABLE TRAVAILLE_AVEC;

DROP TABLE EST_PUBLIE;

DROP TABLE LIVRE;

DROP TABLE EDITEUR;

DROP TABLE AVANCEMENT;

DROP TABLE AUTEUR;

-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE BIBLIOWEB;

-- -----------------------------------------------------------------------------
--       TABLE : AUTEUR
-- -----------------------------------------------------------------------------

CREATE TABLE AUTEUR
   (
    ID_AUTEUR NUMBER(2)  
              CONSTRAINT NN_ID_AUTEUR NOT NULL
              CONSTRAINT PK_AUTEUR PRIMARY KEY,
    NOM_AUTEUR VARCHAR2(50) 
              CONSTRAINT NN_NOM_AUTEUR NOT NULL,
    PRENOM_AUTEUR VARCHAR2(50)  NULL 
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : AVANCEMENT
-- -----------------------------------------------------------------------------

CREATE TABLE AVANCEMENT
   (
    ID_AVANCEMENT NUMBER(2)  
                  CONSTRAINT NN_ID_AVANCEMENT NOT NULL
                  CONSTRAINT PK_AVANCEMENT PRIMARY KEY,
    STATUT_AVANCEMENT VARCHAR2(3)  
                      CONSTRAINT NN_STATUT_AVANCEMENT NOT NULL   
                      CONSTRAINT CK_STATUT_AVANCEMENT CHECK (STATUT_AVANCEMENT IN ('LU', 'ENC', 'NLU')) 
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : EDITEUR
-- -----------------------------------------------------------------------------

CREATE TABLE EDITEUR
   (
    ID_EDITEUR NUMBER(2)  
               CONSTRAINT NN_ID_EDITEUR NOT NULL
               CONSTRAINT PK_EDITEUR PRIMARY KEY,
    NOM_EDITEUR VARCHAR2(50)  
                CONSTRAINT NN_NOM_EDITEUR NOT NULL  
   ) ;
   
-- -----------------------------------------------------------------------------
--       TABLE : LIVRE
-- -----------------------------------------------------------------------------

CREATE TABLE LIVRE
   (
    ID_LIVRE NUMBER(2)  
             CONSTRAINT NN_ID_LIVRE NOT NULL
             CONSTRAINT PK_LIVRE PRIMARY KEY,
    ID_AVANCEMENT NUMBER(2)  
                  CONSTRAINT NN_ID_AVANCEMENT_LIVRE NOT NULL
                  CONSTRAINT FK_LIVRE_AVANCEMENT REFERENCES AVANCEMENT (ID_AVANCEMENT),
    TITRE_LIVRE VARCHAR2(50)
                CONSTRAINT NN_TITRE_LIVRE NOT NULL,
    SYNOPSIS_LIVRE VARCHAR2(128)  NULL,
    ILLUSTRATION_LIVRE BLOB  NULL,
    DATEPARUTION_LIVRE DATE
                       CONSTRAINT NN_DATEPARUTION_LIVRE NOT NULL
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : EST_PUBLIE
-- -----------------------------------------------------------------------------

CREATE TABLE EST_PUBLIE
   (
    ID_LIVRE NUMBER(2)  
             CONSTRAINT NN_ID_LIVRE_EST_PUBLIE NOT NULL
             CONSTRAINT FK_EST_PUBLIE_LIVRE REFERENCES LIVRE (ID_LIVRE),
    ID_EDITEUR NUMBER(2)  
               CONSTRAINT NN_ID_EDITEUR_EST_PUBLIE NOT NULL
               CONSTRAINT FK_EST_PUBLIE_EDITEUR REFERENCES EDITEUR (ID_EDITEUR),   
    CONSTRAINT PK_EST_PUBLIE PRIMARY KEY (ID_LIVRE, ID_EDITEUR)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : TRAVAILLE_AVEC
-- -----------------------------------------------------------------------------

CREATE TABLE TRAVAILLE_AVEC
   (
    ID_AUTEUR NUMBER(2)  
              CONSTRAINT NN_ID_AUTEUR_TRAVAILLE_AVEC NOT NULL
              CONSTRAINT FK_TRAVAILLE_AVEC_AUTEUR REFERENCES AUTEUR (ID_AUTEUR),
    ID_EDITEUR NUMBER(2)  
               CONSTRAINT NN_ID_EDITEUR_TRAVAILLE_AVEC NOT NULL
               CONSTRAINT FK_TRAVAILLE_AVEC_EDITEUR REFERENCES EDITEUR (ID_EDITEUR),   
    CONSTRAINT PK_TRAVAILLE_AVEC PRIMARY KEY (ID_AUTEUR, ID_EDITEUR)  
   ) ;

-- -----------------------------------------------------------------------------
--       TABLE : ECRIT_PAR
-- -----------------------------------------------------------------------------

CREATE TABLE ECRIT_PAR
   (
    ID_LIVRE NUMBER(2)  
             CONSTRAINT NN_ID_LIVRE_ECRIT_PAR NOT NULL
             CONSTRAINT FK_ECRIT_PAR_LIVRE REFERENCES LIVRE (ID_LIVRE),
    ID_AUTEUR NUMBER(2)  
              CONSTRAINT NN_ID_AUTEUR_ECRIT_PAR NOT NULL
             CONSTRAINT FK_ECRIT_PAR_AUTEUR REFERENCES AUTEUR (ID_AUTEUR),   
    CONSTRAINT PK_ECRIT_PAR PRIMARY KEY (ID_LIVRE, ID_AUTEUR)  
   ) ;
