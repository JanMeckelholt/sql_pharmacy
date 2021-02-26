--ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YY';
Delete from Warehouse;
Drop sequence warehouse_warehouseid_seq;
CREATE SEQUENCE warehouse_warehouseid_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER warehouse_warehouseid_trg BEFORE
    INSERT ON warehouse
    FOR EACH ROW
    WHEN ( new.warehouseid IS NULL )
BEGIN
    :new.warehouseid := warehouse_warehouseid_seq.nextval;
END;
/

Delete from Drawer_Ingredient;
Delete from Drawer_Article;
Delete from Drawer;
Drop sequence drawer_drawerid_seq;
CREATE SEQUENCE drawer_drawerid_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER drawer_drawerid_trg BEFORE
    INSERT ON drawer
    FOR EACH ROW
    WHEN ( new.drawerid IS NULL )
BEGIN
    :new.drawerid := drawer_drawerid_seq.nextval;
END;
/



define wh_name = 'Under Counter';
Insert into Warehouse (warehousename) values ('&wh_name');
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));

define wh_name = 'Behind Counter';
Insert into Warehouse (warehousename) values ('&wh_name');
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));


define wh_name = 'Storageroom';
Insert into Warehouse (warehousename) values ('&wh_name');
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));
Insert into Drawer (Warehouse_Warehouseid) values ((SELECT warehouseid from warehouse where WarehouseName='&wh_name'));


--------------------------
Delete from Oint_Ing;
Delete from Ingredient;
Drop sequence ingredient_ingredientid_seq;
CREATE SEQUENCE ingredient_ingredientid_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER ingredient_ingredient_trg BEFORE
    INSERT ON ingredient
    FOR EACH ROW
    WHEN ( new.ingredientid IS NULL )
BEGIN
    :new.ingredientid := ingredient_ingredientid_seq.nextval;
END;
/

define ing_name = 'Grease';
define ord_price = 1.4;
Insert into Ingredient (ingredientname, orderprice) values ('&ing_name', &ord_price);
Insert into Drawer_Ingredient (Drawer_DrawerId, Ingredient_IngredientId, Quantity, BestBeforeDate, CostsPerUnit) values (12, (SELECT ingredientid from ingredient where ingredientname='&ing_name'), 34, current_date + interval '65' day, &ord_price);

define ing_name = 'Camphor';
define ord_price = 2.3;
Insert into Ingredient (ingredientname, orderprice) values ('&ing_name', &ord_price);
Insert into Drawer_Ingredient (Drawer_DrawerId, Ingredient_IngredientId, Quantity, BestBeforeDate, CostsPerUnit) values (13, (SELECT ingredientid from ingredient where ingredientname='&ing_name'), 4, current_date + interval '65' day, &ord_price);

define ing_name = 'Zinc';
define ord_price = 1.2;
Insert into Ingredient (ingredientname, orderprice) values ('&ing_name', &ord_price);
Insert into Drawer_Ingredient (Drawer_DrawerId, Ingredient_IngredientId, Quantity, BestBeforeDate, CostsPerUnit) values (14, (SELECT ingredientid from ingredient where ingredientname='&ing_name'), 50, current_date + interval '65' day, &ord_price);

define ing_name = 'Paraffin';
define ord_price = 3;
Insert into Ingredient (ingredientname, orderprice) values ('&ing_name', &ord_price);
Insert into Drawer_Ingredient (Drawer_DrawerId, Ingredient_IngredientId, Quantity, BestBeforeDate, CostsPerUnit) values (14, (SELECT ingredientid from ingredient where ingredientname='&ing_name'), 43, current_date + interval '65' day, &ord_price);


define ing_name = 'Liquid Ibuprofen';
define ord_price = 2;
Insert into Ingredient (ingredientname, orderprice) values ('&ing_name', &ord_price);
Insert into Drawer_Ingredient (Drawer_DrawerId, Ingredient_IngredientId, Quantity, BestBeforeDate, CostsPerUnit) values (11, (SELECT ingredientid from ingredient where ingredientname='&ing_name'), 7, current_date + interval '65' day, &ord_price);


define ing_name = 'Liquid Felbinac';
define ord_price = 4;
Insert into Ingredient (ingredientname, orderprice) values ('&ing_name', &ord_price);
Insert into Drawer_Ingredient (Drawer_DrawerId, Ingredient_IngredientId, Quantity, BestBeforeDate, CostsPerUnit) values (15, (SELECT ingredientid from ingredient where ingredientname='&ing_name'), 8, current_date + interval '65' day, &ord_price);


