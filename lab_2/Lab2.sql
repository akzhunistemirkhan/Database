1.DDL is a declarative method, and DML is an imperative method. 
Important DDL commands are: 1) CREATE, 2) DROP, 3) ALTER
Important DML commands are: 1) INSERT, 2) DELETE, 3) UPDATE, 4) 
SELECT.
The DDL defines a table column. DML adds or updates a row of tables. 
However, unlike DDL, DML can be used to insert, delete, restore and modify 
data, and not just to specify them. DDL and DML are two types of database 
languages. They are called sublanguages, because they have fewer features 
than full-fledged programming languages. Both belong to the family of syntax 
elements that are mainly used in relation to databases. Both use operators and 
commands of the Structured Query Language (SQL), which are used to 
extract and process data in a relational database.

2.
create table customers
(
 id integer primary key,
 full_name varchar(50) not null,
 timestamp timestamp not null,
 delivery_address text not null
);
create table products
(
 id varchar primary key,
 name varchar unique not null,
 description text,
 price double precision not null check (price > 0)
);
create table orders
(
 code integer primary key,
 customer_id integer,
 total_sum double precision not null check (total_sum > 0),
 is_paid boolean not null,
 foreign key (customer_id) references customers
);
create table order_items
(
 order_code integer unique,
 product_id varchar unique,
 quantity integer not null check (quantity > 0),
 primary key (order_code, product_id),
 foreign key (order_code) references orders,
 foreign key (product_id) references products
);


3.
create table students
(
 full_name varchar primary key,
 age integer not null check(age > 0),
 birth_date date not null,
 gender varchar not null,
 average_grade double precision not null,
 information text not null,
 need_dorm boolean not null,
 additional_info text
);
insert into students values ('Aray Temirkhan', 18, '29-09-2003', 
'female', 4.00, 'she loves to walk in the rain', false);
create table instructor
(
 full_name varchar primary key,
 speaking_languages varchar not null,
 work_experience integer not null,
 possibility_of_having_remote_lessons boolean not null
);
insert into instructor values ('Amira', 'rus, eng', 16, false);
insert into instructor values ('Miras', 'rus, eng, kz', 21, 
true);
create table lessons
(
 lesson_name varchar,
 full_name varchar,
 room_number integer not null check (room_number > 0 
and room_number < 315),
 primary key (lesson_name, full_name),
);
insert into lessons values ('calculus', 'Marat N', 214);
insert into lessons values ('databases', 'Aibek K', 145);


4. 
insert into customers(full_name, timestamp, delivery_address) 
values('Aray Temirkhan','2021-09-23 12:22:35','mkrn.Kairat 
177');
update customers set delivery_address = 'mkrn.Kairat 217' where 
id = 2;
delete from customers where id = 2