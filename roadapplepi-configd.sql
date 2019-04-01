DROP DATABASE roadapplepi;
CREATE DATABASE roadapplepi;
GRANT ALL PRIVILEGES ON roadapplepi.* TO 'roadapplepi'@'%' IDENTIFIED BY 'roadapplepi';
USE roadapplepi;
CREATE TABLE env (id int NOT NULL auto_increment, name text NOT NULL, value text NOT NULL, PRIMARY KEY(id));
CREATE TABLE obdCodes (id int NOT NULL auto_increment, timestamp bigint NOT NULL, codes varchar(452) NOT NULL, PRIMARY KEY(id));
CREATE TABLE obdLog(id bigint unsigned NOT NULL auto_increment, timestamp bigint not null, mode int not null, pid int not null, value varchar(100) not null, PRIMARY KEY(id));

INSERT INTO env (name, value) VALUES ("rapVersion", ""), ("installDate", "man apr  1 18:05:04 CEST 2019");
