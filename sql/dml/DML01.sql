CREATE IF NOT EXISTS SCHEMA Catalogs;

CREATE IF NOT EXISTS TABLE Catalogs.Catalogs
(
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100) NOT NULL
);

CREATE IF NOT EXISTS TABLE Catalogs.item
(
    id INT PRIMARY KEY, 
    value STRING NOT NULL,
    description VARCHAR(100),
    catalog_id INT NOT NULL,
    FOREIGN KEY (catalog_id) REFERENCES Catalogs.Catalogs(id)
);

INSERT INTO Catalogs.Catalogs (id, name, description) VALUES (1, 'Medidas de Peso', 'Medidas de Peso en sistema métrico e internacional');
INSERT INTO Catalogs.Catalogs (id, name, description) VALUES (2, 'Medidas de Longitud', 'Medidas de Longitud en sistema métrico');
INSERT INTO Catalogs.Catalogs (id, name, description) VALUES (3, 'Medidas de Volumen', 'Medidas de Volumen en sistema métrico');
INSERT INTO Catalogs.Catalogs (id, name, description) VALUES (4, 'Medidas de Tiempo', 'Medidas de Tiempo en sistema métrico');

INSERT INTO Catalogs.item (id, value, description, catalog_id) VALUES (1, 'Kilogramo', 'Unidad de medida de masa', 1);
INSERT INTO Catalogs.item (id, value, description, catalog_id) VALUES (2, 'Gramo', 'Unidad de medida de masa', 1);
INSERT INTO Catalogs.item (id, value, description, catalog_id) VALUES (3, 'Miligramo', 'Unidad de medida de masa', 1);
INSERT INTO Catalogs.item (id, value, description, catalog_id) VALUES (4, 'Libra', 'Unidad de medida de masa', 1);
INSERT INTO Catalogs.item (id, value, description, catalog_id) VALUES (5, 'Onza', 'Unidad de medida de masa', 1);
INSERT INTO Catalogs.item (id, value, description, catalog_id) VALUES (6, 'Tonelada', 'Unidad de medida de masa', 1);
INSERT INTO Catalogs.item (id, value, description, catalog_id) VALUES (7, 'Metro', 'Unidad de medida de longitud', 2);
INSERT INTO Catalogs.item (id, value, description, catalog_id) VALUES (8, 'Centimetro', 'Unidad de medida de longitud', 2);
INSERT INTO Catalogs.item (id, value, description, catalog_id) VALUES (9, 'Milimetro', 'Unidad de medida de longitud', 2);
INSERT INTO Catalogs.item (id, value, description, catalog_id) VALUES (10, 'Litro', 'Unidad de medida de volumen', 3);
INSERT INTO Catalogs.item (id, value, description, catalog_id) VALUES (11, 'Mililitro', 'Unidad de medida de volumen', 3);
INSERT INTO Catalogs.item (id, value, description, catalog_id) VALUES (12, 'Segundo', 'Unidad de medida de tiempo', 4);
INSERT INTO Catalogs.item (id, value, description, catalog_id) VALUES (13, 'Minuto', 'Unidad de medida de tiempo', 4);
INSERT INTO Catalogs.item (id, value, description, catalog_id) VALUES (14, 'Hora', 'Unidad de medida de tiempo', 4);
