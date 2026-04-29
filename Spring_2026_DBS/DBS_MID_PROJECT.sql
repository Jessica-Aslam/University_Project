CREATE DATABASE RetailDB1;
USE RetailDB1;

create table Customers (
customer_id int primary key,
customer_name varchar(100) not null,
email varchar(50) unique not null,
city varchar(50),
gender char(1) check (gender in ('M','F')),
registration_date date not null default (curdate())
constraint email_format check (email like '%_@__%._%')
);

create table Products (
product_id int primary key,
product_name varchar(100) not null,
category varchar(100) not null,
price decimal(10,2) not null check (price>0),
stock_quantity int not null default 0 check (stock_quantity>=0),
is_active boolean default true,
supplier_id int null,
foreign key (supplier_id)references Suppliers (supplier_id)
);

create table Sales (
sale_id int primary key,
customer_id int not null,
foreign key (customer_id) references Customers (customer_id),
product_id int not null,
foreign key (product_id) references Products (product_id),
quantity int not null check (quantity>0),
sale_date date not null default (current_date())
);

create table Suppliers (
supplier_id int primary key,
supplier_name varchar(100) not null,
contact_email varchar(100) unique,
city varchar(100),
phone_number varchar(20),
registration_date date not null default (current_date())
);

insert into Customers (customer_id, customer_name, email, city, gender, registration_date) values
(1, 'John Joel', 'john@gmail.com', 'Lahore', 'M', DEFAULT),
(2, 'Andrea Aslam', 'andrea@gmail.com', 'Karachi', 'F', '2025-01-15'),
(3, 'Ronica Miller', 'ronica@gmail.com', 'Lahore', 'F', '2025-01-16'),
(4, 'Bob Miller', 'bob@gmail.com', 'Karachi', 'M', '2025-02-22'),
(5, 'Unica John', 'unica@gmail.com', 'Multan', 'F', '2025-03-09'),
(6, 'Mia James', 'mia@gmail.com', 'Sukkur', 'F', DEFAULT),
(7, 'Jessica Scott', 'jessica@gmail.com', 'Sialkot', 'F', '2025-04-22'),
(8, 'Emilly John', 'emilly@gmail.com', 'Hyderabad', 'F', '2025-01-20'),
(9, 'Noah Green', 'noah@gmail.com', 'Multan', 'M', '2025-05-21'),
(10, 'Henry King', 'henry@gmail.com', 'Multan', 'M', '2025-03-11'),
(11, 'Daniel John', 'daniel@gmail.com', 'Sialkot', 'M', '2025-06-22'),
(12, 'Joel Bob', 'joel@gmail.com', 'Multan', 'M', DEFAULT),
(13, 'Sophia Williams', 'sophia@gmail.com', 'Hyderabad', 'F', '2025-05-14'),
(14, 'Olivia Luka', 'sana@gmail.com', 'Sukkur', 'F', '2025-02-04'),
(15, 'Luka James', 'luka@gmail.com', 'Sialkot', 'M', '2025-06-03'),
(16, 'Matthew Green', 'matthew@gmail.com', 'Lahore', 'M', DEFAULT),
(17, 'Scott Bob', 'scott@gmail.com', 'Karachi', 'M', '2025-08-11'),
(18, 'Sam Joel', 'sam@gmail.com', 'Sukkur', 'M', '2025-03-22'),
(19, 'Lucas Sam', 'lucas@gmail.com', 'Lahore', 'M', '2025-01-21'),
(20, 'Isabella Brown', 'isabella@gmail.com', 'Hyderabad', 'F', '2025-06-12');

insert into Products (product_id, product_name, category, price, stock_quantity, is_active, supplier_id) values
(1, 'Baby Diapers', 'Baby Care', 850.00, 100, TRUE, 15),
(2, 'Kids Toy Car', 'Toys', 1200.00, 50, TRUE, 2),
(3, 'Face Cream', 'Beauty', 650.00, 80, TRUE, 3),
(4, 'Green Tea Pack', 'Beverages', 450.00, 200, TRUE, 4),
(5, 'Laptop Charger', 'Electronics', 2500.00, 30, TRUE, 5),
(6, 'Ice Cream Box', 'Frozen Food', 300.00, 150, TRUE, 6),
(7, 'Solar Panel Light', 'Electronics', 5500.00, 20, TRUE, 7),
(8, 'Men Shirt', 'Fashion', 1800.00, 75, TRUE, 12),
(9, 'Women Handbag', 'Fashion', 3200.00, 40, TRUE, 12),
(10, 'Car Engine Oil', 'Automobile', 2200.00, 60, TRUE, 5),
(11, 'Protein Powder', 'Health', 4200.00, 35, TRUE, 14),
(12, 'Smart Watch', 'Electronics', 7800.00, 25, TRUE, 10),
(13, 'Mobile Phone', 'Electronics', 45000.00, 15, TRUE, 10),
(14, 'Hair Dryer', 'Beauty', 3200.00, 45, TRUE, 3),
(15, 'Tea Cup Set', 'Kitchen', 1500.00, 90, TRUE, 4),
(16, 'LED TV', 'Electronics', 85000.00, 10, TRUE, 5),
(17, 'Baby Milk Powder', 'Baby Care', 2900.00, 55, TRUE, 15),
(18, 'Fitness Dumbbells', 'Sports', 3600.00, 70, TRUE, 13),
(19, 'Laptop Bag', 'Accessories', 2100.00, 65, TRUE, 9),
(20, 'Electric Kettle', 'Kitchen', 2800.00, 85, TRUE, 1);

