
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

    product_description VARCHAR (30) NULL,  

    department_name VARCHAR (30) NOT NULL,

    price NUMBER (10, 2) NOT NULL,

    stock_quantity INTEGER (10) NOT NULL,

    PRIMARY KEY (item_id) 

);

-- Creating 10 different products that will be put into the "products" table --

INSERT INTO products (product_name, product_description, department_name, price, stock_quantity)

-- the INSERT INTO SQL method only needed to be coded once with each respective product (or value) separated by commas --

VALUES ("Kibble Nibbles: Peanut Butter and Bacon Bits", "Treats for dogs", "Pet Supplies", 6.99, 27), 
("Air Gordans XXIV Basketball Shoes", "Latest edition of NBA Superstar Gordon Lightfoot's signature line of basketball shoes", "Clothing", 129.99, 20), 
("Levine Jeans", "Classic jeans for men and women", "Clothing", 23.99, 201), 
("Baleigh BMX Bike", "Dirt-racing 10-gear bike", "Sports", 249.99, 8), 
("Whilmerson Volleyball", "Official regulation volleyball", "Sports", 21.99, 56), 
("Hansel's 6-Pack Brief Underwear", "Underwear for men and women", "Clothing", 12.99, 100), 
("To Grill a Mockingbird (Paperback Book)", "Survival Cookbook by Harper Lee Jr.", "Books", 8.99, 300),
("NootroBullet Blender", "Blender for fruits, vegetables, and nootropics", "Home Appliances", 29.99, 89),
("Wooden Spatula", "Cooking utensil", "Home Appliances", 3.99, 5000), 
("Samsonite Wireless Headphones", " ", "Technology", 64.99, 120);

-- product_description column listed as NULL, so no description was given for the Samsonite Wireless Headphone product --