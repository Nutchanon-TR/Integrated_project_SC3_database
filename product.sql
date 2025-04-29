create database proj_sc3;
use proj_sc3;
 CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL CHECK (CHAR_LENGTH(name) <= 60 AND name <> ''),
    description TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci CHECK (description IS NULL OR (CHAR_LENGTH(description) <= 400 AND description <> '')),
    stock INT(10) NOT NULL,
    price INT(10) NOT NULL,
    brand TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL CHECK (brand <> ''),
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);

INSERT INTO products (name, description, stock, price, brand)
VALUES (
  'iPhone 160 Pro Max plus plus ultra rare',
  'Plus Ultra Smash!!!',
  1000,
  34000900,
  'Ono for all'
);

update products set stock = 100 where id = 1;
select * from products;
