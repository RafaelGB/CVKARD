/*-------- USERS --------*/

/*password aa*/
INSERT INTO User(id,enabled,name,last_name,nick,card,email,password,roles) VALUES (1, 1,'Maria','Garcia','martaCV','Esto es una carta de prueba de Marta','marta@ucm.es', '$2a$04$9iG7Dpps4.to/kkJCkw6rOHLsIu1e8L4Z7rLcrzWK7DGoFqD8beSe', 'USER,EMPLOYEE');
/*password indraPass*/
INSERT INTO User(id,enabled,name,card,email,password,roles) VALUES (2, 1,'INDRA','Somos una compañia seria y decidida','rrpp@indra.es', '$2a$04$S3pfGjgOWgJAt/dCPtkllOLPmnbszeF5JHrMWQajy.hylVsSltJN.', 'USER,BUSSINES');
/*password facebook*/
INSERT INTO User(id,enabled,name,card,email,password,roles) VALUES (3, 1,'Facebook','somos una compañia seria y decidida','fb@fb.com', '$2a$10$oEomdmFNCh3YtRsYiGwLnexXZSQW/.a0rgShNhml0w9k9/dfZvnG', 'USER,BUSSINES');
/*password miguel*/
INSERT INTO User(id,enabled,name,last_name,nick,card,email,password,roles) VALUES (4, 1,'Miguel','Gomez','miguelCV','Esto es una carta de prueba de Miguel','miguel@ucm.es', '$2a$10$5ZW42mtBGZPCxVh9jSvOKeCuiUl0D0D0Ckqf94Q3ay6M5t6fvgYBq', 'USER,EMPLOYEE');



/*------- OFFERS -------*/

INSERT INTO Offer(id,date,description,title,offerer_id) VALUES (1,'2017-06-09','Esta es la oferta de prueba 1','Oferta 1',3);
INSERT INTO Offer(id,date,description,title,offerer_id) VALUES (2,'2017-07-09','Esta es la oferta de prueba 2','Oferta 2',3);
INSERT INTO Offer(id,date,description,title,offerer_id) VALUES (3,'2017-06-18','Esta es la oferta de prueba 3','Oferta 3',2);
INSERT INTO Offer(id,date,description,title,offerer_id) VALUES (4,'2017-06-24','Esta es la oferta de prueba 4','Oferta 4',2);
INSERT INTO Offer(id,date,description,title,offerer_id) VALUES (5,'2017-01-02','Esta es la oferta de prueba 5','Oferta 5',2);
INSERT INTO Offer(id,date,description,title,offerer_id) VALUES (6,'2017-05-31','Esta es la oferta de prueba 6','Oferta 6',3);
INSERT INTO Offer(id,date,description,title,offerer_id) VALUES (7,'2017-03-23','Esta es la oferta de prueba 7','Oferta 7',3);
INSERT INTO Offer(id,date,description,title,offerer_id) VALUES (8,'2017-06-01','Esta es la oferta de prueba 8','Oferta 8',2);
INSERT INTO Offer(id,date,description,title,offerer_id) VALUES (9,'2017-06-02','Esta es la oferta de prueba 9','Oferta 9',3);


/*------- DIRECTION ------*/
INSERT INTO Direction(id,country,municipality,number,street) VALUES (2,'España','Madrid','93','Calle la duodécima');
INSERT INTO Direction(id,country,municipality,number,street) VALUES (3,'España','Sevilla','114','Calle de Google');


/*------- PROYECTS ------*/
INSERT INTO Proyect(id,date,description,title) VALUES (1,'2017-06-09','Ejemplo de proyecto 1','Proyecyo 1');
INSERT INTO Proyect(id,date,description,title) VALUES (4,'2017-06-24','Ejemplo de proyecto 2','Proyecyo 2');


/*----- PROYECTS TAGS -----*/
INSERT INTO Proyect_Tags(proyects_id,tags_id) VALUES(1,1);
INSERT INTO Proyect_Tags(proyects_id,tags_id) VALUES(2,2);


/*-------- TAGS ---------*/

INSERT INTO Tag(id,name) VALUES(1,'Desarrollo web');
INSERT INTO Tag(id,name) VALUES(2,'Programacion java');




/*------- LANGUAGES --------*/

INSERT INTO Language(id,name) VALUES(1,'Java');
INSERT INTO Language(id,name) VALUES(2,'HTML');
INSERT INTO Language(id,name) VALUES(3,'C++');
