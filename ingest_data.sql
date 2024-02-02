-- Create table for sales_receipt
CREATE TABLE sales_receipt (
  "transaction_id" INTEGER NOT NULL,
  "transaction_date" DATE NOT NULL,
  "transaction_time" TIME NOT NULL,
  "sales_outlet_id" INTEGER NOT NULL,
  "staff_id" INTEGER NOT NULL,
  "customer_id" INTEGER NOT NULL,
  "instore_yn" BOOLEAN,
  "order" INTEGER NOT NULL,
  "line_item_id" INTEGER NOT NULL,
  "product_id" INTEGER NOT NULL,
  "quantity" INTEGER NOT NULL,
  "line_item_amount" DECIMAL(5, 2) NOT NULL,
  "unit_price" DECIMAL(5, 2) NOT NULL,
  "promo_item_yn" BOOLEAN NOT NULL
);

-- Create table for sales_outlet
CREATE TABLE sales_outlet (
  "sales_outlet_id" INTEGER NOT NULL,
  "sales_outlet_type" TEXT NOT NULL,
  "store_square_feet" INTEGER NOT NULL,
  "store_address" TEXT NOT NULL,
  "store_city" TEXT NOT NULL,
  "store_state_province" VARCHAR(2) NOT NULL,
  "store_telephone" VARCHAR(12) NOT NULL,
  "store_postal_code" SMALLINT NOT NULL,
  "store_longitude" REAL NOT NULL,
  "store_latitude" REAL NOT NULL,
  "manager" INTEGER,
  "neighorhood" TEXT NOT NULL
);

-- Create table for sales_target
CREATE TABLE sales_target (
  "sales_outlet_id" INTEGER NOT NULL,
  "year_month" TEXT NOT NULL,
  "beans_goal" SMALLINT NOT NULL,
  "beverage_goal" SMALLINT NOT NULL,
  "food_goal" SMALLINT NOT NULL,
  "merchandise_goal" SMALLINT NOT NULL,
  "total_goal" SMALLINT NOT NULL
);

-- Create table for customer
CREATE TYPE gender AS ENUM ('F', 'M', 'N');
CREATE TABLE customer (
  "customer_id" INTEGER NOT NULL,
  "home_store" TEXT NOT NULL,
  "customer_first-name" TEXT NOT NULL,
  "customer_email" TEXT NOT NULL,
  "customer_since" DATE NOT NULL,
  "loyalty_card_number" VARCHAR(12) NOT NULL,
  "birthdate" DATE NOT NULL,
  "gender" gender NOT NULL,
  "birth_year" SMALLINT NOT NULL
);

-- Create table for product
CREATE TABLE product (
  "product_id" INTEGER NOT NULL,
  "product_group" TEXT NOT NULL,
  "product_category" TEXT NOT NULL,
  "product_type" TEXT NOT NULL,
  "product" TEXT NOT NULL,
  "product_description" TEXT NOT NULL,
  "unit_of_measure" TEXT NOT NULL,
  "current_wholesale_price" DECIMAL(3, 1) NOT NULL,
  "current_retail_price" TEXT NOT NULL,
  "tax_exempt_yn" BOOLEAN NOT NULL,
  "promo_yn" BOOLEAN NOT NULL,
  "new_product_yn" BOOLEAN NOT NULL
);

-- Create table for staff
CREATE TABLE staff (
  "staff_id" INTEGER NOT NULL,
  "first_name" TEXT NOT NULL,
  "last_name" TEXT NOT NULL,
  "position" TEXT NOT NULL,
  "start_date" DATE NOT NULL,
  "location" TEXT NOT NULL
);

-- Create able for pastry_inventory
CREATE TABLE pastry_inventory (
  "sales_outlet_id" INTEGER NOT NULL,
  "transaction_date" DATE NOT NULL,
  "product_id" INTEGER NOT NULL,
  "start_of_day" INTEGER NOT NULL,
  "quantity_sold" INTEGER NOT NULL,
  "waste" INTEGER NOT NULL,
  "percent_waste" VARCHAR(3) NOT NULL
);

-- Ingest data into sales_receipt
\copy sales_receipt("transaction_id", "transaction_date", "transaction_time", "sales_outlet_id", "staff_id", "customer_id", "instore_yn", "order", "line_item_id", "product_id", "quantity", "line_item_amount", "unit_price", "promo_item_yn") from 'data/sales_receipt.csv' with csv header delimiter ',';
-- Ingest data into sales_outlet
\copy sales_outlet("sales_outlet_id", "sales_outlet_type", "store_square_feet", "store_address", "store_city", "store_state_province", "store_telephone", "store_postal_code", "store_longitude", "store_latitude", "manager", "neighorhood") from 'data/sales_outlet.csv' with csv header delimiter ',';
-- Ingest data into sales_target
\copy sales_target("sales_outlet_id", "year_month", "beans_goal", "beverage_goal", "food_goal", "merchandise_goal", "total_goal") from 'data/sales_target.csv' with csv header delimiter ',';
-- Ingest data into customer
\copy customer("customer_id", "home_store", "customer_first-name", "customer_email", "customer_since", "loyalty_card_number", "birthdate", "gender", "birth_year") from 'data/customer.csv' with csv header delimiter ',';
-- Ingest data into product
\copy product("product_id", "product_group", "product_category", "product_type", "product", "product_description", "unit_of_measure", "current_wholesale_price", "current_retail_price", "tax_exempt_yn", "promo_yn", "new_product_yn") from 'data/product.csv' with csv header delimiter ',';
-- Ingest data into staff
\copy staff("staff_id", "first_name", "last_name", "position", "start_date", "location") from 'data/staff.csv' with csv header delimiter ',';
-- Ingest data into pastry_inventory
\copy pastry_inventory("sales_outlet_id", "transaction_date", "product_id", "start_of_day", "quantity_sold", "waste", "percent_waste") from 'data/pastry_inventory.csv' with csv header delimiter ',';

