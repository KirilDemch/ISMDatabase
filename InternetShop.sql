create database InternetShop
use InternetShop
create table Customer
(
	customer_id int identity(1,1) primary key not null,
	first_name nvarchar(25),
	last_name nvarchar(25)
)
create table Orders
(
	order_id int identity(1,1) primary key not null,
	customer_id int not null foreign key(customer_id) references dbo.Customer(customer_id)
	on delete cascade on update no action,
	date date,
	time time
)
create table OrderProduct
(
	order_id int not null foreign key(order_id) references dbo.Orders(order_id)
	on delete cascade on update no action,
	product_id int identity(1,1) primary key not null
)
create table Product 
(
	product_id int not null foreign key(product_id) references dbo.OrderProduct(product_id)
	on delete cascade on update no action,
	name nvarchar(25),
	description nvarchar(50),
	price_ex_vat decimal(5,2)
)
insert into Customer
	(first_name, last_name)
	values 
		('first_name1', 'last_name1'),
		('first_name2', 'last_name2'),
		('first_name3', 'last_name3'),
		('first_name4', 'last_name4'),
		('first_name5', 'last_name5')


insert into Orders
	(customer_id,date, time)
	values 
		(1,GETDATE(), convert(varchar(10), GETDATE(), 108)),
		(2, GETDATE(), convert(varchar(10), GETDATE(), 108)),
		(3,GETDATE(), convert(varchar(10), GETDATE(), 108)),
		(4,GETDATE(), convert(varchar(10), GETDATE(), 108)),
		(5,GETDATE(), convert(varchar(10), GETDATE(), 108))

		select * from Orders
insert into OrderProduct
	(order_id)
	values 
		(1),(2),(3),(4),(5)

insert into Product
	(product_id, name, description, price_ex_vat)
	values 
		(1, 'name1', 'description1', 100.20),
		(1, 'name1', 'description1', 110.20),
		(1, 'name1', 'description1', 120.20),
		(1, 'name1', 'description1', 130.20),
		(1, 'name1', 'description1', 140.20)

select * from Customer
select * from Orders
select * from OrderProduct
select * from Product