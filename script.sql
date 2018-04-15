SET foreign_key_checks = 0;
DROP TABLE IF EXISTS APP_USER, USER_PROFILE, APP_BANK, APP_USER_BANK, APP_USER_USER_PROFILE;
SET foreign_key_checks = 1;

/*All User's gets stored in APP_USER table*/
create table APP_USER (
   id BIGINT NOT NULL AUTO_INCREMENT,
   sso_id VARCHAR(30) NOT NULL,
   password VARCHAR(100) NOT NULL,
   first_name VARCHAR(30) NOT NULL,
   last_name  VARCHAR(30) NOT NULL,
   email VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (sso_id)
);

/*APP_BANK contains all banks basic infomations*/
create table APP_BANK (
  id BIGINT NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  max INT NOT NULL,
  min INT NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (name)
);

/* USER_PROFILE table contains all possible roles */
create table USER_PROFILE(
   id BIGINT NOT NULL AUTO_INCREMENT,
   type VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (type)
);

/* JOIN TABLE for MANY-TO-MANY relationship*/
CREATE TABLE APP_USER_USER_PROFILE (
    user_id BIGINT NOT NULL,
    user_profile_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, user_profile_id),
    CONSTRAINT FK_APP_USER FOREIGN KEY (user_id) REFERENCES APP_USER (id),
    CONSTRAINT FK_USER_PROFILE FOREIGN KEY (user_profile_id) REFERENCES USER_PROFILE (id)
);

/*user - bank join table*/
CREATE TABLE APP_USER_BANK (
  bank_id BIGINT NOT NULL,
  user_id BIGINT NOT NULL,
  PRIMARY KEY (bank_id, user_id),
  CONSTRAINT FK_APP_USER_B FOREIGN KEY (user_id) REFERENCES APP_USER (id),
  CONSTRAINT FK_APP_BANK FOREIGN KEY (bank_id) REFERENCES APP_BANK (id)
);

/* Populate USER_PROFILE Table */
INSERT INTO USER_PROFILE(type)
VALUES ('USER');

INSERT INTO USER_PROFILE(type)
VALUES ('ADMIN');


/* Populate one Admin User which will further create other users for the application using GUI */
INSERT INTO APP_USER(APP_USER.sso_id, password, first_name, last_name, email)
VALUES ('sam','$2a$10$4eqIF5s/ewJwHK1p8lqlFOEm2QIA0S8g6./Lok.pQxqcxaBZYChRm', 'Sam','Smith','samy@xyz.com');

/*Populate APP_BANK*/
INSERT INTO APP_BANK(name, max, min)
VALUE ('SOGEP', 5000, 20);

/* Populate JOIN Table */
INSERT INTO APP_USER_USER_PROFILE (user_id, user_profile_id)
  SELECT user.id, profile.id FROM APP_USER user, USER_PROFILE profile
  where user.sso_id='sam' and profile.type='ADMIN';