CREATE DATABASE HOTEL_API;

USE HOTEL_API;

CREATE TABLE HOTEL(
   id INT PRIMARY KEY UNIQUE NOT NULL ,
   name VARCHAR(255) UNIQUE NOT NULL,
   rating INT
);

INSERT INTO HOTEL (id, name, rating) VALUES
     (1,'Copacabana Palace',9),
	 (2,'Hilton',6),
	 (3,'IBIS',7),
	 (4,'RoseWood',10),
	 (5,'Renaissance',8);

CREATE TABLE ROOM(
 id INT PRIMARY KEY UNIQUE NOT NULL,
 name VARCHAR(255) NOT NULL,
 guestPerRoom INT NOT NULL,
 rate DOUBLE NOT NULL,
 available BOOLEAN NOT NULL,
 hotel_id INT NOT NULL,
 FOREIGN KEY (hotel_id) REFERENCES HOTEL(id)
);

INSERT INTO ROOM (id, name, guestPerRoom, rate, available, hotel_id) VALUES
     (1,'Suite Master',4, 3000.00, false, 1),
	 (2,'Suite Premium', 2, 1500.00, true, 1),
	 (3,'Suite Family',6, 3500.00, true, 1),
	 (4,'Suite Master',4, 2000.00, false, 2),
	 (5,'Suite Premium', 2, 1000.00, true, 2),
	 (6,'Suite Family',6, 2500.00, true, 2),
     (7,'Suite Master',4, 3000.00, false, 3),
	 (8,'Suite Premium', 2, 1500.00, true, 3),
	 (9,'Suite Family',6, 3500.00, true, 3),
     (10,'Suite Master',4, 3000.00, false, 4),
	 (11,'Suite Premium', 2, 1500.00, true, 4),
	 (12,'Suite Family',6, 3500.00, true, 4),
     (13,'Suite Master',4, 3000.00, false, 5),
	 (14,'Suite Premium', 2, 1500.00, true, 5),
	 (15,'Suite Family',6, 3500.00, true, 5);



CREATE TABLE Hotel_has_Room(
  id_room_hotel INT PRIMARY KEY UNIQUE NOT NULL,
  id_hotel INT NOT NULL,
  id_room INT NOT NULL,
  FOREIGN KEY (id_hotel) REFERENCES HOTEL(id),
  FOREIGN KEY (id_room) REFERENCES ROOM(id)
);

INSERT INTO Hotel_has_Room (id_room_hotel, id_hotel, id_room) VALUES
     (1,1,1),
     (2,1,2),
     (3,1,3),
	 (4,2,4),
     (5,2,5),
     (6,2,6),
     (7,3,7),
     (8,3,8),
     (9,3,9),
     (10,4,10),
     (11,4,11),
     (12,4,12),
     (13,5,13),
     (14,5,14),
     (15,5,15);


CREATE TABLE USER(
id INT PRIMARY KEY UNIQUE NOT NULL,
name VARCHAR(255) NOT NULL,
lastName VARCHAR(255) NOT NULL,
age VARCHAR(10) NOT NULL,
username VARCHAR(255) UNIQUE NOT NULL,
email VARCHAR(255) UNIQUE NOT NULL,
password VARCHAR(255) NOT NULL
);
ALTER TABLE USER ADD COLUMN VOU_DELETAR INT NOT NULL;

ALTER TABLE USER DROP COLUMN VOU_DELETAR;

DELETE FROM USER WHERE id = 4;

UPDATE USER SET password = 'TroqueiASenha' WHERE id = 1;

INSERT INTO USER (id, name, lastName, age, username, email, password) VALUES
     (1,'Gabriela','Ferrari', '06/07/1997', 'gsilv239', 'gsilv239@ford.com', '123456'),
	 (2,'Sofia','Lorelay', '11/02/2022', 'sofichiu', 'sofichiu@gmail.com', '123456'),
	 (3,'Tales','Alvarenga', '11/03/1999', 'talesmendesalvarenga', 'talesmendesalvarenga@gmail.com', '123456');
     
     INSERT INTO USER (id, name, lastName, age, username, email, password) VALUES
     (4,'Gabriela','Ferrari', '06/07/1997', 'gsilv2399', 'gsilv2399@ford.com', '123456');

CREATE TABLE ADDRESS(
id INT PRIMARY KEY UNIQUE NOT NULL,
street VARCHAR(255) NOT NULL,
number INT NOT NULL,
neighborhood VARCHAR(255) NOT NULL,
zipCode VARCHAR(255) NOT NULL,
city VARCHAR(255) NOT NULL,
state VARCHAR(255) NOT NULL,
country VARCHAR(255) NOT NULL,
id_user INT NOT NULL,
FOREIGN KEY (id_user) REFERENCES USER(id)
);

INSERT INTO ADDRESS (id, street, number, neighborhood, zipCode, city, state, country, id_user) VALUES
     (1,'Avenida Sérgio Trevisan', 421, 'Pq Selecta', '09791-480', 'São Bernardo do Campo', 'São Paulo', 'Brasil', 1),
	 (2,'Avenida Sérgio Trevisan', 421 , 'Pq Selecta', '09791-480', 'São Bernardo do Campo', 'São Paulo', 'Brasil', 2),
	 (3,'Rua Inverno', 185, 'Bom Pastor', '09791-480', 'Santo André', 'São Paulo', 'Brasil', 3);
     
