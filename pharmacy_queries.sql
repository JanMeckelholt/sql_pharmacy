--ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YY';
set verify off
PROMPT --1.1) show all orders for Customer "Peter Meier"
select cO.COID, c.customerName, cO.dateOfOrder, d.dateoffulfillment, a.articlename, aO.quantity 
    from custOrder cO
    inner join customer c ON cO.customer_customerId = c.customerId
    inner join article_order aO on cO.COID = aO.custorder_coid
    inner join article a on a.articleid = aO.article_articleId
    inner join delivery d on d.custOrder_COID = co.coid
    where c.customerName='Peter Meier';


PROMPT --1.2) show all open orders for Customer "Peter Meier"
select cO.COID, c.customerName, cO.dateOfOrder, a.articlename, aO.quantity 
    from custOrder cO
    inner join customer c ON cO.customer_customerId = c.customerId
    inner join article_order aO on cO.COID = aO.custorder_coid
    inner join article a on a.articleid = aO.article_articleId
    inner join delivery d on d.custOrder_COID = co.coid
    where c.customerName='Peter Meier' and d.DateOfFulfillment is NULL;
    
PROMPT ************************************************************************************

PROMPT --2) create a new Order for Anne Fischer
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values ((Select customerId from Customer where customerName='Anne Fischer'), current_date);
define AF_COID = custorder_coid_seq.currval;
Insert into Article_Order (custOrder_COID, article_articleId, quantity, priceAtDateOfOrder) values (&AF_COID, 1, 5, (SELECT a.salesPrice from Article a where articleId=1)); 
Insert into Article_Order (custOrder_COID, article_articleId, quantity, priceAtDateOfOrder) values (&AF_COID, 2, 1, (SELECT a.salesPrice from Article a where articleId=2)); 
Insert into Article_Order (custOrder_COID, article_articleId, quantity, priceAtDateOfOrder) values (&AF_COID, 5, 2, (SELECT a.salesPrice from Article a where articleId=5)); 

PROMPT -- All Orders of 'Anne Fischer':
select cO.COID, c.customerName, cO.dateOfOrder, a.articlename, aO.quantity
    from custOrder cO
    inner join customer c ON cO.customer_customerId = c.customerId
    inner join article_order aO on cO.COID = aO.custorder_coid
    inner join article a on a.articleid = aO.article_articleId
    where c.customerName='Anne Fischer';

PROMPT --3) create a delivery and assign a Deliverycompany 'UPS' for that Order of Anne Fischer
Insert into delivery (DateOfAssignment, DeliveryCompany_DCID, CustOrder_COID) values (current_date + interval '1' day, (select DCID from DeliveryCompany where DCName='UPS'), &AF_COID);

select cO.COID, c.customerName, cO.dateOfOrder, a.articlename, aO.quantity, dc.dcName, d.dateOfAssignment
    from custOrder cO
    inner join customer c ON cO.customer_customerId = c.customerId
    inner join article_order aO on cO.COID = aO.custorder_coid
    inner join article a on a.articleid = aO.article_articleId
    inner join delivery d on cO.coid = d.custOrder_COID
    inner join deliveryCompany dc on d.deliverycompany_dcid = dc.dcid
    where c.customerName='Anne Fischer';

PROMPT ************************************************************************************

PROMPT --4) show unused Drawer
Select d.drawerId, w.warehouseName
            from Drawer d
            join warehouse w on w.warehouseid = d.warehouse_warehouseid
            where
                d.drawerId not in (select drawer_drawerid from drawer_article) and
                d.drawerId not in (select drawer_drawerid from drawer_ingredient)
            order by drawerId;

PROMPT ************************************************************************************

PROMPT --5) check quantity in warehouse for Aspirin which is still good to use at 1.06.2021
PROMPT -- Total stock of Aspirin
select * from drawer_article da where da.article_articleId = (select articleId from article where articleName='Aspirin');
PROMPT -- Aspirin Quantitiy which is still good to use at 1.06.2021
select * from drawer_article da  
    where da.article_articleId = (select articleId from article where articleName='Aspirin' and bestBeforeDate > TO_Date('01-06-2021', 'dd-mm-yyyy'));
