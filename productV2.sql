create database proj_sc3;
use proj_sc3;

CREATE TABLE IF NOT EXISTS Brand (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL UNIQUE CHECK (TRIM(name) <> ''),
    websiteUrl VARCHAR(40),
    isActive BOOLEAN NOT NULL,
    countryOfOrigin VARCHAR(80),
    createdOn DATETIME NOT NULL,
    updatedOn DATETIME NOT NULL,
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
    screenSizeInch DECIMAL(3,1),
    ramGb INT,
    storageGb INT,
    color VARCHAR(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    createdOn DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedOn DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (brand_id) REFERENCES Brand(id)
);
INSERT INTO Brand (name, websiteUrl, isActive, countryOfOrigin, createdOn, updatedOn) VALUES
('TechNova', 'https://www.technova.com', TRUE, 'USA', NOW(), NOW()),
('GadgetPro', NULL, TRUE, 'Germany', NOW(), NOW()),
('EcoWare', 'https://www.ecoware.org', FALSE, NULL, NOW(), NOW()),
('SmartAsia', 'https://smartasia.co', TRUE, 'South Korea', NOW(), NOW()),
('FutureTech', 'https://www.futuretech.io', TRUE, 'Japan', NOW(), NOW());

INSERT INTO products (
    brand_id, model, description, quantity, price, screenSizeInch, ramGb, storageGb, color
) VALUES
(1, 'NovaBook X1', 'High performance ultrabook.', 10, 45000, 13.3, 16, 512, 'Silver'),
(2, 'ProTab 10', '10-inch Android tablet.', 5, 12000, 10.1, 4, 64, 'Black'),
(3, 'EcoPhone Lite', 'Budget eco-friendly smartphone.', 15, 7500, NULL, 2, 32, 'Green'),
(4, 'SmartCam 4K', 'Smart security camera with 4K resolution.', 8, 8800, NULL, NULL, NULL, NULL),
(5, 'FutureGlass AR', 'Augmented reality smart glasses.', 2, 56000, NULL, 8, 128, 'Transparent'),
(1, 'TerV5', 'High performance ultrabook.', 10, 45000, 13.3, 16, 512, 'Silver');



update products set stock = 100 where id = 1;
select * from products;
select * from brand;
delete from products where id=5;
