SELECT * FROM newschema.cust_dimen;

SELECT customer_name as 'Customer Name', customer_segment as 'Customer Segment' from newschema.cust_dimen;
SELECT * FROM newschema.cust_dimen ORDER BY cust_id DESC;
SELECT order_id,order_date from newschema.orders_dimen where order_priority ='high';
SELECT sum(sales) as total_sales, avg(sales) as avg_sales from newschema.market_fact;
SELECT max(sales) as 'maximum sales', min(sales) as 'minimum sales' from newschema.market_fact;

select Customer_Name, Region from newschema.cust_dimen order by Customer_Name desc;

select customer_name ,Region,max(total) 
from (select customer_name ,Region,count(Customer_Name) as total from newschema.cust_dimen group by Region) as total;

select Region , count(Region) from newschema.cust_dimen
group by Region;
select product_sub_category , count(product_sub_category) from newschema.prod_dimen group by
Product_Sub_Category ;

select p.Product_Sub_Category, p.Prod_id, c.Customer_Name,c.Region from newschema.cust_dimen as c inner join newschema.market_fact as m on c.Cust_id = m.Cust_id 
join newschema.prod_dimen as p on p.Prod_id = m.Prod_id group by c.Region,c.region= 'atlantic';

select province, count(customer_name),Customer_Name , customer_segment from newschema.cust_dimen where Customer_Segment = 'small business' and Province= "ontario";
 
select prod_id , sum(order_quantity) as ' no_of_products sold' from newschema.market_fact
group by Prod_id
order by sum(Order_Quantity) desc;

select Prod_id,Product_Sub_Category from newschema.prod_dimen
 order by Product_Category = 'furniture' and 'technology';
 
 select profit, P.Product_Sub_Category, P.Product_Category from newschema.prod_dimen as P
 join newschema.market_fact as M  on P.Prod_id=M.Prod_id order by profit;
 
 select O.order_date , M.Order_Quantity , M.Sales from newschema.market_fact as M 
 join newschema.orders_dimen as O on O.Ord_id=M.Ord_id ;
 
 select Customer_Name from newschema.cust_dimen where Customer_Name like '_R%';
  select Customer_Name from newschema.cust_dimen where Customer_Name like '___D%';
  
select C.Cust_id, M.Sales , C.Customer_Name , C.Region from newschema.cust_dimen as C
join newschema.market_fact as M on M.Cust_id=C.Cust_id and M.sales between 1000 and 5000;

select sales from newschema.market_fact order by sales desc
limit 3  ;

select Profit,count(S.Ship_id),  p.Product_Sub_Category,c.Region from newschema.cust_dimen as c
inner join newschema.market_fact as m on c.Cust_id = m.Cust_id join 
newschema.shipping_dimen as S on m.Ship_id= S.ship_id 
join newschema.prod_dimen as p on p.Prod_id = m.Prod_id order by Profit;