define ing_name = 'Liquid Flufenamin';
define ord_price = 5;
Insert into Ingredient (ingredientname, orderprice) values ('&ing_name', &ord_price);
Insert into Drawer_Ingredient (Drawer_DrawerId, Ingredient_IngredientId, Quantity, BestBeforeDate, CostsPerUnit) values (16, (SELECT ingredientid from ingredient where ingredientname='&ing_name'), 10, current_date + interval '65' day, &ord_price);


--------------------------

Delete from Article;
Drop sequence article_articleid_seq;
CREATE SEQUENCE article_articleid_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER article_articleid_trg BEFORE
    INSERT ON article
    FOR EACH ROW
    WHEN ( new.articleid IS NULL )
BEGIN
    :new.articleid := article_articleid_seq.nextval;
END;
/

define art_category = 'PainKiller'
define art_name = 'Aspirin';
define art_price = 3.50;
define ord_price = 2.50;
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 200);
Insert into Drug (articleid, orderprice) values ((SELECT articleid from article where articlename='&art_name'), &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (1, (SELECT articleid from article where articlename='&art_name'), 19, current_date + interval '10' day, &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (5, (SELECT articleid from article where articlename='&art_name'), 50, current_date + interval '5' month + interval '10' day, &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (20, (SELECT articleid from article where articlename='&art_name'), 150, current_date + interval '5' month + interval '1' day, &ord_price);

define art_name = 'Paracetamol';
define art_price = 8.99;
define ord_price = 2.50;
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 250);
Insert into Drug (articleid, orderprice) values ((SELECT articleid from article where articlename='&art_name'), &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (2, (SELECT articleid from article where articlename='&art_name'), 100, current_date + interval '5' day, &ord_price);

define art_name = 'Ibuprofen';
define art_price = 5.99;
define ord_price = 4.00;
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 200);
Insert into Drug (articleid, orderprice) values ((SELECT articleid from article where articlename='&art_name'), &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (3, (SELECT articleid from article where articlename='&art_name'), 50, current_date + interval '20' day, &ord_price);

define art_name = 'Diclofenac';
define art_price = 2.9;
define ord_price = 1.00;
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 100);
Insert into Drug (articleid, orderprice) values ((SELECT articleid from article where articlename='&art_name'), &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (3, (SELECT articleid from article where articlename='&art_name'), 15, current_date + interval '12' day, &ord_price);

define art_name = 'Piroxicam';
define art_price = 5.9;
define ord_price = 3.00;
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 10);
Insert into Drug (articleid, orderprice) values ((SELECT articleid from article where articlename='&art_name'), &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (5, (SELECT articleid from article where articlename='&art_name'), 190, current_date + interval '11' month, &ord_price);

define art_category = 'NonMedical'
define art_name = 'Bandaid';
define art_price = 3.50;
define ord_price = 1.00;
define old_ord_price = 0.70;
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 10);
Insert into Drug (articleid, orderprice) values ((SELECT articleid from article where articlename='&art_name'), &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (6, (SELECT articleid from article where articlename='&art_name'), 13, current_date + interval '15' month, &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (20, (SELECT articleid from article where articlename='&art_name'), 50, current_date + interval '5' month, &old_ord_price);

define art_name = 'Tissue';
define art_price = 1.99;
define ord_price = 0.50;
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 10);
Insert into Drug (articleid, orderprice) values ((SELECT articleid from article where articlename='&art_name'), &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (7, (SELECT articleid from article where articlename='&art_name'), 20, current_date + interval '15' month, &ord_price);

define art_name = 'DextroEnergy';
define art_price = 2.99;
define ord_price = 0.50;
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 10);
Insert into Drug (articleid, orderprice) values ((SELECT articleid from article where articlename='&art_name'), &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (8, (SELECT articleid from article where articlename='&art_name'), 19, current_date + interval '10' day, &ord_price);

define art_name = 'Mutlivitamin ABC';
define art_price = 1.99;
define ord_price = 0.50;
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 40);
Insert into Drug (articleid, orderprice) values ((SELECT articleid from article where articlename='&art_name'), &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (8, (SELECT articleid from article where articlename='&art_name'), 10, current_date + interval '50' day, &ord_price);

define art_name = 'Mutlivitamin Deluxe';
define art_price = 6.99;
define ord_price = 0.50;
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 30);
Insert into Drug (articleid, orderprice) values ((SELECT articleid from article where articlename='&art_name'), &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (8, (SELECT articleid from article where articlename='&art_name'), 180, current_date + interval '10' day, &ord_price);

define art_category = 'Diabetis'
define art_name = 'Insulin';
define art_price = 20.99;
define ord_price = 13.50;
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 30);
Insert into Drug (articleid, orderprice) values ((SELECT articleid from article where articlename='&art_name'), &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (10, (SELECT articleid from article where articlename='&art_name'), 15, current_date + interval '10' day, &ord_price);

define art_name = 'ACCU-Chek';
define art_price = 23.99;
define ord_price = 13.50;
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 10);
Insert into Drug (articleid, orderprice) values ((SELECT articleid from article where articlename='&art_name'), &ord_price);
--NO STOCK: Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (10, (SELECT articleid from article where articlename='&art_name'), 75, current_date + interval '12' day, &ord_price);

define art_name = 'GlucoCheck Adv';
define art_price = 19.35;
define ord_price = 11.50;
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 40);
Insert into Drug (articleid, orderprice) values ((SELECT articleid from article where articlename='&art_name'), &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (11, (SELECT articleid from article where articlename='&art_name'), 19, current_date + interval '4' month, &ord_price);

define art_name = 'OneTouch Select Plus';
define art_price = 12.99;
define ord_price = 8.00;
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 50);
Insert into Drug (articleid, orderprice) values ((SELECT articleid from article where articlename='&art_name'), &ord_price);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (11, (SELECT articleid from article where articlename='&art_name'), 34, current_date + interval '65' day, &ord_price);

define art_category = 'Lubrication'
define art_name = 'Homemade special Ointment 87';
define art_price = 25.00;
define oint_recipe = 'Book of great ointments vol 1 - Chapter 4';
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 50);
define art_id = (select articleId from Article where ArticleName='&art_name');
Insert into Ointment (articleid, recipe) values (&art_id, '&oint_recipe');
Insert into Oint_Ing (Ingredient_IngredientId, Ointment_ArticleId, Quantity) values ((SELECT ingredientid from ingredient where ingredientname='Grease'), &art_id, 0.3);
Insert into Oint_Ing (Ingredient_IngredientId, Ointment_ArticleId, Quantity) values ((SELECT ingredientid from ingredient where ingredientname='Paraffin'), &art_id, 1.3);
Insert into Oint_Ing (Ingredient_IngredientId, Ointment_ArticleId, Quantity) values ((SELECT ingredientid from ingredient where ingredientname='Zinc'), &art_id, 1.3);
define first_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id);
define second_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id and Ingredient_IngredientId not in (&first_ing));
define third_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id and Ingredient_IngredientId not in (&first_ing, &second_ing));
define costsperunit = (select orderprice from ingredient where ingredientId=&first_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&first_ing and ointment_articleId=&art_id) + (select orderprice from ingredient where ingredientId=&second_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&second_ing and ointment_articleId=&art_id) + (select orderprice from ingredient where ingredientId=&third_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&third_ing and ointment_articleId=&art_id);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (11, &art_id, 34, current_date + interval '65' day, &costsperunit);

