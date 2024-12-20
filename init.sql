CREATE DATABASE IF NOT EXISTS catalogs;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON catalogs.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;


CREATE TABLE IF NOT EXISTS  catalogs.catalogs
(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS catalogs.item
(
    id INT PRIMARY KEY, 
    value VARCHAR(200) NOT NULL,  -- Corrected from 2OO to 200
    description VARCHAR(100),
    catalog_id INT NOT NULL,
    FOREIGN KEY (catalog_id) REFERENCES catalogs.catalogs(id)
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);