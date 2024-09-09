create database LIB_MS_db

Drop database LIB_MS_db

USE Master;
GO
DROP DATABASE LIB_MS_db;
GO

-- Create GENDER table
CREATE TABLE GENDER (
    G_Code char(1) PRIMARY KEY,
    G_name varchar(6)
);

-- Create AUTHOR table
CREATE TABLE AUTHOR (
    A_id varchar(10) PRIMARY KEY,
    A_name varchar(30)
);

alter table PUBLISHER 
alter column p_mail varchar(45)

-- Create PUBLISHER table
CREATE TABLE PUBLISHER (
    p_id varchar(10) PRIMARY KEY,
    p_name varchar(40),
    p_mail varchar(40) CHECK (p_mail LIKE '%.@%')
);



-- Create CITY table
CREATE TABLE CITY (
    City_id varchar(5) PRIMARY KEY,
    C_name varchar(15),
);

-- Create BOOKS table
CREATE TABLE BOOKS (
    ISBN int PRIMARY KEY,
    B_name varchar(20),
    Author varchar(10) REFERENCES AUTHOR(A_id),
    Publisher varchar(10) REFERENCES PUBLISHER(p_id),
    P_date date,
    Languages varchar(10),
    Stock int
);

-- Create MEMBER table
CREATE TABLE MEMBERs (
    Mem_id int PRIMARY KEY,
    Mem_name varchar(20),
    Gender char(1) REFERENCES GENDER(G_Code),
    Contact_no char(10),
    Addresses varchar(20),
    City varchar(5) REFERENCES CITY(City_id)
);

-- Create STATUS table
CREATE TABLE STATUSe (
    S_code varchar(3) PRIMARY KEY,
    S_name varchar(15)
);

-- Create TRANSACTION table
CREATE TABLE TRANSACTIONS (
    Trans_id int PRIMARY KEY,
    Mem_id int REFERENCES MEMBERS(Mem_id),
    ISBN int REFERENCES BOOKS(ISBN),
    Issue_date date,
    Return_date date,
    Statuses varchar(3) REFERENCES STATUSe(S_code)
);


--INSERTING DATA

-- Insert data into GENDER table
INSERT INTO GENDER (G_Code, G_name) VALUES
    ('M', 'Male'),
    ('F', 'Female'),
	('O','Others');

-- Insert data into AUTHOR table
INSERT INTO AUTHOR (A_id, A_name) VALUES
    ('A001', 'James Clear'),
    ('A002', 'Robert Kiyosuki'),
	('A003', 'Alex Michaelides'),
	('A004', 'Delia Owens'),
	('A005', 'Michelle Obama'),
	('A006', 'Tara Westover');

-- Insert data into PUBLISHER table
INSERT INTO PUBLISHER (p_id, p_name, p_mail) VALUES
    ('P001', 'Random House Books', 'RandomBooks.@gmail.com'),
    ('P002', 'Plata Publishing', 'plataBooks.@gmail.com'),
	('P003', 'Celadon Books', 'RandomBooks.@gmail.com'),
	('P004', 'G.P. Putnam''s Sons', 'RandomBooks.@gmail.com');

-- Insert data into CITY table
INSERT INTO CITY (City_id, C_name) VALUES
    ('TPR', 'TIRUPUR'),
    ('C002', 'City2');

-- Insert data into BOOKS table
INSERT INTO BOOKS (ISBN, B_name, Author, Publisher, P_date, Languages, Stock) VALUES
    (1001, 'ATOMIC HABITS', 'A001', 'P001', '2019-01-01', 'English', 1),
    (1002, 'RICH DAD,POOR DAD', 'A002', 'P002', '2000-02-01', 'English', 5),
	(1003, 'The Great Novel', 'A001', 'P001', '2023-03-01', 'English', 2),
    (1004, 'Adventure Awaits', 'A002', 'P002', '2023-04-01', 'French', 5),
    (1005, 'Mystery Unveiled', 'A001', 'P001', '2023-05-01', 'Spanish',3),
    (1006, 'Fantasy Realm', 'A002', 'P002', '2023-06-01', 'German', 5),
    (1007, 'Sci-Fi Odyssey', 'A001', 'P001', '2023-07-01', 'English', 1);

