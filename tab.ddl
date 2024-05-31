-- G�n�r� par Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   � :        2024-05-20 15:31:14 HAE
--   site :      Oracle Database 11g
--   type :      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE article_commande (
    id          NUMBER NOT NULL,
    quantite    NUMBER NOT NULL,
    commande_id NUMBER NOT NULL,
    livre_id    NUMBER NOT NULL
);

ALTER TABLE article_commande ADD CONSTRAINT article_commande_pk PRIMARY KEY ( id );

CREATE TABLE commande (
    id              NUMBER NOT NULL,
    date_commande   DATE NOT NULL,
    utilisateurs_id NUMBER NOT NULL
);

ALTER TABLE commande ADD CONSTRAINT commande_pk PRIMARY KEY ( id );

CREATE TABLE livre (
    id     NUMBER NOT NULL,
    titre  VARCHAR2(100) NOT NULL,
    auteur VARCHAR2(100) NOT NULL,
    prix   NUMBER(10, 2) NOT NULL
);

ALTER TABLE livre ADD CONSTRAINT livre_pk PRIMARY KEY ( id );

CREATE TABLE utilisateurs (
    id              NUMBER NOT NULL,
    nom_utilisateur VARCHAR2(50) NOT NULL,
    email           VARCHAR2(100) NOT NULL,
    mot_de_passe    VARCHAR2(100) NOT NULL
);

ALTER TABLE utilisateurs ADD CONSTRAINT utilisateurs_pk PRIMARY KEY ( id );

ALTER TABLE article_commande
    ADD CONSTRAINT article_commande_commande_fk FOREIGN KEY ( commande_id )
        REFERENCES commande ( id );

ALTER TABLE article_commande
    ADD CONSTRAINT article_commande_livre_fk FOREIGN KEY ( livre_id )
        REFERENCES livre ( id );

ALTER TABLE commande
    ADD CONSTRAINT commande_utilisateurs_fk FOREIGN KEY ( utilisateurs_id )
        REFERENCES utilisateurs ( id );



-- Rapport r�capitulatif d'Oracle SQL Developer Data Modeler : 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             0
-- ALTER TABLE                              7
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
