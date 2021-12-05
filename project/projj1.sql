create table region
(
    id   int PRIMARY KEY,
    name varchar(100) UNIQUE
);

create table city
(
    id        int PRIMARY KEY,
    name      varchar(100) NOT NULL,
    region_id int REFERENCES region (id)
);

create table street
(
    id      int primary key,
    name    varchar(100) not null,
    city_id int references city (id)
);

create table client
(
    id               int primary key,
    name             varchar(50) NOT NULL,
    street_id        int REFERENCES street (id),
    building_number  varchar(10),
    apartment_number int
);

create table market
(
    id              int primary key,
    name            varchar(100),
    street_id       int REFERENCES street (id),
    building_number varchar(10)
);

create table warehouse
(
    id              int primary key,
    name            varchar(10),
    street_id       int REFERENCES street (id),
    building_number varchar(10),
    market_id       int references market (id)
);

create table manufacturer
(
    id   int primary key,
    name varchar(100)
);

create table category
(
    id   int primary key,
    name varchar(100)
);

create table product
(
    id              int primary key,
    name            varchar(200),
    manufacturer_id int REFERENCES manufacturer (id),
    category_id     int references category (id)
);

create table market_product
(
    market_id  int references market (id),
    product_id int references product (id),
    price      double precision,
    PRIMARY KEY (market_id, product_id)
);

create table tracking
(
    id          int primary key,
    description varchar(200),
    state       varchar(10)
);

create table online_client
(
    online_client_id int REFERENCES client (id),
    account_id       int,
    PRIMARY KEY (online_client_id)
);

create table orders
(
    id           int primary key,
    order_date   date,
    total_price  double precision,
    warehouse_id int references warehouse (id),
    client_id    int references client (id),
    arrival_date date,
    tracking_id  int references tracking (id)
);

create table card
(
    id          int primary key,
    type        varchar(10),
    bank        varchar(10),
    card_number int,
    client_id   int references online_client (online_client_id)
);
CREATE table shipper
(
    id   int primary key,
    name varchar(10)
);

CREATE TABLE online_order
(
    online_order_id int primary key REFERENCES orders (id),
    shipper_id      int references shipper (id)
);

CREATE TABLE order_product
(
    order_id   INT references orders (id),
    product_id INt references product (id),
    market_id  int references market (id),
    quantity   int
);

insert into region(id, name)
values (1, 'Almatinskaya');
insert into region(id, name)
values (2, 'Akmolinskaya');
insert into region(id, name)
values (3, 'Zhambylskaya');
insert into region(id, name)
values (4, 'Pavlodarskaya');
insert into region(id, name)
values (5, 'Taldykorgan');
insert into region(id, name)
values (6, 'Karagandinskaya');
insert into region(id, name)
values (7, 'Almatinskaya');
insert into region(id, name)
values (8, 'Akmolinskaya');
insert into region(id, name)
values (9, 'Mangistauskaya');
insert into region(id, name)
values (10, 'Almatinskaya');

insert into city(id, name, region_id)
values (10,'Astana', 1);
insert into city(id, name, region_id)
values (20,'Almaty',2);
insert into city(id, name, region_id)
values (30, 'Oral',3);
insert into city(id, name, region_id)
values (40,'Karaganda',4);
insert into city(id, name, region_id)
values (50,'Almaty',5);
insert into city(id, name, region_id)
values (60,'Astana',6);
insert into city(id, name, region_id)
values (70,'Astana',7);
insert into city(id, name, region_id)
values (80,'Karaganda',8);
insert into city(id, name, region_id)
values (90,'Almaty',9);
insert into city(id, name, region_id)
values (100,'Oral',10);