select sum(da.quantity) AS "Asprin Best-Before > 1.06.2021"
    from drawer_Article da 
    where da.article_articleId = (select articleId from article where articleName='Aspirin' and bestBeforeDate > TO_Date('01-06-2021', 'dd-mm-yyyy'));

PROMPT ************************************************************************************

PROMPT --6) Update the OrderPrice of Aspirin to 2.00 and store 500 Aspirin in Warehouse - splitup in differen location
Update Drug 
    set OrderPrice = 2
    where (ArticleId=(select ArticleId from Article where ArticleName='Aspirin'));

Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) 
    values (
        (Select min(d.drawerId) 
            from Drawer d
            where d.warehouse_warehouseId = (select warehouseId from warehouse where warehouseName='Storageroom') and 
                d.drawerId not in (select drawer_drawerid from drawer_article) and
                d.drawerId not in (select drawer_drawerid from drawer_ingredient)),
        (select articleId from article where articleName='Aspirin'), 
        450, 
        current_date + interval '1' year + interval '5' day,
        (select OrderPrice from Drug where articleId = (select articleId from article where articleName='Aspirin'))
    );
    
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) 
    values (
        (Select min(d.drawerId) 
            from Drawer d
            where d.warehouse_warehouseId = (select warehouseId from warehouse where warehouseName='Behind Counter') and 
                d.drawerId not in (select drawer_drawerid from drawer_article) and
                d.drawerId not in (select drawer_drawerid from drawer_ingredient)),
        (select articleId from article where articleName='Aspirin'), 
        40, 
        current_date + interval '1' year + interval '5' day,
        (select OrderPrice from Drug where articleId = (select articleId from article where articleName='Aspirin'))
    );
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) 
    values (
        (Select min(d.drawerId) 
            from Drawer d
            where d.warehouse_warehouseId = (select warehouseId from warehouse where warehouseName='Under Counter') and 
                d.drawerId not in (select drawer_drawerid from drawer_article) and
                d.drawerId not in (select drawer_drawerid from drawer_ingredient)),
        (select articleId from article where articleName='Aspirin'), 
        10, 
        current_date + interval '1' year + interval '5' day,
        (select OrderPrice from Drug where articleId = (select articleId from article where articleName='Aspirin'))
    );
PROMPT -- Total stock of Aspirin
select * from drawer_article da where da.article_articleId = (select articleId from article where articleName='Aspirin');
PROMPT -- Aspirin Quantitiy which is still good to use at 1.06.2021
select sum(da.quantity) AS "Asprin Best-Before > 1.06.2021"
    from drawer_Article da 
    where da.article_articleId = (select articleId from article where articleName='Aspirin' and bestBeforeDate > TO_Date('01-06-2021', 'dd-mm-yyyy'));

PROMPT ************************************************************************************


PROMPT --7) Take Ingredients out of the store to create 10 units of the ointment 'Homemade special Ointment 87'. Store the ointment.
define art_id = (select articleId from Article where ArticleName='Homemade special Ointment 87');

PROMPT --Initial Ingredient-Stock for Ointment 'Homemade special Ointment 87'
select oi.Ingredient_IngredientId as IngredintId, i.IngredientName, oi.quantity as quantity_per_ointment, di.drawer_drawerid as DrawerId, di.quantity as stock
    from Oint_Ing oi 
    inner join Ingredient i on i.ingredientid = oi.ingredient_ingredientid
    inner join Drawer_Ingredient di on di.ingredient_ingredientid = oi.ingredient_ingredientid
    where oi.Ointment_ArticleId = &art_id;