insert into Sales (sale_id, customer_id, product_id, quantity, sale_date) values
(1, 1, 5, 2, '2025-05-01'),
(2, 2, 3, 1, '2025-06-02'),
(3, 3, 12, 1, '2025-05-03'),
(4, 4, 8, 3, '2025-06-04'),
(5, 5, 1, 4, '2025-06-05'),
(6, 2, 10, 2, '2025-06-06'),
(7, 7, 15, 1, '2025-05-07'),
(8, 8, 7, 2, '2025-06-08'),
(9, 9, 13, 1, '2025-05-01'),
(10, 10, 2, 5, '2025-06-10'),
(11, 11, 6, 2, '2025-06-11'),
(12, 12, 18, 1, '2025-06-12'),
(13, 13, 9, 3, '2025-06-13'),
(14, 14, 4, 2, '2025-06-14'),
(15, 15, 16, 1, '2025-06-15');

UPDATE sales
SET sale_date = '2025-01-04'
WHERE sale_id = 1;
UPDATE sales
SET sale_date = '2025-02-04'
WHERE sale_id = 5;
UPDATE sales
SET sale_date = '2025-01-06'
WHERE sale_id = 8;
UPDATE sales
SET sale_date = '2025-01-10'
WHERE sale_id = 10;
UPDATE sales
SET sale_date = '2025-03-01'
WHERE sale_id = 12;


insert into Suppliers (supplier_id, supplier_name, contact_email, city, phone_number) values
(1, 'BBB Traders', 'bbb@gmail.com', 'Lahore', '03009765659'),
(2, 'Baby and Kid', 'babykid@gmail.com', 'Karachi', '03009768859'),
(3, 'Beauty Shop', 'beautyshop@gmail.com', 'Lahore', '03009768822'),
(4, 'Tea World', 'tworld@gmail.com', 'Karachi', '03009784859'),
(5, 'Techno Electronics', 'techno@gmail.com', 'Hyderabad', '03007867672'),
(6, 'Ice Delight', 'ice@gmail.com', 'Lahore', '03456789000'),
(7, 'Eco Tech', 'eco@gmail.com', 'Multan', '03228765434'),
(8, 'Jaur Suppliers', 'jaur@gmail.com', 'Sialkot', '03887645249'),
(9, 'Shells Distributors', 'shells@gmail.com', 'Multan', '03445678985'),
(10, 'Tech ABC', 'techabc@gmail.com', 'Karachi', '03224567892'),
(11, 'Fashion Street', 'fashion@gmail.com', 'Lahore', '03998765434'),
(12, 'Digital World', 'digital@gmail.com', 'Sukkur', '03224567864'),
(13, 'Health Plus', 'health@gmail.com', 'Islamabad', '03998635341'),
(14, 'Baby Care', 'babycare@gmail.com', 'Hyderabad', '03224867391'),
(15, 'Auto World', 'auto@gmail.com', 'Sialkot', '03991285928');

-- Q1. Distinct Customer Cities 
select distinct city, gender
from Customers
where city is not null
order by city, gender;

-- Q2. Product Price with Discount
select product_name,
price as original_price,
price-(price*10/100) as discounted_price
from Products
where is_active=true and price>1000
order by discounted_price desc;

-- Q3. Conditional Sales Records
select*
from Sales
where (quantity>1) and dayofweek(sale_date) between 2 and 4
order by sale_date desc, quantity asc;

-- Q4. Total Products per Category 
select category,
count(product_id) as total_product,
sum(stock_quantity)as total_stock
from Products
group by category
having count(product_id>2)
order by total_product desc, category asc;

-- Q5. Average Product Price Filtering
select category,
max(price) as max_price,
avg(price) as avg_price
from Products
group by category
having avg(price)>1000
order by avg_price desc;
 
-- Q6. Total Quantity per Customer 
select customer_id,
sum(quantity)as total_quantity,
count(sale_id) as total_sale
from Sales
where quantity>0
group by customer_id
order by total_quantity desc;

-- Q7. Min/Max Price per Category 
select category,
min(price) as min_price,
max(price)  as max_price,
avg(price) as avg_price
from Products
group by category 
having min(price<5000)
order by avg_price desc;
        
-- Q8. High Selling Products 
select 
product_id,
sum(quantity) as total_quantity,
count(distinct customer_id) as distinct_customers
from sales
group by product_id
having sum(quantity) > 2
order by total_quantity desc;

-- Q9. Quantity per Product 
select 
product_id,
sum(quantity) as total_units,
avg(quantity) as avg_quantity
from sales
group by product_id
having sum(quantity) > 1
order by total_units desc, avg_quantity asc;

-- Q10. Multiple Filters & 
select *
from sales
where quantity > 1
and sale_date between '2025-01-01' and '2025-03-01'
and sale_id % 2 = 0
order by sale_date desc, quantity asc;

-- Q11. Categories with Stock > 20 
select 
category,
sum(stock_quantity) as total_stock,
count(product_id) as total_products
from products
group by category
having sum(stock_quantity) > 20
order by total_stock desc;

-- Q12. Formatted Customer Names and Registration Month-Year
select 
concat(upper(left(customer_name,1)),
lower(substring(customer_name,2))) as formatted_name,
date_format(registration_date, '%b-%Y') as reg_month_year,
registration_date, city, gender 
from customers
where registration_date < curdate()
order by registration_date desc;