insert into street(id, name, city_id)
values (11,'Tole bi',10);
insert into street(id, name, city_id)
values (22,'Aisha bibi',20);
insert into street(id, name, city_id)
values (33,'Kasteeva',30);
insert into street(id, name, city_id)
values (44,'Furmanova',40);
insert into street(id, name, city_id)
values (55,'Begalin',50);
insert into street(id, name, city_id)
values (66,'Altyn',60);
insert into street(id, name, city_id)
values (77,'Shevchenko',70);
insert into street(id, name, city_id)
values (88,'Kabanbay',80);
insert into street(id, name, city_id)
values (99,'Pushkin',90);
insert into street(id, name, city_id)
values (101,'Abay',100);

insert into client(id, name, street_id, building_number, apartment_number)
values (111,'Aria',11,'201',301);
insert into client(id, name, street_id, building_number, apartment_number)
values (121,'Mira',22,'202',302);
insert into client(id, name, street_id, building_number, apartment_number)
values (131,'Aya',33,'203',303);
insert into client(id, name, street_id, building_number, apartment_number)
values (141,'Nur',44,'204',304);
insert into client(id, name, street_id, building_number, apartment_number)
values (151,'Say',55,'205',305);
insert into client(id, name, street_id, building_number, apartment_number)
values (161,'Kelvin',66,'206',306);
insert into client(id, name, street_id, building_number, apartment_number)
values (171,'Maks',77,'207',307);
insert into client(id, name, street_id, building_number, apartment_number)
values (181,'Nasty',88,'208',308);
insert into client(id, name, street_id, building_number, apartment_number)
values (191,'Dayana',99,'209',309);
insert into client(id, name, street_id, building_number, apartment_number)
values (201,'Elvina',101,'210',310);

insert into market(id, name, street_id, building_number)
values (1001,'Sulpak',11,'201');
insert into market(id, name, street_id, building_number)
values (1002,'Technodom',22,'202');
insert into market(id, name, street_id, building_number)
values (1003,'Sulpak',33,'203');
insert into market(id, name, street_id, building_number)
values (1004,'Electronyka',44,'204');
insert into market(id, name, street_id, building_number)
values (1005,'Sulpak',55,'205');
insert into market(id, name, street_id, building_number)
values (1006,'Sulpak',66,'206');
insert into market(id, name, street_id, building_number)
values (1007,'Technodom',77,'207');
insert into market(id, name, street_id, building_number)
values (1008,'Sulpak',88,'208');
insert into market(id, name, street_id, building_number)
values (1009,'Beliy Veter',99,'209');
insert into market(id,name, street_id, building_number)
values (1010,'Sulpak',101,'210');

insert into warehouse(id, name, street_id, building_number, market_id)
values (911,'A1',11,'201',1001);
insert into warehouse(id, name, street_id, building_number, market_id)
values (912,'A2',22,'202',1002);
insert into warehouse(id, name, street_id, building_number, market_id)
values (913,'A3',33,'203',1003);
insert into warehouse(id, name, street_id, building_number, market_id)
values (914,'N5',44,'204',1004);
insert into warehouse(id, name, street_id, building_number, market_id)
values (915,'S4',55,'205',1005);
insert into warehouse(id, name, street_id, building_number, market_id)
values (916,'K8',66,'206',1006);
insert into warehouse(id, name, street_id, building_number, market_id)
values (917,'M9',77,'207',1007);
insert into warehouse(id, name, street_id, building_number, market_id)
values (918,'N6',88,'208',1008);
insert into warehouse(id, name, street_id, building_number, market_id)
values (919,'D7',99,'209',1009);
insert into warehouse(id, name, street_id, building_number, market_id)
values (920,'E1',101,'210',1010);

insert into manufacturer(id, name)
values (811,'Apple');
insert into manufacturer(id, name)
values (812,'Samsung');
insert into manufacturer(id, name)
values (813,'Samsung');
insert into manufacturer(id, name)
values (814,'Xiaomi');
insert into manufacturer(id, name)
values (815,'OnePlus');
insert into manufacturer(id, name)
values (816,'Apple');
insert into manufacturer(id, name)
values (817,'Apple');
insert into manufacturer(id, name)
values (818,'Samsung');
insert into manufacturer(id, name)
values (819,'Xiaomi');
insert into manufacturer(id, name)
values (820,'Apple');