define art_name = 'Grease No 3';
define art_price = 12.00;
define oint_recipe = 'Grease Recipies 2009';
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 50);
define art_id = (select articleId from Article where ArticleName='&art_name');
Insert into Ointment (articleid, recipe) values (&art_id, '&oint_recipe');
Insert into Oint_Ing (Ingredient_IngredientId, Ointment_ArticleId, Quantity) values ((SELECT ingredientid from ingredient where ingredientname='Grease'), &art_id, 0.3);
Insert into Oint_Ing (Ingredient_IngredientId, Ointment_ArticleId, Quantity) values ((SELECT ingredientid from ingredient where ingredientname='Camphor'), &art_id, 2.3);
Insert into Oint_Ing (Ingredient_IngredientId, Ointment_ArticleId, Quantity) values ((SELECT ingredientid from ingredient where ingredientname='Zinc'), &art_id, 1.0);
define first_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id);
define second_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id and Ingredient_IngredientId not in (&first_ing));
define third_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id and Ingredient_IngredientId not in (&first_ing, &second_ing));
define costsperunit = (select orderprice from ingredient where ingredientId=&first_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&first_ing and ointment_articleId=&art_id) + (select orderprice from ingredient where ingredientId=&second_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&second_ing and ointment_articleId=&art_id) + (select orderprice from ingredient where ingredientId=&third_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&third_ing and ointment_articleId=&art_id);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (13, &art_id, 34, current_date + interval '25' day, &costsperunit);



