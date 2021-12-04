create table region(
    id int PRIMARY KEY ,
    name varchar(100) UNIQUE
);

create table city(
    id int PRIMARY KEY,
    name varchar(100) NOT NULL,
    region_id int REFERENCES region(id)
);

create table street(
    id int primary key,
    name varchar(100) not null,
    city_id int references city(id)
);

create table client(
    id int primary key,
    name varchar(50) NOT NULL,
    street_id int REFERENCES street(id),
    building_number varchar(10),
    appartment_number int
);

create table market(
    id int primary key,
    name varchar(100),
    street_id int REFERENCES street(id),
    building_number varchar(10)
);

create table warehouse(
    id int primary key,
    name varchar(10),
    street_id int REFERENCES street(id),
    building_number varchar(10),
    market_id int references market(id)
);

create table manufacturer(
    id int primary key,
    name varchar(100)
);

create table category(
    id int primary key,
    name varchar(100)
);

create table product(
    id int primary key,
    name varchar(200),
    manufacturer_id int REFERENCES manufacturer(id),
    category_id int references category(id)
);

create table market_product(
    market_id int references market(id),
    product_id int references product(id),
    price double precision,
    PRIMARY KEY (market_id,product_id)
);

create table tracking(
    id int primary key,
    description varchar(200),
    state varchar(10)
);

create table online_client(
    online_client_id int REFERENCES client(id),
    account_id int,
    PRIMARY KEY (online_client_id)
);

create  table orders(
    id int primary key,
    order_date date,
    total_price double precision,
    warehouse_id int references warehouse(id),
    client_id int references client(id),
    arrival_date date,
    tracking_id int references tracking(id)
);

create table card (
    id int primary key,
    type varchar(10),
    bank varchar(10),
    card_number int,
    client_id int references online_client(online_client_id)
);
CREATE table shipper(
    id int primary key,
    name varchar(10)
);

CREATE TABLE online_order(
    online_order_id int primary key REFERENCES orders(id),
    shipper_id int references shipper(id)
);

CREATE TABLE order_product(
    order_id INT references orders(id),
    product_id INt references product(id),
    market_id int references market(id),
    quantity int
);