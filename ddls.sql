CREATE  TABLE users (
  userid VARCHAR(5) NOT NULL,
  username VARCHAR(45) NOT NULL ,
  password VARCHAR(60) NOT NULL ,
  enabled int NOT NULL DEFAULT 1 ,
  PRIMARY KEY (userid));
   
CREATE TABLE user_roles (
  user_role_id bigserial NOT NULL ,
  userid varchar(5) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  CONSTRAINT uni_username_role UNIQUE  (role,userid),
  CONSTRAINT fk_username_idx FOREIGN KEY (userid)
      REFERENCES users (userid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
  );
 
INSERT INTO users(userid,username,password)
VALUES ('001','priya','$2a$04$BN7j102mdVLvLkbLPVfkG..Ouzj5.Ee/Jc.CbgmlQX5bFEv.WraZy');
INSERT INTO users(userid,username,password)
VALUES ('002','naveen','$2a$04$BN7j102mdVLvLkbLPVfkG..Ouzj5.Ee/Jc.CbgmlQX5bFEv.WraZy');
 
INSERT INTO user_roles (userid, role)
VALUES ('002', 'ROLE_USER');
INSERT INTO user_roles (userid, role)
VALUES ('001', 'ROLE_ADMIN');
INSERT INTO user_roles (userid, role)
VALUES ('001', 'ROLE_USER');

commit;