define art_category = 'Painrelease Ointment'
define art_name = 'Painfree ABC';
define art_price = 16.00;
define oint_recipe = 'Book of great ointment vol 1 - Chapter 10';
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 50);
define art_id = (select articleId from Article where ArticleName='&art_name');
Insert into Ointment (articleid, recipe) values (&art_id, '&oint_recipe');
Insert into Oint_Ing (Ingredient_IngredientId, Ointment_ArticleId, Quantity) values ((SELECT ingredientid from ingredient where ingredientname='Grease'), &art_id, 0.3);
Insert into Oint_Ing (Ingredient_IngredientId, Ointment_ArticleId, Quantity) values ((SELECT ingredientid from ingredient where ingredientname='Liquid Felbinac'), &art_id, 2.3);
Insert into Oint_Ing (Ingredient_IngredientId, Ointment_ArticleId, Quantity) values ((SELECT ingredientid from ingredient where ingredientname='Zinc'), &art_id, 1.0);
define first_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id);
define second_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id and Ingredient_IngredientId not in (&first_ing));
define third_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id and Ingredient_IngredientId not in (&first_ing, &second_ing));
define costsperunit = (select orderprice from ingredient where ingredientId=&first_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&first_ing and ointment_articleId=&art_id) + (select orderprice from ingredient where ingredientId=&second_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&second_ing and ointment_articleId=&art_id) + (select orderprice from ingredient where ingredientId=&third_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&third_ing and ointment_articleId=&art_id);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (13, &art_id, 4, current_date + interval '15' day, &costsperunit);


define art_name = 'Bulletproof';
define art_price = 14.00;
define oint_recipe = 'Book of great ointment vol 1 - Chapter 10';
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 10);
define art_id = (select articleId from Article where ArticleName='&art_name');
Insert into Ointment (articleid, recipe) values (&art_id, '&oint_recipe');
Insert into Oint_Ing (Ingredient_IngredientId, Ointment_ArticleId, Quantity) values ((SELECT ingredientid from ingredient where ingredientname='Grease'), &art_id, 0.5);
Insert into Oint_Ing (Ingredient_IngredientId, Ointment_ArticleId, Quantity) values ((SELECT ingredientid from ingredient where ingredientname='Liquid Flufenamin'), &art_id, 1.3);
define first_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id);
define second_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id and Ingredient_IngredientId not in (&first_ing));
define costsperunit = (select orderprice from ingredient where ingredientId=&first_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&first_ing and ointment_articleId=&art_id) + (select orderprice from ingredient where ingredientId=&second_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&second_ing and ointment_articleId=&art_id);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (13, &art_id, 12, current_date + interval '8' day, &costsperunit);



define art_name = 'FeelGood 101';
define art_price = 12.00;
define oint_recipe = 'Book of great ointments vol 1 - Chapter 12';
Insert into Article (articlename, salesprice, articlecategory, minstock) values ('&art_name', &art_price, '&art_category', 10);
define art_id = (select articleId from Article where ArticleName='&art_name');
Insert into Ointment (articleid, recipe) values (&art_id, '&oint_recipe');
Insert into Oint_Ing (Ingredient_IngredientId, Ointment_ArticleId, Quantity) values ((SELECT ingredientid from ingredient where ingredientname='Grease'), &art_id, 0.3);
Insert into Oint_Ing (Ingredient_IngredientId, Ointment_ArticleId, Quantity) values ((SELECT ingredientid from ingredient where ingredientname='Liquid Ibuprofen'), &art_id, 2.3);
Insert into Oint_Ing (Ingredient_IngredientId, Ointment_ArticleId, Quantity) values ((SELECT ingredientid from ingredient where ingredientname='Camphor'), &art_id, 5);
define first_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id);
define second_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id and Ingredient_IngredientId not in (&first_ing));
define third_ing = (select min(Ingredient_IngredientId) from Oint_ing where Ointment_ArticleId=&art_id and Ingredient_IngredientId not in (&first_ing, &second_ing));
define costsperunit = (select orderprice from ingredient where ingredientId=&first_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&first_ing and ointment_articleId=&art_id) + (select orderprice from ingredient where ingredientId=&second_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&second_ing and ointment_articleId=&art_id) + (select orderprice from ingredient where ingredientId=&third_ing)*(select quantity from oint_ing where Ingredient_ingredientId=&third_ing and ointment_articleId=&art_id);
Insert into Drawer_Article (Drawer_DrawerId, Article_ArticleId, Quantity, BestBeforeDate, CostsPerUnit) values (13, &art_id, 15, current_date + interval '3' day, &costsperunit);