insert into category(id, name)
values (711,'Aria');
insert into category(id, name)
values (712,'Mira');
insert into category(id, name)
values (713,'Aya');
insert into category(id, name)
values (714,'Nur');
insert into category(id, name)
values (715,'Say');
insert into category(id, name)
values (716,'Kelvin');
insert into category(id, name)
values (717,'Maks');
insert into category(id, name)
values (718,'Nasty');
insert into category(id, name)
values (719,'Dayana');
insert into category(id, name)
values (720,'Elvina');

insert into product(id, name, manufacturer_id, category_id)
values (611,'MacBook Pro',811,711);
insert into product(id, name, manufacturer_id, category_id)
values (612,'Iphone 11',812,712);
insert into product(id, name, manufacturer_id, category_id)
values (613,'Redmi Note9s',813,713);
insert into product(id, name, manufacturer_id, category_id)
values (614,'Samsung A41',814,714);
insert into product(id, name, manufacturer_id, category_id)
values (615,'Acer',815,715);
insert into product(id, name, manufacturer_id, category_id)
values (616,'Iphone 8',816,716);
insert into product(id, name, manufacturer_id, category_id)
values (617,'MacBook Air',817,717);
insert into product(id, name, manufacturer_id, category_id)
values (618,'',818,718);
insert into product(id, name, manufacturer_id, category_id)
values (619,'Samsung Galaxy',819,719);
insert into product(id, name, manufacturer_id, category_id)
values (620,'Lenovo 512',820,720);

insert into market_product(market_id, product_id, price)
values (1001,611,51200);
insert into market_product(market_id, product_id, price)
values (1002,612,54000);
insert into market_product(market_id, product_id, price)
values (1003,613,31500);
insert into market_product(market_id, product_id, price)
values (1004,614,69000);
insert into market_product(market_id, product_id, price)
values (1005,615,92400);
insert into market_product(market_id, product_id, price)
values (1006,616,15500);
insert into market_product(market_id, product_id, price)
values (1007,617,42500);
insert into market_product(market_id, product_id, price)
values (1008,618,55000);
insert into market_product(market_id, product_id, price)
values (1009,619,75000);
insert into market_product(market_id, product_id, price)
values (1010,620,21000);

insert into tracking(id, description, state)
values (2001,'comfortable','california');
insert into tracking(id, description, state)
values (2002,'good','canada');
insert into tracking(id, description, state)
values (2003,'handy','germany');
insert into tracking(id, description, state)
values (2004,'weak','california');
insert into tracking(id, description, state)
values (2005,'good','kazakhstan');
insert into tracking(id, description, state)
values (2006,'low price','india');
insert into tracking(id, description, state)
values (2007,'handy','france');
insert into tracking(id, description, state)
values (2008,'good','germany');
insert into tracking(id, description, state)
values (2009,'comfortable','kazakhstan');
insert into tracking(id, description, state)
values (2010,'low price','california');


insert into orders(id, order_date, total_price, warehouse_id, client_id, arrival_date, tracking_id)
values (115,'2020-09-01',12500,911,111,'2020-09-01',2001);
insert into orders(id, order_date, total_price, warehouse_id, client_id, arrival_date, tracking_id)
values (215,'2018-02-05',65400,912,121,'2018-03-05',2002);
insert into orders(id, order_date, total_price, warehouse_id, client_id, arrival_date, tracking_id)
values (315,'2017-04-02',73200,913,131,'2017-04-02',2003);
insert into orders(id, order_date, total_price, warehouse_id, client_id, arrival_date, tracking_id)
values (415,'2018-07-19',89000,914,131,'2018-07-20',2004);
insert into orders(id, order_date, total_price, warehouse_id, client_id, arrival_date, tracking_id)
values (515,'2020-10-10',91000,915,141,'2020-10-15',2005);
insert into orders(id, order_date, total_price, warehouse_id, client_id, arrival_date, tracking_id)
values (615,'2021-11-05',67000,916,151,'2021-11-05',2006);
insert into orders(id, order_date, total_price, warehouse_id, client_id, arrival_date, tracking_id)
values (715,'2021-08-13',34500,917,161,'2021-08-23',2007);
insert into orders(id, order_date, total_price, warehouse_id, client_id, arrival_date, tracking_id)
values (815,'2020-07-29',56000,918,171,'2020-07-30',2008);
insert into orders(id, order_date, total_price, warehouse_id, client_id, arrival_date, tracking_id)
values (915,'2019-07-24',23000,919,163,'2019-08-21',2009);
insert into orders(id, order_date, total_price, warehouse_id, client_id, arrival_date, tracking_id)
values (989,'2020-03-22',64000,920,181,'2020-03-22',2010);