PROMPT --Initial Stock of 'Homemade special Ointment 87'
select a.ArticleId, a.ArticleName, da.Drawer_drawerId as DrawerId, da.quantity 
    from Article a
    inner join Drawer_Article da on a.ArticleId = da.Article_ArticleId
    where a.ArticleId=&art_id;

define first_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id);
define second_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id and Ingredient_IngredientId not in (&first_ing));
define third_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id and Ingredient_IngredientId not in (&first_ing, &second_ing));

Update Drawer_Ingredient 
    set quantity = (quantity - (select quantity from oint_ing where Ingredient_IngredientId=&first_ing and Ointment_articleId=&art_id)*10) 
    where (Ingredient_IngredientId=&first_ing and rownum=1);

Update Drawer_Ingredient 
    set quantity = (quantity - (select quantity from oint_ing where Ingredient_IngredientId=&second_ing and Ointment_articleId=&art_id)*10) 
    where (Ingredient_IngredientId=&second_ing and rownum=1);
    
Update Drawer_Ingredient 
    set quantity = (quantity - (select quantity from oint_ing where Ingredient_IngredientId=&third_ing and Ointment_articleId=&art_id)*10) 
    where (Ingredient_IngredientId=&third_ing and rownum=1);

define costsperunit = (select orderprice from ingredient where ingredientId=&first_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&first_ing and ointment_articleId=&art_id) + (select orderprice from ingredient where ingredientId=&second_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&second_ing and ointment_articleId=&art_id) + (select orderprice from ingredient where ingredientId=&third_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&third_ing and ointment_articleId=&art_id);
    
Insert into Drawer_Article
    (drawer_drawerId, Article_ArticleId, quantity, BestBeforeDate, CostsPerUnit)
    values ((select min(drawerId) from drawer where
                drawerId not in (select drawer_drawerid from drawer_article) and
                drawerId not in (select drawer_drawerid from drawer_ingredient)), &art_id, 10, current_date + interval '50' day, &costsperunit); 

PROMPT --Ingredient Stock after Creation of Ointment
select oi.Ingredient_IngredientId as IngredientId, i.IngredientName, oi.quantity as quantity_per_ointment, di.drawer_drawerid as DrawerId, di.quantity as stock
    from Oint_Ing oi 
    inner join Ingredient i on i.ingredientid = oi.ingredient_ingredientid
    inner join Drawer_Ingredient di on di.ingredient_ingredientid = oi.ingredient_ingredientid
    where oi.Ointment_ArticleId = &art_id;

PROMPT --Stock of 'Homemade special Ointment 87'    
select a.ArticleId, a.ArticleName, da.Drawer_drawerId as DrawerId, da.quantity as stock
    from Article a
    inner join Drawer_Article da on a.ArticleId = da.Article_ArticleId
    where a.ArticleId=&art_id;

PROMPT ************************************************************************************
PROMPT --8.1) Rank the customers according to bought salesvalue overall
select c.customerid, c.customername, sum(ao.priceatdateoforder * ao.quantity) as SalesValue_Overall
    from Customer c
    inner join CustOrder co on c.customerid = co.customer_customerid
    inner join Article_Order aO on ao.custorder_coid = co.coid
    group by c.customerid, c.customername
    order by sum(ao.priceatdateoforder * ao.quantity) desc;

PROMPT --8.2) Rank the customers according to bought salesvalue in the last 10 days    
select c.customerid, c.customername, sum(ao.priceatdateoforder * ao.quantity) as SalesValue_10Days
    from Customer c
    inner join CustOrder co on c.customerid = co.customer_customerid
    inner join Article_Order aO on ao.custorder_coid = co.coid
    where co.dateOfOrder > current_date-10
    group by c.customerid, c.customername
    order by sum(ao.priceatdateoforder * ao.quantity) desc;


