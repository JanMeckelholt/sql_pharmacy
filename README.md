# SQL Pharmacy

SQL-database to store data of a pharmacy.

## Entities
Articles (subdivided in drugs an ointments)
Ingredients
Customers
Orders
Deliveries
DeliveryCompanies
Drawer
and Warehouses

The relationships are shown in two png-files (relations and logical model).

## How-To
1. Create tables with pharmacy_createDropTable.sql // Be carefull. This creates empty tables. You will lose all prior stored data.
2. Use the file pharmacy_populateData.sql to fill the tables with example data.
3. Use pharmacy_showEverything.sql to output all data.
4. Use pharmacy_queries.sql to perform example queries on the stored data.