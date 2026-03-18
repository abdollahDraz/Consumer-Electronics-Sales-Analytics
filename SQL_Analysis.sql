-- 1) Top 10 Revenue Products 
select top 10
p.ProductName , sum(oi.price * oi.Quantity) as TotalRevenue
from Products p
join Order_Items oi 
   on oi.ProductID = p.ProductID
group by p.ProductName 
order by TotalRevenue DESC 


-- 2) Top Customers by Spending 
CREATE VIEW Top_Customers_Spending  AS
select top 10
c.CustomerName ,c.Age ,c.Gender  , sum(o.TotalAmount) as Spending 
from Customers c
join Orders o 
     on o.CustomerID = c.CustomerID
group by c.CustomerName  , c.Age  ,c.Gender  
order by sum(o.TotalAmount) DESC

select * 
from Top_Customers_Spending


-- 3) Best Selling Brands 
select b.BrandName , sum(oi.Price * oi.Quantity) as Selling  
from Brands b
join Products p
   on p.BrandID = b.BrandID 
join Order_Items oi 
   on oi.ProductID = p.ProductID 
group by b.BrandName 
order by  selling DESC


-- 4)  Average Order Value 
select avg(o.TotalAmount) as AverageOrderValue
from orders o


-- 5) Products With Lowest Sales
select top 10
p.ProductName ,
sum(oi.Quantity) as TotalSold 
,sum(oi.Price * oi.Quantity) as TotalRevenue
from Products p
 left join Order_Items oi 
   on oi.ProductID = p.ProductID
group by p.ProductName 
order by TotalSold ASC


-- 6)  Most Ordered Products
select Top 10 
p.ProductName , sum(oi.Quantity) as TotalSold
, sum(oi.Price * oi.Quantity ) as TotalRevenue
from Products p
join Order_Items oi 
  on oi.ProductID = p.ProductID
group by p.ProductName 
order by TotalSold  desc 


-- 7) Customers With Most Orders
select top 10
c.CustomerName , count(o.OrderID) TotalOrders , 
sum(o.TotalAmount) TotalAmount
from Customers c
join orders o 
    on o.CustomerID = c.CustomerID 
group by c.CustomerName 
order by TotalOrders  DESC




-- Average Product Rating 
SELECT
    p.ProductName,
    AVG(r.Rating) AS AverageRating
FROM Products p
JOIN Reviews r
ON p.ProductID = r.ProductID
GROUP BY p.ProductName
ORDER BY AverageRating DESC;  -- Average output: 3 or 2

   


-- 9) Products Without Reviews
select 
  p.ProductName 
 from Products p
left join Reviews r 
     on p.ProductID = r.ProductID 
where r.Rating is null  -- not Found any product without Reviews 



-- 10) Brand Performance 
SELECT top 10
    b.BrandName,
    SUM(oi.Quantity) AS TotalSold ,
    Sum(oi.Price * oi.Quantity) as TotalRevenue 
FROM Brands b
JOIN Products p
ON b.BrandID = p.BrandID
JOIN Order_Items oi
ON p.ProductID = oi.ProductID
GROUP BY b.BrandName
ORDER BY TotalSold DESC;



-- 11)   Revenue Per Customer
SELECT
    c.CustomerName,
    SUM(o.TotalAmount) AS Revenue
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY Revenue DESC;



-- 12) Monthly Sales
select 
month(o.OrderDate)  , sum(o.TotalAmount) as TotalRevenue 
from Orders o
group by  month(o.OrderDate)
order by TotalRevenue DESC


-- 13) Yearly sales 
select 
year(o.OrderDate)  , sum(o.TotalAmount) as TotalRevenue 
from Orders o
group by  year(o.OrderDate)
order by TotalRevenue DESC


-- 14) by Quarters 
SELECT
    DATEPART(QUARTER, OrderDate) AS Quarter,
    SUM(TotalAmount) AS TotalRevenue
