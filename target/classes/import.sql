/*password aa*/
INSERT INTO User(id,enabled,name,last_name,nick,card,email,password,roles) VALUES (1, 1,'Marta','Garcia','martaCV','esto es una carta de prueba','marta@ucm.es', '$2a$04$9iG7Dpps4.to/kkJCkw6rOHLsIu1e8L4Z7rLcrzWK7DGoFqD8beSe', 'USER,EMPLOYEE');
/*password indraPass*/
INSERT INTO User(id,enabled,name,card,email,password,roles) VALUES (2, 1,'INDRA coorporation','somos una compañia seria y decidida','rrpp@indra.es', '$2a$04$S3pfGjgOWgJAt/dCPtkllOLPmnbszeF5JHrMWQajy.hylVsSltJN.', 'USER,BUSSINES');


INSERT INTO Tag(id,name) VALUES(1,'Desarrollo web');
INSERT INTO Tag(id,name) VALUES(2,'Programacion java');

INSERT INTO Language(id,name) VALUES(1,'Java');
INSERT INTO Language(id,name) VALUES(2,'HTML');
INSERT INTO Language(id,name) VALUES(3,'C++');
