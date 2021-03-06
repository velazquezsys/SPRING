﻿/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 12.0 		*/
/*  Created On : 14-dic.-2016 10:55:28 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Drop Sequences for Autonumber Columns */

DROP SEQUENCE IF EXISTS "prototipo"."pais_idpais_seq"
;

DROP SEQUENCE IF EXISTS "prototipo"."provincia_idprovincia_seq"
;

DROP SEQUENCE IF EXISTS "prototipo"."provincia_idpais_seq"
;

DROP SEQUENCE IF EXISTS "prototipo"."municipio_idmunicipio_seq"
;

DROP SEQUENCE IF EXISTS "prototipo"."municipio_idprovincia_seq"
;

/* Drop Tables */

DROP TABLE IF EXISTS "prototipo"."pais" CASCADE
;

DROP TABLE IF EXISTS "prototipo"."provincia" CASCADE
;

DROP TABLE IF EXISTS "prototipo"."municipio" CASCADE
;

/* Create Tables */

CREATE TABLE "prototipo"."pais"
(
	"idpais" serial NOT NULL,
	"nombre" varchar(250)	 NOT NULL
)
;

CREATE TABLE "prototipo"."provincia"
(
	"idProvincia" serial NOT NULL,
	"nombre" varchar(250)	 NOT NULL,
	"idpais" serial NOT NULL
)
;

CREATE TABLE "prototipo"."municipio"
(
	"idmunicipio" serial NOT NULL,
	"nombre" varchar(250)	 NOT NULL,
	"idProvincia" serial NOT NULL
)
;

/* Create Table Comments, Sequences for Autonumber Columns */

CREATE SEQUENCE "prototipo"."pais_idpais_seq" INCREMENT 1 START 1
;

CREATE SEQUENCE "prototipo"."provincia_idprovincia_seq" INCREMENT 1 START 1
;

CREATE SEQUENCE "prototipo"."provincia_idpais_seq" INCREMENT 1 START 1
;

CREATE SEQUENCE "prototipo"."municipio_idmunicipio_seq" INCREMENT 1 START 1
;

CREATE SEQUENCE "prototipo"."municipio_idprovincia_seq" INCREMENT 1 START 1
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE "prototipo"."pais" ADD CONSTRAINT "PK_Tais"
	PRIMARY KEY ("idpais")
;

ALTER TABLE "prototipo"."provincia" ADD CONSTRAINT "PK_Provincia"
	PRIMARY KEY ("idProvincia")
;

CREATE INDEX "IXFK_provincia_pais" ON "prototipo"."provincia" ("idpais" ASC,"idProvincia" ASC)
;

ALTER TABLE "prototipo"."municipio" ADD CONSTRAINT "PK_Municipio"
	PRIMARY KEY ("idmunicipio")
;

CREATE INDEX "IXFK_municipio_provincia" ON "prototipo"."municipio" ("idProvincia" ASC,"idmunicipio" ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE "prototipo"."provincia" ADD CONSTRAINT "FK_Pais"
	FOREIGN KEY ("idpais") REFERENCES  "prototipo"."pais" ("idpais") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "prototipo"."municipio" ADD CONSTRAINT "FK_Provincia"
	FOREIGN KEY ("idProvincia") REFERENCES "prototipo"."provincia" ("idProvincia") ON DELETE No Action ON UPDATE No Action
;
