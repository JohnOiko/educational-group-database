CREATE TABLE ΜΑΘΗΜΑ (
  κωδικός INTEGER  NOT NULL  ,
  τίτλος VARCHAR(45)  NOT NULL  ,
  περιγραφή VARCHAR(255)  NOT NULL    ,
PRIMARY KEY(κωδικός));



CREATE TABLE ΣΧΟΛΗ (
  κωδικός INTEGER  NOT NULL  ,
  τίτλος VARCHAR(45)  NOT NULL  ,
  πόλη VARCHAR(45)  NOT NULL  ,
  οδός VARCHAR(45)  NOT NULL  ,
  αριθμός INTEGER  NOT NULL  ,
  ΤΚ INTEGER  NOT NULL    ,
PRIMARY KEY(κωδικός));



CREATE TABLE ΚΑΘΗΓΗΤΗΣ (
  κωδικός INTEGER  NOT NULL  ,
  όνομα VARCHAR(45)  NOT NULL  ,
  επίθετο VARCHAR(45)  NOT NULL  ,
  ειδικότητα VARCHAR(45)  NOT NULL  ,
  πόλη VARCHAR(45)  NOT NULL  ,
  οδός VARCHAR(45)  NOT NULL  ,
  αριθμός INTEGER  NOT NULL  ,
  ΤΚ INTEGER  NOT NULL  ,
  τηλέφωνο_επικοινωνίας INTEGER  NOT NULL    ,
PRIMARY KEY(κωδικός));



