--use a particular db
use market;

--
--show the tables in the db
show tables;

--
--describe a particular table
describe products;

--
--MySQL is not case sensitive
sEleCt
    *
FrOm
    pRoDucTs;

--
--show only particular column
select
    name
from
    products;

--
--select multiple columns
select
    name,
    market_price
from
    products;

select
    *
from
    customers;

--
--verbose specification
select
    products.name,
    products.market_price
from
    products;

--
--giving the result alias
select
    name as "Product Name",
    market_price as "Market Price"
from
    products;

--
--alis in the FROM to shorten the select
--but you must use "p" now, you cannot use "products."
select
    p.name,
    p.market_price
from
    products as p;

--
--Adding conditions to select statement
select
    *
from
    customers
where
    wallet > 7500
    and tolerance > 0.5;

--
--Sort the results
select
    *
from
    products
order by
    market_price ASC;

--
--Multiple level sorting conditions
--(The order of presidence matters)
select
    *
from
    products
order by
    market_price DESC,
    name ASC;

--
--Limit the number of results
select
    *
from
    products
where
    market_price > 10
order by
    market_price DESC
limit
    5;

--
--How do we shorten this?
select
    *
from
    transactions
where
    product_id = 2
    or product_id = 4
    or product_id = 6;

--
--Using the "in" keyword, not the best performance tho
select
    *
from
    transactions
where
    product_id in (2, 4, 6);

--
--Ex4: show top 5 customers by wallet balance
select
    *
from
    customers
order by
    wallet DESC
limit
    5;

--
--using the count function
select
    count(*)
from
    customers
where
    wallet > 7500;

--
--using the max and min function
select
    max(wallet) as "Max Wallet",
    min(wallet) as "Min Wallet"
from
    customers;

--
--NOW function does not depend on any data
select
    now();

--Task2
--finding avg wallet from customers of diff types
select
    avg(wallet)
from
    customers;

--but the above only gives one value (the average)!
--we use multiple columns and group by to get it
select
    type,
    avg(wallet)
from
    customers
group by
    type;

--similarly, we can count the number for each type
select
    type,
    count(wallet)
from
    customers
group by
    type;

--Task 1
--View highest balance for each tolerance level
select
    tolerance,
    max(wallet)
from
    customers
group by
    tolerance;

--Task 3
--View the number of items sold for each product ID
select
    product_id,
    sum(quantity)
from
    transactions
group by
    product_id;

--
--using inner joins 
select
    t.customer_id,
    c.name,
    t.amount,
    t.datetime
from
    transactions as t
    inner join customers as c on t.customer_id = c.id
order by
    t.customer_id ASC;

--
--using left joins (same, every transaction has a cust)
select
    t.customer_id,
    c.name,
    t.amount,
    t.datetime
from
    transactions as t
    left join customers as c on t.customer_id = c.id
order by
    t.customer_id ASC;

--
--using right joins (nulls, some cust no transactions)
select
    t.customer_id,
    c.name,
    t.amount,
    t.datetime
from
    transactions as t
    right join customers as c on t.customer_id = c.id
order by
    t.customer_id ASC;

--
--Task1: using multiple joins together at the same time
select
    t.customer_id,
    c.name as "customer name",
    p.name as "product name",
    t.amount
from
    transactions as t
    left join customers as c on t.customer_id = c.id
    left join products as p on t.product_id = p.id
order by
    t.customer_id ASC;

--
--Task2: For each customer, when was their last transaction
--using left join so that we can get the null values
select
    t.customer_id as "id",
    c.name as "name",
    max(t.datetime) as "latest transaction"
from
    transactions as t
    left join customers as c on t.customer_id = c.id
group by
    t.customer_id
order by
    t.customer_id ASC;

--
--Task3: All seller information and the average earnings
--note that we can also use s.* for all the columns in s
select
    s.id as "id",
    s.name as "seller name",
    s.wallet as "seller wallet",
    avg(t.amount) as "average earnings"
from
    sellers as s
    left join transactions as t on s.id = t.seller_id
group by
    s.id
order by
    s.id ASC;

--
--Task2: View all products related to "Google"
select
    *
from
    products
where
    name like "Google%";

--create a database
create database b11_phil;