create database proj_sc3;
use proj_sc3;
drop table products;
drop table brand;
CREATE TABLE IF NOT EXISTS Brand (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL UNIQUE CHECK (TRIM(name) <> ''),
    webSiteUrl VARCHAR(40),
    isActive BOOLEAN NOT NULL,
    countryOfOrigin VARCHAR(80),
    createdOn DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedOn DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CHECK (websiteUrl IS NULL OR TRIM(websiteUrl) <> ''),
    CHECK (countryOfOrigin IS NULL OR TRIM(countryOfOrigin) <> '')
);

CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    brand_id INT NOT NULL,
    model VARCHAR(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL CHECK (TRIM(model) <> ''),
    description TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL CHECK (TRIM(description) <> ''),
    quantity INT NOT NULL DEFAULT 1,
    price INT NOT NULL,
    screenSizeInch DECIMAL(4,2),
    ramGb INT,
    storageGb INT,
    color VARCHAR(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    createdOn DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedOn DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (brand_id) REFERENCES Brand(id)
);




update products set stock = 100 where id = 1;
select * from products where id=16;
select * from brand;
update products set color = null where id = 16;
delete from products where id=5;
