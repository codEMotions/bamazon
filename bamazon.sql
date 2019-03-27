
-- Drops the database if it already exists:--
DROP DATABASE IF EXISTS bamazon_db;

-- However, if it doesn't already exist then this query will create it: --
CREATE DATABASE bamazon_db;

-- Making a reference to which database the subsequent code will be made for --
USE bamazon_db;

--Now creating a table for all the products that will be listed in the database --

CREATE TABLE products (

    item_id INTEGER (10) AUTO_INCREMENT NOT NULL,
    
    product_name VARCHAR (30) NOT NULL,

    product_description VARCHAR (30) NULL,  -- try to put empty strings into the description if there 

    department_name VARCHAR (30) NOT NULL,

    price NUMBER (10, 2) NOT NULL,

    stock_quantity INTEGER (10) NOT NULL,

    PRIMARY KEY (item_id)  -- if you wanted to create multiple tables you can link the two ids together --

);

-- Creating 10 different products that will be put into the "products" table --

INSERT INTO products (product_name, product_description, department_name, price, stock_quantity)
VALUES ("Kibble Nibbles: Peanut Butter and Bacon Bits", "Treats for dogs", "Pet Supplies", 6.99, 1055), (), (), (), (), (), (), (),(), ();


-- You can create different products under values keyword with a list of parenthetical descriptions separated by commas, instead of repeating the keywords like the list below --

INSERT INTO products (product_name, product_description, department_name, price, stock_quantity)
VALUES ();

INSERT INTO products (product_name, product_description, department_name, price, stock_quantity)
VALUES ();

INSERT INTO products (product_name, product_description, department_name, price, stock_quantity)
VALUES ();

INSERT INTO products (product_name, product_description, department_name, price, stock_quantity)
VALUES ();

INSERT INTO products (product_name, product_description, department_name, price, stock_quantity)
VALUES ();

INSERT INTO products (product_name, product_description, department_name, price, stock_quantity)
VALUES ();

INSERT INTO products (product_name, product_description, department_name, price, stock_quantity)
VALUES ();

INSERT INTO products (product_name, product_description, department_name, price, stock_quantity)
VALUES ();

INSERT INTO products (product_name, product_description, department_name, price, stock_quantity)
VALUES ();