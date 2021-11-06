-- 1a
SELECT * FROM dealer cross join  client;

-- 1b
select d, c.name, c.city, c.priority, s.id, s.date, s.amount
from dealer d
left join client c on d.id = c.dealer_id
left join sell s on c.id = s.client_id
where c.name is not null and c.city is not null and c.priority is not null
and s.id is not null and s.date is not null and s.amount is not null;

-- 1c
SELECT d.name, c.name, city
from dealer as d inner join client as c on d.location = c.city;

-- 1d
select sell.id,amount,name,city
from client inner join sell on client.id=sell.client_id
where amount>=100 and amount<=500

-- 1e
SELECT d.id, d.name
FROM client right join dealer as d
on d.id = client.dealer_id;

-- 1f
SELECT c.name, city, d.name, charge
FROM client c inner join dealer d on c.dealer_id = d.id;

-- 1g
select client.name, city, dealer.name, charge
from dealer inner join client on dealer.id = client.dealer_id
where charge>0.12

-- 1h
SELECT c.name, city, s.id, s.date, amount, d.name, charge
FROM client c left join dealer d on c.dealer_id = d.id
left join sell s on c.id = s.client_id;

-- 1i
select c.name, c.priority,d.name, s.id, s.amount
from dealer d
left join client c on d.id = c.dealer_id
left join sell s on c.id = s.client_id
where s.amount >= 2000 and c.priority is not null;

-- 2a
CREATE VIEW a1 AS
SELECT s.date, COUNT(DISTINCT s.client_id), AVG(s.amount), SUM(s.amount)
FROM sell s
GROUP BY s.date;
drop view a1;

-- 2b
CREATE VIEW b1 AS
SELECT s.date, s.amount
FROM sell s
ORDER BY s.amount DESC
LIMIT 5;
drop view b1;

-- 2c
create view c1 as
select  d, COUNT(s.amount), AVG(s.amount), SUM(s.amount)
from sell s
join dealer d on d.id = s.dealer_id
GROUP BY d;
drop view c1;

-- 2d
CREATE VIEW d1 AS
SELECT d, SUM(amount * d.charge)
FROM sell s
JOIN dealer d ON d.id = s.dealer_id
GROUP BY d;
drop view d1;
-- 2e
create view e1 as
select d.location, COUNT(s.amount), AVG(s.amount), SUM(s.amount)
from dealer d
join sell s on d.id = s.dealer_id
group by d.location;
drop view e1;

-- 2f
CREATE VIEW f1 AS
SELECT c.city, COUNT(s.amount), AVG(s.amount * (d.charge + 1)), SUM(s.amount * (d.charge + 1))
FROM client c
JOIN dealer d ON c.dealer_id = d.id
JOIN sell s ON c.id = s.client_id
GROUP BY c.city;
drop view f1;

-- 2g
create view g1
as select c.city, sum(s.amount * (d.charge + 1)) as totalexpense, sum(s.amount) as totalamount from client c
join sell s on c.id = s.client_id
join dealer d on s.dealer_id = d.id and c.city = d.location
group by c.city;
drop view g1;