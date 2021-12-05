create table customers(
    customers_id integer primary key ,
    first_name varchar(200),
    age        numeric(2,0),
    phone_number varchar(25),
    gender       varchar(5),
    bill   int not null,
    city varchar(255),
    street varchar(255)
);

create table products(
    products_id integer primary key ,
    name   varchar(29),
    price numeric(5,0),
    quantity numeric(6,0),
    manufacturer varchar(255)
);

create table orders(
    orders_id integer primary key ,
    customers_id integer references customers (customers_id),
    number_of_pieces numeric(100,0),
    order_date date,
    order_amount numeric(3,0),
    total_price varchar,
    payment varchar check ( payment in ('credit card','contract'))
);
create table warehouse(
    warehouse_id integer primary key,
    price   integer,
    quantity   integer,
    bill_of_lading  integer,
    remains varchar(255)
);
create table suppliers(
    suppliers_id  integer primary key,
    full_name     varchar(255),
    company_name  varchar(255),
    phone_number varchar(255),
    legal_address varchar(255)
);
create table deliveries(
    delivery_id integer primary key references orders (orders_id),
    name    varchar(255),
    delivery_address  varchar(255),
    delivery_method integer references suppliers (phone_number),
    delivery_date date
);
create table manufacturer(
    manufacture_id integer primary key,
    name      varchar(20),
    quantity  integer,
    price     integer
);
create table category(
    category_id  integer primary key,
    name      varchar(20),
    characteristic  varchar(55)
);

insert into customers(customers_id, first_name, age, phone_number,gender,city,street)
values (1,'Aray','19','87078952391','F','Almaty','Tole by');
insert into customers(customers_id, first_name, age, phone_number,gender,city,street)
values (2,'Tima','21','87074567898','M','Semey','Abay');
insert into customers(customers_id, first_name, age, phone_number,gender,city,street)
values (3,'Bibi','16','87475678934','F','Shymkent','Auezov');
insert into customers(customers_id, first_name, age, phone_number,gender,city,street)
values (4,'Alina','22','87082345678','F','Almaty','Ryskulov');
insert into customers(customers_id, first_name, age, phone_number,gender,city,street)
values (5,'Amina','45','87789002340','F','Karagandy','Pushkin');
insert into customers(customers_id, first_name, age, phone_number,gender,city,street)
values (6,'Miras','34','87478975678','M','Almaty','Nauryzbay');
insert into customers(customers_id, first_name, age, phone_number,gender,city,street)
values (7,'Den','23','87276784532','M','Almaty','Shevchenko');
insert into customers(customers_id, first_name, age, phone_number,gender,city,street)
values (8,'Ayana','78','87778937856','F','Kyzylorda','Seifullina');
insert into customers(customers_id, first_name, age, phone_number,gender,city,street)
values (9,'Yenglik','41','87078942345','F', 'Almaty','Al-Farabi');
insert into customers(customers_id, first_name, age, phone_number,gender,city,street)
values (10,'Sanzhar','63','87789923457','M','Almaty','Bogenbay');



insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (100,1,118,'2020-07-21','12000','10500','credit card');
insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (200,4,55,'2020-06-21','15000','1200','contract');
insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (300,5,111,'2020-07-21','10000','9400','credit card');
insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (400,7,377,'2020-05-12','18000','5678','contract');
insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (500,2,777,'2020-04-28','20000','7890','contract');
insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (600,9,118,'2020-07-20','9000','12500','credit card');
insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (700,10,118,'2020-04-25','9000','4500','contract');
insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (800,1,666,'2020-05-13','12000','3400','credit card');
insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (900,3,444,'2020-06-19','16000','6700','credit card');
insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (1000,6,888,'2020-05-11','11000','7800','credit card');
insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (1100,8,555,'2020-07-22','19000','2300','contract');
insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (1200,7,222,'2020-06-21','13000','1290','contract');
insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (1300,2,377,'2020-04-27','18000','6700','contract');
insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (1400,5,222,'2020-03-20','13000','9000','credit card');
insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (1500,7,444,'2020-03-22','18000','10500''contract');
insert into orders(orders_id, customers_id, number_of_pieces,order_date,order_amount,total_price,payment)
values (1600,7,555,'2020-01-11','25000','13400','contract');


insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (2400, 'aray', '2021-10-20');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (2300, 'madina', '2021-09-24');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (2200, 'zhibek', '2021-08-19');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (2100, 'sanzhar', '2021-03-29');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (2000, 'miras', '2021-06-30');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (1900, 'aya', '2021-05-20');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (1800, 'sezim', '2021-03-09');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (1700, 'kasym', '2020-09-25');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (1600, 'tima', '2020-01-12');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (1500, 'marzhan', '2020-03-22');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (1400, 'zhan', '2020-03-29');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (1300, 'arman', '2020-04-30');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (1200, 'saya', '2020-06-22');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (1100, 'loya', '2020-07-26');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (1000, 'kausar', '2020-05-13');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (900, 'kamila', '2020-06-22');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (800, 'daniyar', '2020-05-13');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (700, 'nazira', '2020-04-30');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (600, 'elnara', '2020-07-22');
insert into deliveries(delivery_id,name,delivery_address,delivery_method,delivery_date)
values (500, 'maksat', '2020-04-29');


--Assume truck 1721 is destroyed in a crash. Find all customers who had a package on that truck at the time of the crash.
SELECT first_name , MAX(bill) AS HighestPurchase
FROM customers
GROUP BY first_name
ORDER BY MAX(bill) DESC