--------------------------


Delete from Customer;
Drop sequence customer_customerid_seq;
CREATE SEQUENCE customer_customerid_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER customer_customerid_trg BEFORE
    INSERT ON customer
    FOR EACH ROW
    WHEN ( new.customerid IS NULL )
BEGIN
    :new.customerid := customer_customerid_seq.nextval;
END;
/

Insert into Customer (customername, customeradress) values ('anonym', 'Anonymer Kauf in Apotheke');
Insert into Customer (customername, customeradress) values ('Peter Meier', 'Unter den Linden 2, Berlin');
Insert into Customer (customername, customeradress) values ('Anne Fischer', 'Einbahnstrasse 4, Hamburg');
Insert into Customer (customername, customeradress) values ('Maria Schuster', 'Hauptstrasse 1, Hamburg');
Insert into Customer (customername, customeradress) values ('Bobby Fischer', 'Nebenstrasse 15, Hamburg');
Insert into Customer (customername, customeradress) values ('Peter Struwel', 'Platanenallee 3, Hamburg');

--------------------------




Delete from DeliveryCompany;
Drop sequence deliverCompany_DCid_seq;
CREATE SEQUENCE deliverCompany_DCid_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER deliverCompany_DCid_trg BEFORE
    INSERT ON DeliveryCompany
    FOR EACH ROW
    WHEN ( new.DCid IS NULL )
BEGIN
    :new.DCid := deliverCompany_DCid_seq.nextval;
END;
/

Insert into DeliveryCompany (DCname) values ('UPS');
Insert into DeliveryCompany (DCname) values ('DHL');
Insert into DeliveryCompany (DCname) values ('DPD');
Insert into DeliveryCompany (DCname) values ('BW Post');
Insert into DeliveryCompany (DCname) values ('ABC Kurier');




--------------------------

Delete from CustOrder;
Drop sequence CustOrder_COid_seq;
CREATE SEQUENCE CustOrder_COid_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER CustOrder_COid_trg BEFORE
    INSERT ON CustOrder
    FOR EACH ROW
    WHEN ( new.COid IS NULL )
BEGIN
    :new.COid := CustOrder_COid_seq.nextval;