from  Orders
group by DATEPART(QUARTER, OrderDate)
order by  Quarter;

-- 15) sales in 2023 by Quarters
select 
   DATEPART(QUARTER , OrderDate) AS Quarter 
   , SUM(TotalAmount) AS TotalRevenue
from orders 
where Year(OrderDate) = 2023
group by DATEPART(QUARTER , OrderDate)
ORDER BY Quarter


-- 16) sales in 2024 by Quarters
select 
   DATEPART(QUARTER , OrderDate) AS Quarter 
   , SUM(TotalAmount) AS TotalRevenue
from orders 
where Year(OrderDate) = 2024
group by DATEPART(QUARTER , OrderDate)
ORDER BY Quarter


-- 17) sales in 2025 by Quarters
select 
   DATEPART(QUARTER , OrderDate) AS Quarter 
   , SUM(TotalAmount) AS TotalRevenue
from orders 
where Year(OrderDate) = 2025
group by DATEPART(QUARTER , OrderDate)
ORDER BY Quarter


---- 18) sales in 2026 by Quarters
select 
   DATEPART(QUARTER , OrderDate) AS Quarter 
   , SUM(TotalAmount) AS TotalRevenue
from orders 
where Year(OrderDate) = 2026
group by DATEPART(QUARTER , OrderDate)
ORDER BY Quarter



-- 19) daily sales 
select 
  day(OrderDate) as day_  ,
  SUM(TotalAmount) AS TotalRevenue
from Orders
group by  day(OrderDate) 
order by day_


-- 20) sales in 2023 by day 
select 
  day(OrderDate) as day_  ,
  SUM(TotalAmount) AS TotalRevenue
from Orders
where year(OrderDate) = 2023
group by  day(OrderDate) 
order by day_



-- 21) sales in 2024 by day 
select 
  day(OrderDate) as day_  ,
  SUM(TotalAmount) AS TotalRevenue
from Orders
where year(OrderDate) = 2024
group by  day(OrderDate) 
order by day_





-- 22) sales in 2024 by day 
select 
  day(OrderDate) as day_  ,
  SUM(TotalAmount) AS TotalRevenue
from Orders
where year(OrderDate) = 2024
group by  day(OrderDate) 
order by day_



-- 23) sales in 2025 by day 
select 
  day(OrderDate) as day_  ,
  SUM(TotalAmount) AS TotalRevenue
from Orders
where year(OrderDate) = 2025
group by  day(OrderDate) 
order by day_



-- 24) sales in 2026 by day 
select 
  day(OrderDate) as day_  ,
  SUM(TotalAmount) AS TotalRevenue
from Orders
where year(OrderDate) = 2026
group by  day(OrderDate) 
order by day_


--25)  Products Per Brand
select b.BrandName ,  
       count(p.ProductID) as productsCount 
from Brands b 
join Products p
   on p.BrandID = b.BrandID
GROUP BY b.BrandName
order by productsCount DESC



-- 26) Customer Lifetime Value
 select c.CustomerName  ,
 sum(oi.Price * oi.Quantity) as LifetimeValue   -- calc the total values of products for any customer 
from Customers c
JOIN Orders o
   ON c.CustomerID = o.CustomerID
JOIN Order_Items oi
   ON o.OrderID = oi.OrderID
group by c.CustomerName 
order by  LifetimeValue DESC 

-- 27) Highest Price Product Per Brand
select b.BrandName , p.ProductName
 , Max(p.Price) as HighestPrice 
from Brands b 
JOIN Products p
ON b.BrandID = p.BrandID
group by b.BrandName  , p.ProductName
order by HighestPrice 



-- 28) Highest Price Product Per Brand (Sold)
select * 
from
(select   b.BrandName,
    p.ProductName,
    p.Price, Rank() over(partition by b.BrandName order by  p.Price DESC ) as PriceRank
FROM Brands b
JOIN Products p
ON b.BrandID = p.BrandID
JOIN Order_Items oi
ON p.ProductID = oi.ProductID) as Rankproducts 
where PriceRank = 1  


