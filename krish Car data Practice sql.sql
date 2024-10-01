-- Task 1

-- craeting database stylexcarz_DB

create database stylexcarz_DB;

-- using stylexcarz_DB
 use stylexcarz_DB;
 
 -- Task 2
 
 -- creating table salesperson
 create table salesperson
 (salesperson_id int,
 salesperson_name varchar(200),
 salesperson_city varchar(200),
 commission_rate numeric);

select * from salesperson;
 alter table salesperson add primary key (salesperson_id);
 
 -- crating table customer 
 CREATE TABLE customer 
 (customer_id int,
 c_firstname varchar(200),
 c_lastname varchar(200),
 c_city varchar(200),
 c_rating int);
 
 
 ALTER table customer add primary key (customer_id);
 
 -- creating table order
 CREATE TABLE Orders
 (order_id int,
 amounts numeric,
 orderdate date,
 salesperson_id int,
 customer_id int);


 alter table Orders add primary key (order_id);
 
alter table Orders
add FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);
alter table Orders
add FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id);

-- Task 3
insert into salesperson (salesperson_id ,salesperson_name ,salesperson_city,commission_rate)values
("1001","William","London","12"),
("1002","Liam","San Jose","13"),
("1003","Axelrod","New York","10"),
("1004","James","London","11"),
("1005","Fran","London","26"),
("1007","Oliver","Barcelona",15),
(1008,"John","London",0),
(1009,"Charles","Florida",0);

INSERT INTO customer (customer_id, c_firstname, c_lastname, c_city, c_rating)
VALUES
(2001, 'Anny', 'Hoffman', 'London', 100),
(2002, 'Jenny', 'Giovanni', 'Rome', 200),
(2003, 'Williams', 'Liu', 'San Jose', 100),
(2004, 'Harry', 'Grass', 'Berlin', 300),
(2005, 'John', 'Clemens', 'London', 200),
(2006, 'Fanny', 'Cisneros', 'San Jose', 200),
(2007, 'Jonathan', 'Pereira', 'Rome', 300);

INSERT INTO Orders (order_id, amounts, orderdate, salesperson_id, customer_id)
VALUES
(3001, 123, '2021-02-01', 1009, 2007),
(3002, 100, '2021-07-30', 1001, 2007),
(3003, 187, '2021-10-02', 1001, 2001),
(3005, 201, '2021-10-09', 1003, 2003),
(3007, 167, '2021-04-02', 1004, 2002),
(3008, 189, '2021-03-06', 1002, 2002),
(3009, 145, '2021-10-10', 1009, 2005),
(3010, 200, '2021-02-23', 1007, 2007),
(3011, 100, '2021-09-18', 1001, 2004);

-- Task 4

set SQl_SAFE_UPDATES =0;
update salesperson set commission_rate = 0.15 where commission_rate > 0 and commission_rate <=0.13;

-- Task 5

CREATE TABLE ORDERS_BKP AS select * FROM ORDERS; 
 CREATE TABLE ORDERS_PLACED_HISTORY LIKE ORDERS;
 
 -- Task 6
 
 INSERT INTO  ORDERS_PLACED_HISTORY SELECT * FROM ORDERS;
 
 DELETE FROM ORDERS WHERE order_id IN (3005 , 3008);
 
 DELETE FROM ORDERS_PLACED_HISTORY WHERE order_id IN (3005,3008);