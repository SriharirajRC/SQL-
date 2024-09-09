create database Dep_storeDB

use Dept_storeDB;

create table Bill_details(Bill_id int  primary key,
	bill_date	date,
	Cus_id	int,
	B_time time,
	Discount int,
	Tax	float,
	foreign key(Cus_id) References Cust_details(cus_id),
);


create table categ_list(categ_id	int primary key,
	categ_name	varchar(20),
	section char(1));

create table Cust_details(Cus_id	int Primary Key,
	Cus_name Varchar(20),
	Ph_number	char(10));

create table Prod_details(prod_id	int primary key,
	prod_name	varchar(20),
	category int,
	U_O_M	varchar(20),
	price	int,
	Stock int
	foreign key(category) references Categ_list(categ_id));

create table Bill_items(item_id	int primary key,
	Bill_id int,
	Prod_id	int,
	quant 	int not null,
	foreign key (Bill_id) references Bill_details(Bill_id),
	foreign key (Prod_id) references Prod_details(prod_id));


Select * from Bill_details;
Select * from Bill_items;
Select * from categ_list;
--Select * from Cust_details;
Select * from Prod_details;



insert into Bill_details values  
							(1,'2023-01-04',	1, 2	,2.5, 40),
							(2,'2023-02-05',	3, 1	,3.5, 100),
							(3,'2023-03-05',	4, 1	,4.5, 30),
							(4,'2023-04-05',	1, 4	,5.5, 20);

insert into categ_list values 
							(1,'Beverages',1),
							(2,'Chocolates',2),
							(3,'Hair care',2),
							(4,'Rice',2),
							(5,'Vegetables',1);

insert into Cust_details values 
							(1,	'Babar',	'7559051236'),
							(2,	'Roshan',	'8973998920'),
							(3,	'Binshad',	'9976303033'),
							(4,	'Roshan Bee',	'9876123450'),
							(5,	'Batcha',	'7448791539'),
							(6,	'Ameer',	'9887656878');

insert into Prod_details values 
							(1,	'Coke'	,1,	'500 ml'	,100,4),
							(2,	'Dairy Milk'	,2,	'50 gm'	,20,5),
							(3,	'Dove Shampoo'	,3,	'200 ml'	,150,1),
							(4,	'Tomato'	,5,	'1 kg'	,30,10),
							(5,	'Clinic+ Shampoo'	,3,	'5 ml'	,2,3),
							(6,	'Pepsi'	,1,	'500 ml'	,120,45),
							(7,	'DrumStick'	,5,	'1 kg'	,40,90),
							(8,	'Miranda'	,1,	' 750 ml'	,160,10),
							(9,	'Baasmathi'	,4,	'25 kg'	,2000,8),
							(10, '5 star'	,2,	'50 gm'	,5,100);

insert into Bill_items values
						(1,1,1,5,500),
						(2,1,6,5,600),
						(3,1,8,1,160),
						(4,1,10,5,25),
						(5,1,2,2,40);

Insert into Bill_items values (6,2,2,2,40),
							  (7,2,8,1,160),
							  (8,3,9,1,20000),
							  (9,3,1,4,400),
							  (10,4,6,1,120),
							  (11,4,8,1,160),
							  (12,4,8,1,160);


use Dept_storeDB;
Select Bill_id,sum(quant) as Total from Bill_items  group by Bill_id;


Select Bi.Bill_id,sum(bi.quant*pd.price) as Total from Bill_items bi left join Prod_details pd on bi.Prod_id=pd.prod_id
group by bi.Bill_id;