insert into card(id, type, bank, card_number, client_id)
values (011,'credit','Kaspi','CC01',111);
insert into card(id, type, bank, card_number, client_id)
values (012,'debit','Halyk','CC02',121);
insert into card(id, type, bank, card_number, client_id)
values (013,'debit','Sberbank','CC11',131);
insert into card(id, type, bank, card_number, client_id)
values (014,'credit','Kaspi','CC21',141);
insert into card(id, type, bank, card_number, client_id)
values (015,'debit','Halyk','CC31',151);
insert into card(id, type, bank, card_number, client_id)
values (016,'credit','Kaspi','CC41',161);
insert into card(id, type, bank, card_number, client_id)
values (017,'credit','Sberbank','CC51',171);
insert into card(id, type, bank, card_number, client_id)
values (018,'debit','Alfa','CC61',181);
insert into card(id, type, bank, card_number, client_id)
values (019,'debit','Kaspi','CC71',191);
insert into card(id, type, bank, card_number, client_id)
values (020,'credit','Kaspi','CC81',201);

insert into shipper(id, name)
values (35,'SH1');
insert into shipper(id, name)
values (45,'SH2');
insert into shipper(id, name)
values (55,'SH3');
insert into shipper(id, name)
values (65,'SH4');
insert into shipper(id, name)
values (75,'SH5');
insert into shipper(id, name)
values (85,'SH6');
insert into shipper(id, name)
values (95,'SH7');
insert into shipper(id, name)
values (105,'SH8');
insert into shipper(id, name)
values (115,'SH9');
insert into shipper(id, name)
values (125,'SH10');

insert into online_order(online_order_id, shipper_id)
values (501,35);
insert into online_order(online_order_id,shipper_id)
values(511,45);
insert into online_order(online_order_id,shipper_id)
values(521,55);
insert into online_order(online_order_id,shipper_id)
values(531,65);
insert into online_order(online_order_id,shipper_id)
values(541,75);
insert into online_order(online_order_id,shipper_id)
values(551,85);
insert into online_order(online_order_id,shipper_id)
values(561,95);
insert into online_order(online_order_id,shipper_id)
values(571,105);
insert into online_order(online_order_id,shipper_id)
values(581,115);
insert into online_order(online_order_id,shipper_id)
values(591,125);

insert into order_product(order_id, product_id, market_id, quantity)
values (115,611,1001,10);
insert into order_product(order_id, product_id, market_id, quantity)
values (215,612,1002,24);
insert into order_product(order_id, product_id, market_id, quantity)
values (315,613,1003,56);
insert into order_product(order_id, product_id, market_id, quantity)
values (415,614,1004,45);
insert into order_product(order_id, product_id, market_id, quantity)
values (515,615,1005,13);
insert into order_product(order_id, product_id, market_id, quantity)
values (615,616,1006,90);
insert into order_product(order_id, product_id, market_id, quantity)
values (715,617,1007,35);
insert into order_product(order_id, product_id, market_id, quantity)
values (815,618,1008,23);
insert into order_product(order_id, product_id, market_id, quantity)
values (915,619,1008,60);
insert into order_product(order_id, product_id, market_id, quantity)
values (989,620,1010,25);

