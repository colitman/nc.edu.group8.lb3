--some commands

CREATE TABLE COUNTRY
   (	 ID NUMBER NOT NULL, 
	 NAME VARCHAR2(256) NOT NULL, 
	 LANGUAGE VARCHAR2(256), 
	 POPULATION NUMBER, 
	 TIMEZONE NUMBER, 
	 CONSTRAINT COUNTRY_PK PRIMARY KEY (ID)
   )
/

CREATE SEQUENCE COUNTRY_SEQ;
/

CREATE TABLE REGION 
   (	 PARENT_ID NUMBER NOT NULL, 
	 ID NUMBER, 
	 NAME VARCHAR2(256) NOT NULL, 
	 POPULATION NUMBER, 
	 SQUARE NUMBER, 
	 CONSTRAINT REGION_PK PRIMARY KEY (ID), 
	 CONSTRAINT REGION_FK FOREIGN KEY (PARENT_ID)
	  REFERENCES  COUNTRY (ID) ON DELETE CASCADE
   )
/

CREATE SEQUENCE REGION_SEQ;
/

CREATE TABLE CITY
   (	 PARENT_ID NUMBER NOT NULL, 
	 ID NUMBER NOT NULL, 
	 NAME VARCHAR2(256) NOT NULL, 
	 POPULATION NUMBER, 
	 SQUARE NUMBER, 
	 CONSTRAINT CITY_PK PRIMARY KEY (ID), 
	 CONSTRAINT CITY_CON FOREIGN KEY (PARENT_ID)
	  REFERENCES  REGION (ID) ON DELETE CASCADE
   )
/

CREATE SEQUENCE CITY_SEQ;
/


CREATE TABLE UNIVERSITY 
   (	 PARENT_ID NUMBER NOT NULL, 
	 ID NUMBER, 
	 NAME VARCHAR2(256) NOT NULL, 
	 DEPARTAMENTS_COUNT NUMBER, 
	 WWW VARCHAR2(256), 
	 CONSTRAINT UNIVERSITY_PK PRIMARY KEY (ID), 
	 CONSTRAINT UNIVERSITY_FK FOREIGN KEY (PARENT_ID)
	  REFERENCES  CITY (ID) ON DELETE CASCADE
   )
/

CREATE SEQUENCE UNIVERSITY_SEQ;
/

INSERT INTO COUNTRY VALUES (COUNTRY_SEQ.nextval, "USA", "English (US)", 317320000, null);
INSERT INTO COUNTRY VALUES (COUNTRY_SEQ.nextval, "Russia", "Russian", 143608700, null);
INSERT INTO COUNTRY VALUES (COUNTRY_SEQ.nextval, "United Kingdom", "English (UK)", 63887988, null);
INSERT INTO COUNTRY VALUES (COUNTRY_SEQ.nextval, "Ukraine", "Ukrainian", 45447010, 2);
INSERT INTO COUNTRY VALUES (COUNTRY_SEQ.nextval, "Japan", "Japanese", 127325000, 9);

INSERT INTO REGION VALUES (4, REGION_SEQ.nextval, "Zhytomyr region", 1266938, 2983200);
INSERT INTO REGION VALUES (4, REGION_SEQ.nextval, "ARC", 1963000, 26200000);
INSERT INTO REGION VALUES (4, REGION_SEQ.nextval, "Sumy region", 1137069, 23834000);
INSERT INTO REGION VALUES (4, REGION_SEQ.nextval, "Kiev region", 1722875, 28131000);
INSERT INTO REGION VALUES (4, REGION_SEQ.nextval, "Kharkov region", 2762200, 31415000);

INSERT INTO CITY VALUES (3, CITY_SEQ.nextval, "Konotop", 88983, 103);
INSERT INTO CITY VALUES (3, CITY_SEQ.nextval, "Seredyna-Buda", 7526, null);
INSERT INTO CITY VALUES (3, CITY_SEQ.nextval, "Sumy", 271016, 145);
INSERT INTO CITY VALUES (3, CITY_SEQ.nextval, "Nedrygailov", 6186, null);
INSERT INTO CITY VALUES (3, CITY_SEQ.nextval, "Lebedyn", 26226, 10);

INSERT INTO UNIVERSITY VALUES (3, UNIVERSITY_SEQ.nextval, "Sumy State Makarenko Pedagogical University", 8, "www.sspu.sumy.ua");
INSERT INTO UNIVERSITY VALUES (3, UNIVERSITY_SEQ.nextval, "Sumy National Agrarian University", 9, "www.sau.sumy.ua");
INSERT INTO UNIVERSITY VALUES (3, UNIVERSITY_SEQ.nextval, "Ukrainian Academy of Banking", 3, "www.uabs.edu.ua");
INSERT INTO UNIVERSITY VALUES (3, UNIVERSITY_SEQ.nextval, "Sumy Institute of Inter-Regional Academy of Personnel Management", 3, null);
INSERT INTO UNIVERSITY VALUES (3, UNIVERSITY_SEQ.nextval, "Sumy State University", 5, "www.sumdu.edu.ua");	