PROMPT ************************************************************************************
PROMPT --9) Rank the delivery companies according to avarage delivery-time
select dc.DCID, dc.DCName, avg(d.DateOfFulfillment-d.dateOfAssignment) as Avg_DeliveryTime
    from DeliveryCompany dc
    inner join Delivery d on d.deliveryCompany_DCID = dc.DCID
    where d.dateOfFulfillment Is Not Null
    group by dc.DCID, dc.DCName
    order by avg(d.DateOfFulfillment-d.dateOfAssignment) asc;


PROMPT ******************************************
******************************************
PROMPT --10) Show the value of the Ingredients of the 'Homemade special Ointment 87'
select sum(i.OrderPrice * oi.quantity) AS Ingredient_Value
    from Ingredient i
    inner join Oint_Ing oi on oi.Ingredient_IngredientId = i.IngredientId
    inner join Ointment o on o.ArticleId = oi.Ointment_ArticleId
    inner join Article a on a.ArticleId = o.ArticleId
    where a.articleName='Homemade special Ointment 87';
PROMPT ******************************************

PROMPT --11) Rank the Ointments according to the value of their ingredients
select a.ArticleId, a.ArticleName, sum(i.OrderPrice * oi.quantity) as Ingredient_Value
    from Ingredient i
    inner join Oint_Ing oi on oi.Ingredient_IngredientId = i.IngredientId
    inner join Ointment o on o.ArticleId = oi.Ointment_ArticleId
    inner join Article a on a.ArticleId = o.ArticleId
    group by a.ArticleId, a.ArticleName
    order by sum(i.OrderPrice * oi.quantity) desc;
PROMPT ******************************************

PROMPT --12) Show the Stock of Drugs where the current order price differs from the price the stock was bought for
select a.ArticleId, a.ArticleName, d.OrderPrice AS current_orderprice, da.CostsPerUnit as price_at_time_of_order, da.Drawer_DrawerId as DrawerId, da.Quantity
    from Article a
    inner join Drug d on d.ArticleId = a.ArticleId
    inner join Drawer_Article da on da.Article_ArticleId = a.ArticleId
    where da.CostsPerUnit <> d.OrderPrice;
PROMPT ******************************************    

PROMPT --13.1) Rank Drug-Categories according to average profit
select a.ArticleCategory as Article_Category, avg(a.SalesPrice- d.OrderPrice) as average_profit
    from Article a
    inner join Drug d on d.ArticleId = a.ArticleId
    group by a.ArticleCategory
    order by avg(a.SalesPrice- d.OrderPrice) desc;

PROMPT --13.2) Show the Drug-Category with highest average profit 
select * from 
    (select a.ArticleCategory as Article_Category, avg(a.SalesPrice- d.OrderPrice) as average_profit
        from Article a
        inner join Drug d on d.ArticleId = a.ArticleId
        group by a.ArticleCategory)
    where average_profit = 
        (select max(avg(a.SalesPrice- d.OrderPrice))
            from Article a
            inner join Drug d on d.ArticleId = a.ArticleId
            group by a.ArticleCategory);

PROMPT ******************************************


PROMPT --14.1) Rank Article Category according to salesvolumen overall
select a.ArticleCategory, sum(ao.quantity * ao.PriceAtDateOfOrder) as SalesVolume_overall
    from Article a
    inner join Article_order ao on a.ArticleId = ao.Article_ArticleId
    group by a.ArticleCategory
    order by sum(ao.quantity * ao.PriceAtDateOfOrder) desc;
    
PROMPT --14.2) Rank Article Category according to salesvolumen in the last 7days
select a.ArticleCategory, sum(ao.quantity * ao.PriceAtDateOfOrder) as SalesVolume_7days
    from Article a
    inner join Article_order ao on a.ArticleId = ao.Article_ArticleId
    inner join CustOrder co on co.COID = ao.CustOrder_COID
    where co.DateOfOrder > current_date-7
    group by a.ArticleCategory
    order by sum(ao.quantity * ao.PriceAtDateOfOrder) desc;


PROMPT ******************************************