-- Insert data into MEMBER table
INSERT INTO MEMBERS(Mem_id, Mem_name, Gender, Contact_no, Addresses, City) VALUES
    (1, 'Member1', 'M', '1234567890', 'Address1', 'C001'),
    (2, 'Member2', 'F', '9876543210', 'Address2', 'C002');

-- Insert data into STATUS table
INSERT INTO STATUSE (S_code, S_name) VALUES
    ('BOR', 'Borrowed'),
    ('RET', 'Returned');

-- Insert data into TRANSACTION table
INSERT INTO TRANSACTIONS (Trans_id, Mem_id, ISBN, Issue_date, Return_date, Statuses) VALUES
    (101, 1, 1001, '2023-01-02', '2023-01-15', 'BOR'),
    (102, 2, 1002, '2023-02-01', '2023-02-15', 'RET');


SELECT * FROM GENDER;
SELECT * FROM AUTHOR;
SELECT * FROM PUBLISHER;
SELECT * FROM CITY;
SELECT * FROM BOOKS;
SELECT * FROM MEMBERS;

Truncate table GENDER

-- Insert data into GENDER table
INSERT INTO GENDER (G_Code, G_name) VALUES
('M', 'Male'),
('F', 'Female'),
('O', 'Other'),
('N', 'Non-Binary');

-- Insert data into AUTHOR table
INSERT INTO AUTHOR (A_id, A_name) VALUES
('A001', 'John Smith'),
('A002', 'Jane Doe'),
('A003', 'Mark Johnson'),
('A004', 'Emily White');

-- Insert data into PUBLISHER table
INSERT INTO PUBLISHER (p_id, p_name, p_mail) VALUES
('P001', 'XYZ Publications', 'xyz@publisher.com'),
('P002', 'ABC Books', 'abc@books.com'),
('P003', 'LMN Publishing', 'lmn@publishing.com'),
('P004', 'DEF Books', 'def@books.com');

-- Insert data into CITY table
INSERT INTO CITY (City_id, C_name) VALUES
('C001', 'New York City'),
('C002', 'Los Angeles'),
('C003', 'Houston'),
('C004', 'Miami');

-- Insert data into BOOKS table
INSERT INTO BOOKS (ISBN, B_name, Author, Publisher, P_date, Languages, Stock) VALUES
(1234567890, 'The Great Novel', 'A001', 'P001', '2022-01-01', 'English', 50),
(2345678901, 'Adventure Awaits', 'A002', 'P002', '2022-02-15', 'Spanish', 30),
(3456789012, 'Mystery Unveiled', 'A003', 'P003', '2022-03-20', 'French', 40),
(4567890123, 'Fantasy World', 'A004', 'P004', '2022-04-05', 'German', 25);

-- Insert data into MEMBERs table
INSERT INTO MEMBERs (Mem_id, Mem_name, Gender, Contact_no, Addresses, City) VALUES
(1, 'Alice Johnson', 'F', '1234567890', '123 Main St', 'C001'),
(2, 'Bob Anderson', 'M', '9876543210', '456 Oak St', 'C002'),
(3, 'Charlie Brown', 'M', '5551234567', '789 Pine St', 'C003'),
(4, 'Olivia Green', 'F', '5559876543', '101 Palm St', 'C004');

-- Insert data into STATUSe table
INSERT INTO STATUSe (S_code, S_name) VALUES
('S01', 'Issued'),
('S02', 'Returned'),
('S03', 'Lost'),
('S04', 'Damaged');

-- Insert data into TRANSACTIONS table (Minimum 10 records)
INSERT INTO TRANSACTIONS (Trans_id, Mem_id, ISBN, Issue_date, Return_date, Statuses) VALUES
(1, 1, 1234567890, '03-01-2022', '2022-03-15', 'S02'),
(2, 2, 2345678901, '04-10-2022', '2022-04-25', 'S02'),
(3, 1, 1234567890, '05-05-2022', NULL, 'S01'),
(4, 2, 2345678901, '06-20-2022', NULL, 'S01'),
(5, 3, 3456789012, '05-10-2022', NULL, 'S01'),
(6, 4, 4567890123, '06-15-2022', '2022-07-01', 'S02'),
(7, 3, 3456789012, '08-05-2022', NULL, 'S01'),
(8, 4, 4567890123, '09-20-2022', NULL, 'S01');
-- Add more records as needed.