-- 29) most Product Per Brand (Sold)
select * 
from
(select   b.BrandName,
    p.ProductName,
    oi.Quantity, Rank() over(partition by b.BrandName order by  oi.Quantity DESC ) as QuantityRank
FROM Brands b
JOIN Products p
ON b.BrandID = p.BrandID
JOIN Order_Items oi
ON p.ProductID = oi.ProductID) as Rankproducts 
where QuantityRank = 1  


-- 30) Lowest Price Product Per Brand
SELECT
    b.BrandName,
    MIN(p.Price) AS LowestPrice
FROM Brands b
JOIN Products p
ON b.BrandID = p.BrandID
GROUP BY b.BrandName;




-- 31) Average Product Price Per Brand 
SELECT
    b.BrandName,
    AVG(p.Price) AS AvgPrice
FROM Brands b
JOIN Products p
ON b.BrandID = p.BrandID
GROUP BY b.BrandName;


-- 32) Total Orders Per Brand 
SELECT
    b.BrandName,
    COUNT(DISTINCT oi.OrderID) AS OrdersCount
FROM Brands b
JOIN Products p
ON b.BrandID = p.BrandID
JOIN Order_Items oi
ON p.ProductID = oi.ProductID
GROUP BY b.BrandName;

-- 33) Total Business Revenue
SELECT
    SUM(TotalAmount) AS TotalRevenue
FROM Orders;


-- 33) Revenue Contribution Percentage 
select  p.ProductName 
, SUM(oi.Quantity * oi.Price) AS Revenue 
, SUM(oi.Quantity * oi.Price) * 100 / SUM(SUM(oi.Quantity * oi.Price)) over() as  RevenuePercentage
from Products p
JOIN Order_Items oi
ON p.ProductID = oi.ProductID
GROUP BY p.ProductName;


-- 34 ) Customers Who Spent Above Average
select CustomerName , totalspending
from 
(select c.CustomerName 
, SUM(oi.Price * Quantity) as totalspending  
from Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN Order_Items oi
ON o.OrderID = oi.OrderID
GROUP BY c.CustomerName ) as spendingtale 
where totalspending > (
select AVG(totalspent)
from
(select 
sum(oi.Price * oi.Quantity) as totalspent  
from  orders o
join Order_Items oi 
   on oi.OrderID = o.OrderID
group by o.CustomerID ) as AVGTABLE  
); 





-- 35) Product Sales Ranking 
select  top 10
p.ProductName 
  , sum(oi.Price * oi.Quantity) as totalSales 
from Products p
join Order_Items oi 
 on oi.ProductID = p.ProductID 
 group by p.ProductName 
 order by  sum(oi.Price * oi.Quantity) DESC


 -- 36)  Customer Segmentation 
 create view CustomerSegmentation as
select
c.CustomerName   ,
sum(oi.Price * oi.Quantity) as Spending , 
  case 
       when  sum(oi.Price * oi.Quantity) > 5000 then 'High Value'
       when  sum(oi.Quantity * oi.Price) > 2000 THEN 'Medium Value'
       ELSE 'Low Value'
  end as CustomerSegment
from Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
JOIN Order_Items oi
ON o.OrderID = oi.OrderID
GROUP BY c.CustomerName;

select * from CustomerSegmentation




-- 37) Products With Sales Above Average 

select ProductName ,ToatalSpending 
from
(select p.ProductName ,
       sum(oi.Price * oi.Quantity) as ToatalSpending 
FROM Products p
JOIN Order_Items oi
ON p.ProductID = oi.ProductID
GROUP BY p.ProductName ) as Spending 
where Toatalspending > 
(
select avg(Totalspent) 
from 
(
select 
sum(oi.Price * oi.Quantity) as Totalspent 
from Products p
JOIN Order_Items oi
ON p.ProductID = oi.ProductID
GROUP BY p.ProductID
) as avgtable 
);
























