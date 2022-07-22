CREATE DATABASE BLOG
USE BLOG

CREATE TABLE USERS(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR (500) NOT NULL,
Surname NVARCHAR (500),
Email NVARCHAR (500) CONSTRAINT CK_Email CHECK((LEN(Email)>4) AND (LEN(Email)<500)) NOT NULL)

CREATE TABLE POSTS(
Id INT PRIMARY KEY IDENTITY,
LikeCount INT,
CreatedAt DATE  DEFAULT getdate(),
Title nvarchar (500),
Userid INT REFERENCES USERS(Id),
PostText NVARCHAR (500) NOT NULL)

CREATE TABLE USERPOST(
Id INT PRIMARY KEY IDENTITY,
UserId INT REFERENCES USERS(Id),
PostId INT REFERENCES POSTS(Id))


INSERT INTO USERS (Name,Surname,Email)
Values
('Azer','Memmedov','Azermemmed@gmail.com'),
('Samir','Mustafazade','Samirmustafa96@gmail.com'),
('Nadir','Suleymanlı','NadirSuleymanli@gmail.com'),
('Habil','Elesgerov','Elesgerli96@gmail.com'),
('John','Shepard','n7alliance@gmail.com')

INSERT INTO POSTS(POSTTEXT,LIKECOUNT,TITLE,USERID)
VALUES
('Havalar getdikce istilesir',12,'Isti havalar',1),
('En varli aktyorlar',23,'En varli kimidr',2),
('Bla bla bla',45,'Burada sizin reklam ola biler',3),
('hmmmm',221,'Basliq',4),
('evet',98,'hm',5)