END;
/



Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (2, current_date - interval '1' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (2, current_date - interval '10' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (3, current_date - interval '30' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (4, current_date - interval '2' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (5, current_date - interval '3' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (6, current_date - interval '2' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (5, current_date - interval '40' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (2, current_date - interval '35' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (3, current_date - interval '20' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (4, current_date - interval '3' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (5, current_date - interval '23' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (5, current_date - interval '24' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (5, current_date - interval '25' day);

Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (1, current_date - interval '25' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (1, current_date - interval '25' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (1, current_date - interval '20' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (1, current_date - interval '3' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (1, current_date - interval '4' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (1, current_date - interval '5' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (1, current_date - interval '4' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (1, current_date - interval '5' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (1, current_date - interval '20' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (1, current_date - interval '10' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (1, current_date - interval '1' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (1, current_date - interval '22' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (1, current_date - interval '17' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (1, current_date - interval '14' day);
Insert into CustOrder (Customer_CustomerId, DateOfOrder) values (1, current_date - interval '11' day);
--------------------------


Delete from Delivery;
Drop sequence delivery_deliveryid_seq;
CREATE SEQUENCE delivery_deliveryid_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER delivery_deliveryid_trg BEFORE
    INSERT ON Delivery
    FOR EACH ROW
    WHEN ( new.deliveryId IS NULL )
BEGIN
    :new.deliveryId := delivery_deliveryid_seq.nextval;
END;
/

define coid = 1;
define cid = 2;
define doa = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '1' day;
define dof = Null;
Insert into Delivery (DateOfAssignment, DateOfFulfillment, DeliveryCompany_DCID, CustOrder_COID) values (&doa, &dof, 1, &coid);

define coid = 2;
define cid = 2;
define doa = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '0' day;
define dof = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '1' day;
Insert into Delivery (DateOfAssignment, DateOfFulfillment, DeliveryCompany_DCID, CustOrder_COID) values (&doa, &dof, 1, &coid);

define coid = 3;
define cid = 3;
define doa = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '1' day;
define dof = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '1' day;
Insert into Delivery (DateOfAssignment, DateOfFulfillment, DeliveryCompany_DCID, CustOrder_COID) values (&doa, &dof, 2, &coid);

define coid = 4;
define cid = 4;
define doa = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '0' day;
define dof = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '0' day;
Insert into Delivery (DateOfAssignment, DateOfFulfillment, DeliveryCompany_DCID, CustOrder_COID) values (&doa, &dof, 1, &coid);

define coid = 5;
define cid = 5;
define doa = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '0' day;
define dof = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '5' day;
Insert into Delivery (DateOfAssignment, DateOfFulfillment, DeliveryCompany_DCID, CustOrder_COID) values (&doa, &dof, 2, &coid);

define coid = 7;
define cid = 5;
define doa = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '0' day;
define dof = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '1' day;
Insert into Delivery (DateOfAssignment, DateOfFulfillment, DeliveryCompany_DCID, CustOrder_COID) values (&doa, &dof, 2, &coid);
define coid = 11;
define cid = 5;
define doa = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '0' day;
define dof = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '3' day;
Insert into Delivery (DateOfAssignment, DateOfFulfillment, DeliveryCompany_DCID, CustOrder_COID) values (&doa, &dof, 2, &coid);
define coid = 12;
define cid = 5;
define doa = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '0' day;
define dof = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '10' day;
Insert into Delivery (DateOfAssignment, DateOfFulfillment, DeliveryCompany_DCID, CustOrder_COID) values (&doa, &dof, 3, &coid);
define coid = 13;
define cid = 5;
define doa = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '0' day;
define dof = (select DateOfOrder from CustOrder where COID=&coid and Customer_CustomerID=&cid) + interval '10' day;
Insert into Delivery (DateOfAssignment, DateOfFulfillment, DeliveryCompany_DCID, CustOrder_COID) values (&doa, &dof, 3, &coid);

--------------------------




Delete from Article_Order;
define art_id=1
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (1, &art_id, 10, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=19
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (2, &art_id, 3, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=2
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (3, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=18
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (4, &art_id, 10, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=3
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (5, &art_id, 14, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=17
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (6, &art_id, 1, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=4
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (7, &art_id, 9, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=16
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (8, &art_id, 10, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=5
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (9, &art_id, 5, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=15
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (10, &art_id, 1, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=1
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (11, &art_id, 1, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=2
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (12, &art_id, 1, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=3
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (13, &art_id, 5, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=10
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (13, &art_id, 6, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=11
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (13, &art_id, 10, (select SalesPrice from Article where ArticleId=&art_id));

define art_id=3
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (12, &art_id, 1, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=18
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (11, &art_id, 3, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=3
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (11, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=17
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (11, &art_id, 10, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=4
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (10, &art_id, 14, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=16
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (10, &art_id, 1, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=5
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (1, &art_id, 9, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=15
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (2, &art_id, 10, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=6
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (3, &art_id, 5, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=14
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (4, &art_id, 1, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=2
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (5, &art_id, 5, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=3
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (6, &art_id, 1, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=4
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (1, &art_id, 5, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=11
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (2, &art_id, 6, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=12
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (3, &art_id, 10, (select SalesPrice from Article where ArticleId=&art_id));

define art_id=1
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (4, &art_id, 10, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (5, &art_id, 15, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (6, &art_id, 11, (select SalesPrice from Article where ArticleId=&art_id));

define art_id=1
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (27, &art_id, 10, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (18, &art_id, 1, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (26, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=19
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (27, &art_id, 3, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (26, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=2
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (26, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (27, &art_id, 13, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (24, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (23, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=18
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (25, &art_id, 10, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (18, &art_id, 1, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (26, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=3
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (24, &art_id, 14, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=17
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (23, &art_id, 1, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (14, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=4
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (22, &art_id, 9, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=16
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (21, &art_id, 10, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=5
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (20, &art_id, 5, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (21, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (22, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (23, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (24, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (25, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (26, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=15
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (19, &art_id, 1, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=4
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (18, &art_id, 1, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=2
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (17, &art_id, 1, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (18, &art_id, 1, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=3
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (16, &art_id, 5, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (26, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=10
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (15, &art_id, 6, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (26, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));
define art_id=11
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (14, &art_id, 10, (select SalesPrice from Article where ArticleId=&art_id));
Insert into Article_order (CustOrder_COID, Article_ArticleId, Quantity, PriceAtDateOfOrder) values (26, &art_id, 4, (select SalesPrice from Article where ArticleId=&art_id));