CREATE TABLE RESERVATION(
id INT PRIMARY KEY UNIQUE NOT NULL, 
startDay DATETIME NOT NULL,
endDay DATETIME NOT NULL,
numDays LONG NOT NULL,
id_hotel INT NOT NULL,
id_room INT NOT NULL,
id_user INT NOT NULL,
total DOUBLE NOT NULL,
FOREIGN KEY (id_hotel) REFERENCES HOTEL(id),
FOREIGN KEY (id_room) REFERENCES ROOM(id),
FOREIGN KEY (id_user) REFERENCES USER(id)
);

INSERT INTO RESERVATION (id, startDay, endDay, numDays, id_hotel, id_room, id_user, total) VALUES
 (1, '2021-10-01', '2021-10-05', DATEDIFF('2021-10-05', '2021-10-01'), 1, 1, 1, 12000.00);
 INSERT INTO RESERVATION (id, startDay, endDay, numDays, id_hotel, id_room, id_user, total) VALUES
 (2, '2021-11-10', '2021-11-25', DATEDIFF('2021-11-25', '2021-11-10'), 1, 2, 1, 12000.00);
 INSERT INTO RESERVATION (id, startDay, endDay, numDays, id_hotel, id_room, id_user, total) VALUES
 (3, '2021-11-10', '2021-11-25', DATEDIFF('2021-11-25', '2021-11-10'), 2, 4, 2, 12000.00);
  INSERT INTO RESERVATION (id, startDay, endDay, numDays, id_hotel, id_room, id_user, total) VALUES
 (4, '2021-11-10', '2021-11-25', DATEDIFF('2021-11-25', '2021-11-10'), 2, 4, 3, 12000.00);


CREATE TABLE PAYMENT(
id INT PRIMARY KEY UNIQUE NOT NULL, 
debitCard VARCHAR(255),
creditCard VARCHAR(255),
expiredDateCredit DATETIME,
expiredDateDebitt DATETIME
);
ALTER TABLE PAYMENT	
ADD COLUMN user_id INT NOT NULL;
ALTER TABLE PAYMENT	
ADD CONSTRAINT fk_PAYMENT_USER
FOREIGN KEY (user_id)
REFERENCES USER(id); 
ALTER TABLE PAYMENT	
ADD COLUMN installments INT;
UPDATE PAYMENT SET installments = 5 WHERE id = 1;

INSERT INTO PAYMENT (id, debitCard, creditCard, expiredDateCredit, expiredDateDebitt, CVV, user_id) VALUES
(1, null, '123456789-10', null, '2025-01-01', 015, 1),
(2, null, '123456789-12', null, '2025-11-15', 016, 2),
(3, null, '666456789-10', '2025-01-01', null, 015, 1);


SELECT * FROM USER;
SELECT * FROM ADDRESS;
SELECT * FROM PAYMENT;
SELECT * FROM RESERVATION;


SELECT * FROM ROOM r LEFT JOIN HOTEL h ON r.hotel_id = h.id;

SELECT * FROM Hotel_has_Room hr LEFT JOIN HOTEL h ON hr.id_hotel = h.id;

SELECT h.name, h.rating, r.name, r.guestPerRoom, r.rate FROM Hotel_has_Room hr LEFT JOIN HOTEL h ON hr.id_hotel = h.id  LEFT JOIN ROOM r ON hr.id_room = r.id;

SELECT u.name, u.lastName, u.username, u.email, rt.startDay, rt.endDay, h.name, h.rating, r.name, r.guestPerRoom, r.rate, rt.total FROM RESERVATION rt LEFT JOIN HOTEL h ON rt.id_hotel = h.id LEFT JOIN  ROOM r ON rt.id_room = r.id LEFT JOIN USER u ON rt.id_user = u.id;

SELECT id, startDay, endDay, numDays, id_hotel, id_room, id_user, total FROM RESERVATION WHERE id_user = 1 UNION SELECT id, startDay, endDay, numDays, id_hotel, id_room, id_user, total FROM RESERVATION WHERE id_user = 3;

SELECT id_hotel, id_room, id_room_hotel, h.name, h.rating, r.name, r.guestPerRoom, r.rate FROM Hotel_has_Room hr LEFT JOIN HOTEL h ON hr.id_hotel = h.id LEFT JOIN ROOM r ON hr.id_room = r.id WHERE id_room = 1 UNION SELECT id_hotel, id_room, id_room_hotel, h.name, h.rating, r.name, r.guestPerRoom, r.rate FROM Hotel_has_Room hr LEFT JOIN HOTEL h ON hr.id_hotel = h.id LEFT JOIN ROOM r ON hr.id_room = r.id WHERE id_room = 3;

SELECT COUNT(*) as null_debit_Cards FROM PAYMENT WHERE debitCard IS NULL;

SELECT u.name, COUNT(rs.id) AS reservation_count FROM RESERVATION rs INNER JOIN USER u ON rs.id_user = u.id GROUP BY u.id ORDER BY reservation_count DESC LIMIT 3;

