
USE Northwind;
select * from OrderDetails;
select * from  Orders;
select * from  Products;
select * from  Categories;
select * from  Customers;
select * from  Employees;
select * from  Shippers;
select * from  Suppliers;

# Retrieve all customers from a specific city.
select * from Customers where city="London";

# List all products with their corresponding categories.
select p.productid, p.categoryid, c. description ,c. categoryname
from products p join categories c on p.categoryid=c.categoryid order by categoryid desc;

#Find orders made by a particular customer
select * from orders where customerid=51;

#Get the total number of orders handled by each employee
select * from orders where EmployeeID=5;

#Find the top-selling products (by quantity) along with their suppliers
select p.productname , s.suppliername, max(od.quantity) as totalquantitysold
from products p
join orderdetails od on p.productid=od.ProductID
join suppliers s on p.supplierid=s.supplierid
group by p.productname, s.suppliername
order by totalquantitysold desc;

#Calculate total sales for each category
select categoryName,sum(p.price*od.Quantity)as totalsales 
from categories c
left join products p  on c.categoryID=p.categoryID
left join orderdetails od on od.productid=p.productid
group by categoryName;

#List all orders along with the customer name and employee name
select o.orderid, c.customername, e.firstname , e.lastname 
from orders o 
inner join employees e on o.employeeid=e.employeeid
inner join customers c on o.customerid=c.customerid; 

#Find out the number of products supplied by each supplier
select s.suppliername, s.supplierid, count(p.productid) as product_count 
from suppliers s
left join products p on p.supplierid=s.supplierid 
group by s.supliername, s.supplierid; 

#Find orders placed on a specific date
SELECT * FROM orders WHERE DATE(orderdetailsid) = 2024-03-01;   

#List all employees born after a certain date
select * from employees where birthdate between "1928-09-19 and" and "1955-03-04"; 

#Retrieve the details of a particular order along with the products ordered
select od.orderdetailid, o.orderid, p.productid, p.productname
from orderdetails od 
inner join orders o on od.orderid=o.orderid
inner join products p on p.ProductID=od.ProductID;

# List all customers who have not placed any orders
select * from customers where customerid not in (select distinct customerid from orders);

# Find the total number of products sold in each order
select od.orderid, count(p.productid) 
from products p
join orderdetails od on p.productid=od.productid
group by orderid; 

# Retrieve the contact information of suppliers located in a specific country
select suppliername, contactname  from suppliers where country="japan";

# Calculate the total revenue generated by each product
select p.ProductID, p.ProductName, sum(p.price*od.quantity) as totalrevenue
from products p 
join orderdetails od on p.ProductID=od.ProductID
group by ProductID,ProductName
order by totalrevenue desc;

#Find the employee who handled the most orders
select e.firstname, count(o.orderid) as total
from employees e 
join orders o on e.EmployeeID=o.EmployeeID
group by firstname
order by total desc;

# Retrieve orders placed by customers from a specific country, along with the corresponding shipping details
select o.customerid, o.orderid, s.ShipperID, s.shippername 
from customers c
inner join orders o on o.customerid=c.customerid
inner join shippers s on s.ShipperID=o.shipperid
where country ="uk";

# Top Selling Products
select p.productname, count(od.OrderDetailID) as totalsales
from products p
join orderdetails od on p.Productid=od.ProductID
group by ProductName
order by totalsales desc;

# Customer Sales Performance
 select c.customername, count(od.orderid), sum(p.price*od.quantity) as sales
 from customers c
 join orders o on o.CustomerID=c.CustomerID
 join orderdetails od on od.orderid=o.OrderID
 join products p on p.productid=od.productid
 group by customername
 order by sales desc;

# Customer Geographic Analysis
select country, count(customerid) as totalcount
from customers
group by country
order by totalcount desc;