PROMPT --15) Predict the salesvolume of Aspirin per Week based on the sales of the last 30 days
select sum(ao.Quantity)/30*7 as Asprin_per_Week
    from Article_Order ao
    inner join Article a on a.ArticleId = ao.Article_ArticleId
    inner join CustOrder co on co.COID = ao.CustOrder_COID
    where co.DateOfOrder > current_date-30 and a.ArticleName='Aspirin';

PROMPT ******************************************

PROMPT --16.1) Show Articles which have to be restocked (Current Stock < Minimal Stock) not considering Best-Before-Date
select a.ArticleId as ArtId, a.ArticleName, a.MinStock, sum(da.quantity) as current_stock
    from Article a
    left join Drawer_Article da on a.ArticleId = da.Article_ArticleId
    group by a.ArticleId, a.ArticleName, a.MinStock
    having sum(da.quantity) < a.MinStock or a.ArticleId not in (Select Article_ArticleId from Drawer_Article)
    order by ArtId;

PROMPT --16.1) Show Articles which have to be restocked counting only stock which is good to use for at least another 7 days.
select t1.ArtId, t1.ArticleName, t1.MinStock, t1.Current_Stock, t2.stock_in_7_Days from
    (select a.ArticleId as ArtId, a.ArticleName, a.MinStock, sum(da.quantity) as current_stock
        from Article a
        left join Drawer_Article da on a.ArticleId = da.Article_ArticleId
        where da.BestBeforeDate > current_date + interval '7' day or a.ArticleId not in (Select Article_ArticleId from Drawer_Article where BestBeforeDate > current_date +interval '7' day) 
        group by a.ArticleId, a.ArticleName, a.MinStock
        having sum(da.quantity) < a.MinStock or a.ArticleId not in (Select Article_ArticleId from Drawer_Article where BestBeforeDate > current_date +interval '7' day)) t1
    left join 
        (select da2.Article_ArticleId as ArtId, sum(da2.quantity) as stock_in_7_days
            from Drawer_Article da2
            where da2.BestBeforeDate > current_date + interval '7' day
            group by da2.Article_ArticleId) t2
    on t1.ArtId = t2.ArtId
    order by ArtId;

PROMPT ******************************************
PROMPT --17) Show the average number of different articles that a customer without customer-card (anonymus profile) buys per visit.
select avg(count(ao.Article_ArticleId)) as average_number_of_items
    from Article_Order ao
    inner join CustOrder co on ao.CustOrder_COID = co.COID
    inner join Customer c on c.CustomerId = co.Customer_CustomerId
    where c.CustomerName = 'anonym'
    group by co.COID;

PROMPT ******************************************
PROMPT --18) Show the development of the sales volume per week
SELECT to_char(co.DateOfOrder - 7/24,'IYYY') as CalenderYear, to_char(co.DateOfOrder - 7/24,'IW') as CalenderWeek, SUM(ao.quantity * ao.PriceAtDateOfOrder) as SalesVolume
from Article a
    inner join Article_order ao on a.ArticleId = ao.Article_ArticleId
    inner join CustOrder co on co.COID = ao.CustOrder_COID
GROUP BY to_char(co.DateOfOrder - 7/24,'IYYY'), to_char(co.DateOfOrder - 7/24,'IW')
order by to_char(co.DateOfOrder - 7/24,'IYYY'), to_char(co.DateOfOrder - 7/24,'IW');

PROMPT ******************************************
PROMPT --19) Rank the days of the week according to overal sales volume
SELECT to_char(co.DateOfOrder, 'fmDay') as Weekday, SUM(ao.quantity * ao.PriceAtDateOfOrder) as SalesVolume
from Article a
    inner join Article_order ao on a.ArticleId = ao.Article_ArticleId
    inner join CustOrder co on co.COID = ao.CustOrder_COID
GROUP BY to_char(co.DateOfOrder, 'fmDay')
order by SUM(ao.quantity * ao.PriceAtDateOfOrder) desc;