CREATE TABLE ΤΗΛΕΦΩΝΑ (
  ΣΧΟΛΗ_κωδικός INTEGER  NOT NULL  ,
  τηλέφωνο INTEGER  NOT NULL    ,
  FOREIGN KEY(ΣΧΟΛΗ_κωδικός)
    REFERENCES ΣΧΟΛΗ(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ΤΗΛΕΦΩΝΑ_FKIndex1 ON ΤΗΛΕΦΩΝΑ (ΣΧΟΛΗ_κωδικός);



CREATE TABLE ΥΠΑΛΛΗΛΟΣ (
  κωδικός INTEGER  NOT NULL  ,
  ΣΧΟΛΗ_κωδικός INTEGER  NOT NULL  ,
  όνομα VARCHAR(45)  NOT NULL  ,
  επώνυμο VARCHAR(45)  NOT NULL  ,
  θέση_εργασίας VARCHAR(45)  NOT NULL  ,
  πόλη VARCHAR(45)  NOT NULL  ,
  οδός VARCHAR(45)  NOT NULL  ,
  αριθμός VARCHAR(45)  NOT NULL  ,
  ΤΚ VARCHAR(45)  NOT NULL  ,
  ΑΦΜ INT  NOT NULL  ,
  ΑΤ VARCHAR(45)  NOT NULL  ,
  τηλέφωνο_επικοινωνίας INTEGER  NOT NULL  ,
  ημερομηνία_πρόσληψης DATE  NOT NULL    ,
PRIMARY KEY(κωδικός)  ,
  FOREIGN KEY(ΣΧΟΛΗ_κωδικός)
    REFERENCES ΣΧΟΛΗ(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ΥΠΑΛΛΗΛΟΣ_FKIndex1 ON ΥΠΑΛΛΗΛΟΣ (ΣΧΟΛΗ_κωδικός);



CREATE TABLE ΤΜΗΜΑ (
  κωδικός INTEGER  NOT NULL  ,
  ΣΧΟΛΗ_κωδικός INTEGER  NOT NULL  ,
  διακριτικός_τίτλος VARCHAR(45)  NOT NULL  ,
  αριθμός INTEGER  NOT NULL  ,
  πλήθος_μαθητών INTEGER  NOT NULL    ,
PRIMARY KEY(κωδικός)  ,
  FOREIGN KEY(ΣΧΟΛΗ_κωδικός)
    REFERENCES ΣΧΟΛΗ(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ΤΜΗΜΑ_FKIndex1 ON ΤΜΗΜΑ (ΣΧΟΛΗ_κωδικός);



CREATE TABLE ΜΑΘΗΤΗΣ (
  κωδικός INTEGER  NOT NULL  ,
  ΤΜΗΜΑ_κωδικός INTEGER  NOT NULL  ,
  όνομα VARCHAR(45)  NOT NULL  ,
  επίθετο VARCHAR(45)  NOT NULL  ,
  όνομα_μητέρας VARCHAR(45)  NOT NULL  ,
  όνομα_πατέρα VARCHAR(45)  NOT NULL  ,
  ημερομηνία_γέννησης DATE  NOT NULL  ,
  πόλη VARCHAR(45)  NOT NULL  ,
  οδός VARCHAR(45)  NOT NULL  ,
  αριθμός INTEGER  NOT NULL  ,
  ΤΚ INTEGER  NOT NULL  ,
  σταθερό_τηλέφωνο INTEGER  NOT NULL  ,
  κινητό_τηλέφωνο INTEGER  NOT NULL  ,
  αριθμός_απουσιών INTEGER  NOT NULL    ,
PRIMARY KEY(κωδικός)  ,
  FOREIGN KEY(ΤΜΗΜΑ_κωδικός)
    REFERENCES ΤΜΗΜΑ(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ΜΑΘΗΤΗΣ_FKIndex1 ON ΜΑΘΗΤΗΣ (ΤΜΗΜΑ_κωδικός);



CREATE TABLE ΚΑΘΗΓΗΤΗΣ_ΕΡΓΑΖΕΤΑΙ_ΣΕ_ΣΧΟΛΗ (
  ΣΧΟΛΗ_κωδικός INTEGER  NOT NULL  ,
  ΚΑΘΗΓΗΤΗΣ_κωδικός INTEGER  NOT NULL  ,
  ωράριο_εργασίας TEXT  NOT NULL    ,
PRIMARY KEY(ΣΧΟΛΗ_κωδικός, ΚΑΘΗΓΗΤΗΣ_κωδικός)    ,
  FOREIGN KEY(ΣΧΟΛΗ_κωδικός)
    REFERENCES ΣΧΟΛΗ(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ΚΑΘΗΓΗΤΗΣ_κωδικός)
    REFERENCES ΚΑΘΗΓΗΤΗΣ(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ΚΑΘΗΓΗΤΗΣ_ΕΡΓΑΖΕΤΑΙ_ΣΕ_ΣΧΟΛΗ_FKIndex1 ON ΚΑΘΗΓΗΤΗΣ_ΕΡΓΑΖΕΤΑΙ_ΣΕ_ΣΧΟΛΗ (ΣΧΟΛΗ_κωδικός);
CREATE INDEX ΚΑΘΗΓΗΤΗΣ_ΕΡΓΑΖΕΤΑΙ_ΣΕ_ΣΧΟΛΗ_FKIndex2 ON ΚΑΘΗΓΗΤΗΣ_ΕΡΓΑΖΕΤΑΙ_ΣΕ_ΣΧΟΛΗ (ΚΑΘΗΓΗΤΗΣ_κωδικός);



CREATE TABLE ΚΑΘΗΓΗΤΗΣ_ΔΙΔΑΣΚΕΙ_ΜΑΘΗΜΑ (
  ΚΑΘΗΓΗΤΗΣ_κωδικός INTEGER  NOT NULL  ,
  ΜΑΘΗΜΑ_κωδικός INTEGER  NOT NULL    ,
PRIMARY KEY(ΚΑΘΗΓΗΤΗΣ_κωδικός, ΜΑΘΗΜΑ_κωδικός)    ,
  FOREIGN KEY(ΚΑΘΗΓΗΤΗΣ_κωδικός)
    REFERENCES ΚΑΘΗΓΗΤΗΣ(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ΜΑΘΗΜΑ_κωδικός)
    REFERENCES ΜΑΘΗΜΑ(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ΚΑΘΗΓΗΤΗΣ_ΔΙΔΑΣΚΕΙ_ΜΑΘΗΜΑ_FKIndex1 ON ΚΑΘΗΓΗΤΗΣ_ΔΙΔΑΣΚΕΙ_ΜΑΘΗΜΑ (ΚΑΘΗΓΗΤΗΣ_κωδικός);
CREATE INDEX ΚΑΘΗΓΗΤΗΣ_ΔΙΔΑΣΚΕΙ_ΜΑΘΗΜΑ_FKIndex2 ON ΚΑΘΗΓΗΤΗΣ_ΔΙΔΑΣΚΕΙ_ΜΑΘΗΜΑ (ΜΑΘΗΜΑ_κωδικός);



CREATE TABLE ΜΑΘΗΤΗΣ_ΠΑΡΑΚΟΛΟΥΘΕΙ_ΜΑΘΗΜΑ (
  ΜΑΘΗΤΗΣ_κωδικός INTEGER  NOT NULL  ,
  ΜΑΘΗΜΑ_κωδικός INTEGER  NOT NULL  ,
  βαθμός INTEGER      ,
PRIMARY KEY(ΜΑΘΗΤΗΣ_κωδικός, ΜΑΘΗΜΑ_κωδικός)    ,
  FOREIGN KEY(ΜΑΘΗΤΗΣ_κωδικός)
    REFERENCES ΜΑΘΗΤΗΣ(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ΜΑΘΗΜΑ_κωδικός)
    REFERENCES ΜΑΘΗΜΑ(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ΜΑΘΗΤΗΣ_ΠΑΡΑΚΟΛΟΥΘΕΙ_ΜΑΘΗΜΑ_FKIndex1 ON ΜΑΘΗΤΗΣ_ΠΑΡΑΚΟΛΟΥΘΕΙ_ΜΑΘΗΜΑ (ΜΑΘΗΤΗΣ_κωδικός);
CREATE INDEX ΜΑΘΗΤΗΣ_ΠΑΡΑΚΟΛΟΥΘΕΙ_ΜΑΘΗΜΑ_FKIndex2 ON ΜΑΘΗΤΗΣ_ΠΑΡΑΚΟΛΟΥΘΕΙ_ΜΑΘΗΜΑ (ΜΑΘΗΜΑ_κωδικός);



CREATE TABLE ΚΑΘΗΓΗΤΗΣ_ΠΑΡΑΔΙΔΕΙ_ΜΑΘΗΜΑ_ΣΕ_ΤΜΗΜΑ (
  ΜΑΘΗΜΑ_κωδικός INTEGER  NOT NULL  ,
  ΤΜΗΜΑ_κωδικός INTEGER  NOT NULL  ,
  ΚΑΘΗΓΗΤΗΣ_κωδικός INTEGER  NOT NULL    ,
PRIMARY KEY(ΜΑΘΗΜΑ_κωδικός, ΤΜΗΜΑ_κωδικός, ΚΑΘΗΓΗΤΗΣ_κωδικός)      ,
  FOREIGN KEY(ΜΑΘΗΜΑ_κωδικός)
    REFERENCES ΜΑΘΗΜΑ(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ΤΜΗΜΑ_κωδικός)
    REFERENCES ΤΜΗΜΑ(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ΚΑΘΗΓΗΤΗΣ_κωδικός)
    REFERENCES ΚΑΘΗΓΗΤΗΣ(κωδικός)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);


CREATE INDEX ΚΑΘΗΓΗΤΗΣ_ΠΑΡΑΔΙΔΕΙ_ΜΑΘΗΜΑ_ΣΕ_ΤΜΗΜΑ_FKIndex1 ON ΚΑΘΗΓΗΤΗΣ_ΠΑΡΑΔΙΔΕΙ_ΜΑΘΗΜΑ_ΣΕ_ΤΜΗΜΑ (ΜΑΘΗΜΑ_κωδικός);
CREATE INDEX ΚΑΘΗΓΗΤΗΣ_ΠΑΡΑΔΙΔΕΙ_ΜΑΘΗΜΑ_ΣΕ_ΤΜΗΜΑ_FKIndex2 ON ΚΑΘΗΓΗΤΗΣ_ΠΑΡΑΔΙΔΕΙ_ΜΑΘΗΜΑ_ΣΕ_ΤΜΗΜΑ (ΤΜΗΜΑ_κωδικός);
CREATE INDEX ΚΑΘΗΓΗΤΗΣ_ΠΑΡΑΔΙΔΕΙ_ΜΑΘΗΜΑ_ΣΕ_ΤΜΗΜΑ_FKIndex3 ON ΚΑΘΗΓΗΤΗΣ_ΠΑΡΑΔΙΔΕΙ_ΜΑΘΗΜΑ_ΣΕ_ΤΜΗΜΑ (ΚΑΘΗΓΗΤΗΣ_κωδικός);



