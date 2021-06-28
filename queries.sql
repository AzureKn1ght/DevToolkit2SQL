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
sEleCt *
FrOm pRoDucTs;
--
--show only particular column
select name
from products;
--
--select multiple columns
select name,
    market_price
from products;
select *
from customers;
--
--verbose specification
select products.name,
    products.market_price
from products;
--
--giving the result alias
select name as "Product Name",
    market_price as "Market Price"
from products;
--
--alis in the FROM to shorten the select
--but you must use "p" now, you cannot use "products."
select p.name,
    p.market_price
from products as p;
--
--Adding conditions to select statement
select *
from customers
where wallet > 7500
    and tolerance > 0.5;