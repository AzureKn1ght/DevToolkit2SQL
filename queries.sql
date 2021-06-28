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