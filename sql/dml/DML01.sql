CREATE DATABASE IF NOT EXISTS catalogs;
CREATE TABLE IF NOT EXISTS catalogs.catalogs (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(100) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

SELECT * FROM catalogs.catalogs;

DROP TABLE IF EXISTS catalogs.items;
CREATE TABLE IF NOT EXISTS catalogs.item (
    id INT PRIMARY KEY, 
    value VARCHAR(200) NOT NULL,
    description VARCHAR(100),
    catalog_id INT NOT NULL,
    item_id INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (catalog_id) REFERENCES catalogs.catalogs(id),
    FOREIGN KEY (item_id) REFERENCES catalogs.item(id)
);

SELECT * FROM catalogs.item;


INSERT INTO catalogs.catalogs (id, name, description) VALUES (1, 'Medidas de Peso', 'Medidas de Peso en sistema métrico e internacional');
INSERT INTO catalogs.catalogs (id, name, description) VALUES (2, 'Medidas de Longitud', 'Medidas de Longitud en sistema métrico');
INSERT INTO catalogs.catalogs (id, name, description) VALUES (3, 'Medidas de Volumen', 'Medidas de Volumen en sistema métrico');
INSERT INTO catalogs.catalogs (id, name, description) VALUES (4, 'Medidas de Tiempo', 'Medidas de Tiempo en sistema métrico');
INSERT INTO catalogs.catalogs (id, name, description) VALUES (5, 'Genero', 'Generos de personas');
INSERT INTO catalogs.catalogs (id, name, description) VALUES (6, 'Estado Civil', 'Estados civiles de personas');
INSERT INTO catalogs.catalogs (id, name, description) VALUES (7, 'Departamentos', 'Departamentos de Guatemala');
INSERT INTO catalogs.catalogs (id, name, description) VALUES (8, 'Municipios', 'Municipios de Guatemala');
INSERT INTO catalogs.catalogs (id, name, description) VALUES (9, 'Tipos de Cliente', 'Tipos de Cliente Entidad Financiera');
INSERT INTO catalogs.catalogs (id, name, description) VALUES (10, 'Tipos de Productos Farmaceuticos', 'Tipos de Productos Farmaceuticos');
INSERT INTO catalogs.catalogs (id, name, description) VALUES (11, 'Tipos de Cuentas', 'Tipos de Cuentas Bancarias');




INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (1, 'Kilogramo', 'Unidad de medida de masa', 1);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (2, 'Gramo', 'Unidad de medida de masa', 1);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (3, 'Miligramo', 'Unidad de medida de masa', 1);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (4, 'Libra', 'Unidad de medida de masa', 1);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (5, 'Onza', 'Unidad de medida de masa', 1);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (6, 'Tonelada', 'Unidad de medida de masa', 1);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (7, 'Metro', 'Unidad de medida de longitud', 2);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (8, 'Centimetro', 'Unidad de medida de longitud', 2);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (9, 'Milimetro', 'Unidad de medida de longitud', 2);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (10, 'Litro', 'Unidad de medida de volumen', 3);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (11, 'Mililitro', 'Unidad de medida de volumen', 3);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (12, 'Segundo', 'Unidad de medida de tiempo', 4);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (13, 'Minuto', 'Unidad de medida de tiempo', 4);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (14, 'Hora', 'Unidad de medida de tiempo', 4);

INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (15, 'Masculino', 'Genero Masculino', 5);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (16, 'Femenino', 'Genero Femenino', 5);

INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (17, 'Soltero', 'Estado Civil Soltero', 6);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (18, 'Casado', 'Estado Civil Casado', 6);

INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (19, 'Guatemala', 'Departamento de Guatemala', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (20, 'Sacatepéquez', 'Departamento de Sacatepéquez', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (21, 'Chimaltenango', 'Departamento de Chimaltenango', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (22, 'Escuintla', 'Departamento de Escuintla', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (23, 'Santa Rosa', 'Departamento de Santa Rosa', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (24, 'Solola', 'Departamento de Solola', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (25, 'Totonicapan', 'Departamento de Totonicapan', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (26, 'Quetzaltenango', 'Departamento de Quetzaltenango', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (27, 'Suchitepéquez', 'Departamento de Suchitepéquez', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (28, 'Retalhuleu', 'Departamento de Retalhuleu', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (29, 'San Marcos', 'Departamento de San Marcos', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (30, 'Huehuetenango', 'Departamento de Huehuetenango', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (31, 'Quiche', 'Departamento de Quiche', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (32, 'Baja Verapaz', 'Departamento de Baja Verapaz', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (33, 'Alta Verapaz', 'Departamento de Alta Verapaz', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (34, 'Petén', 'Departamento de Petén', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (35, 'Izabal', 'Departamento de Izabal', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (36, 'Zacapa', 'Departamento de Zacapa', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (37, 'Chiquimula', 'Departamento de Chiquimula', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (38, 'Jalapa', 'Departamento de Jalapa', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (39, 'Jutiapa', 'Departamento de Jutiapa', 7);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (74, 'El Progreso', 'Departamento de El Progreso', 7);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (40, 'Guatemala', 'Municipio de Guatemala', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (41, 'Mixco', 'Municipio de Mixco', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (42, 'Villa Nueva', 'Municipio de Villa Nueva', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (44, 'San Miguel Petapa', 'Municipio de San Miguel Petapa', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (45, 'San Pedro Sacatepéquez', 'Municipio de San Pedro Sacatepéquez', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (46, 'Chinautla', 'Municipio de Chinautla', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (47, 'Villa Canales', 'Municipio de Villa Canales', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (48, 'Amatitlán', 'Municipio de Amatitlán', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (49, 'Palencia', 'Municipio de Palencia', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (50, 'San Jose del Golfo', 'Municipio de San Jose del Golfo', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (51, 'San Jose Pinula', 'Municipio de San Jose Pinula', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (52, 'San Juan Sacatepequez', 'Municipio de San Juan Sacatepequez', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (53, 'San Raymundo', 'Municipio de San Raymundo', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (54, 'Santa Catarina Pinula', 'Municipio de Santa Catarina Pinula', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (55, 'San Pedro Ayampuc', 'Municipio de San Pedro Ayampuc', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (56, 'Chuarrancho', 'Municipio de Chuarrancho', 8, 19);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (57, 'Fraijanes', 'Municipio de Fraijanes', 8, 19);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (58, 'Antigua Guatemala', 'Municipio de Antigua Guatemala', 8, 20);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (59, 'Jocotenango', 'Municipio de Jocotenango', 8, 20);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (60, 'Magdalena Milpas Altas', 'Municipio de Magdalena Milpas Altas', 8, 20);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (61, 'Pastores', 'Municipio de Pastores', 8, 20);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (62, 'San Antonio Aguas Calientes', 'Municipio de San Antonio Aguas Calientes', 8, 20);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (63, 'San Bartolomé Milpas Altas', 'Municipio de San Bartolomé Milpas Altas', 8, 20);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (64, 'San Lucas Sacatepequez', 'Municipio de San Lucas Sacatepequez', 8, 20);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (65, 'San Miguel Dueñas', 'Municipio de San Miguel Dueñas', 8, 20);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (66, 'Santa Catarina Barahona', 'Municipio de Santa Catarina Barahona', 8, 20);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (67, 'Santa Lucía Milpas Altas', 'Municipio de Santa Lucía Milpas Altas', 8, 20);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (68, 'Santa María de Jesús', 'Municipio de Santa María de Jesús', 8, 20);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (69, 'Santiago Sacatepequez', 'Municipio de Santiago Sacatepequez', 8, 20);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (70, 'Sumpango', 'Municipio de Sumpango', 8, 20);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (71, 'Santo Domingo Xenacoj', 'Municipio de Santo Domingo Xenacoj', 8, 20);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (72, 'Alotenango', 'Municipio de Alotenango', 8, 20);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (73, 'Ciudad Vieja', 'Municipio de Alotenango', 8, 20);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (76, 'San Juan Comalapa', 'Municipio de San Juan Comalapa', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (77, 'Santa Apolonia', 'Municipio de Santa Apolonia', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (78, 'Tecpán', 'Municipio de Tecpán', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (79, 'Patzun', 'Municipio de Patzun', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (80, 'Pochuta', 'Municipio de Pochuta', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (81, 'Patzicía', 'Municipio de Patzicía', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (82, 'Santa Cruz Balanyá', 'Municipio de Santa Cruz Balanyá', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (83, 'Acatenango', 'Municipio de Acatenango', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (84, 'Yepocapa', 'Municipio de Yepocapa', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (85, 'San Andres Itzapa', 'Municipio de San Andres Itzapa', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (86, 'Parramos', 'Municipio de Parramos', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (87, 'Zaragoza', 'Municipio de Zaragoza', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (88, 'El Tejar', 'Municipio de El Tejar', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (89, 'Chimaltenango', 'Municipio Chimaltenango', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (90, 'San Martin Jilotepeque', 'Municipio de San Martin Jilotepeque', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (91, 'Patzún', 'Municipio de Patzún', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (92, 'San Andrés Itzapa', 'Municipio de San Andrés Itzapa', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (93, 'San José Poaquíl', 'Municipio de San José Poaquíl', 8, 21);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (94, 'San Martín Jilotepeque', 'Municipio de San Martín Jilotepeque', 8, 21);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (95, 'Escuintla', 'Municipio de Escuintla', 8, 22);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (96, 'Santa Lucía Cotzumalguapa', 'Municipio de Santa Lucía Cotzumalguapa', 8, 22);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (97, 'La Democracia', 'Municipio de La Democracia', 8, 22);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (98, 'Siquinalá', 'Municipio de Siquinalá', 8, 22);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (99, 'Masagua', 'Municipio de Masagua', 8, 22);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (100, 'Tiquisate', 'Municipio de Tiquisate', 8, 22);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (101, 'La Gomera', 'Municipio de La Gomera', 8, 22);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (102, 'Guanagazapa', 'Municipio de Guanagazapa', 8, 22);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (103, 'San José', 'Municipio de San José', 8, 22);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (104, 'Iztapa', 'Municipio de Iztapa', 8, 22);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (105, 'Palín', 'Municipio de Palín', 8, 22);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (106, 'San Vicente Pacaya', 'Municipio de San Vicente Pacaya', 8, 22);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (107, 'Nueva Concepción', 'Municipio de Nueva Concepción', 8, 22);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (108, 'Cuilapa', 'Municipio de Cuilapa', 8, 23);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (109, 'Santa Rosa de Lima', 'Municipio de Santa Rosa de Lima', 8, 23);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (110, 'Casillas', 'Municipio de Casillas', 8, 23);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (111, 'San Rafael Las Flores', 'Municipio de San Rafael Las Flores', 8, 23);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (112, 'Oratorio', 'Municipio de Oratorio', 8, 23);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (113, 'San Juan Tecuaco', 'Municipio de San Juan Tecuaco', 8, 23);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (114, 'Chiquimulilla', 'Municipio de Chiquimulilla', 8, 23);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (115, 'Taxisco', 'Municipio de Taxisco', 8, 23);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (116, 'Santa María Ixhuatán', 'Municipio de Santa María Ixhuatán', 8, 23);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (117, 'Guazacapán', 'Municipio de Guazacapán', 8, 23);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (118, 'Santa Cruz Naranjo', 'Municipio de Santa Cruz Naranjo', 8, 23);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (119, 'Pueblo Nuevo Viñas', 'Municipio de Pueblo Nuevo Viñas', 8, 23);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (120, 'Nueva Santa Rosa', 'Municipio de Nueva Santa Rosa', 8, 23);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (121, 'Barberena', 'Municipio de Barberena', 8, 23);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (122, 'Sololá', 'Municipio de Sololá', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (123, 'San José Chacayá', 'Municipio de San José Chacayá', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (124, 'Santa María Visitación', 'Municipio de Santa María Visitación', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (125, 'Santa Lucía Utatlán', 'Municipio de Santa Lucía Utatlán', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (126, 'Nahualá', 'Municipio de Nahualá', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (127, 'Santa Catarina Ixtahuacán', 'Municipio de Santa Catarina Ixtahuacán', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (128, 'Santa Clara La Laguna', 'Municipio de Santa Clara La Laguna', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (129, 'Concepción', 'Municipio de Concepción', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (130, 'San Andrés Semetabaj', 'Municipio de San Andrés Semetabaj', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (131, 'Panajachel', 'Municipio de Panajachel', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (132, 'Santa Catarina Palopó', 'Municipio de Santa Catarina Palopó', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (133, 'San Antonio Palopó', 'Municipio de San Antonio Palopó', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (134, 'San Lucas Tolimán', 'Municipio de San Lucas Tolimán', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (135, 'Santa Cruz La Laguna', 'Municipio de Santa Cruz La Laguna', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (136, 'San Pablo La Laguna', 'Municipio de San Pablo La Laguna', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (137, 'San Juan La Laguna', 'Municipio de San Juan La Laguna', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (138, 'San Marcos La Laguna', 'Municipio de San Marcos La Laguna', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (139, 'San Pedro La Laguna', 'Municipio de San Pedro La Laguna', 8, 24);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (140, 'Santiago Atitlán', 'Municipio de Santiago Atitlán', 8, 24);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (141, 'Totonicapán', 'Municipio de Totonicapán', 8, 25);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (142, 'San Cristóbal Totonicapán', 'Municipio de San Cristóbal Totonicapán', 8, 25);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (143, 'San Francisco El Alto', 'Municipio de San Francisco El Alto', 8, 25);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (144, 'San Andrés Xecul', 'Municipio de San Andrés Xecul', 8, 25);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (145, 'Momostenango', 'Municipio de Momostenango', 8, 25);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (146, 'Santa María Chiquimula', 'Municipio de Santa María Chiquimula', 8, 25);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (147, 'Santa Lucía La Reforma', 'Municipio de Santa Lucía La Reforma', 8, 25);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (148, 'San Bartolo', 'Municipio de San Bartolo', 8, 25);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (149, 'Quetzaltenango', 'Municipio de Quetzaltenango', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (150, 'Salcajá', 'Municipio de Salcajá', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (151, 'Olintepeque', 'Municipio de Olintepeque', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (152, 'San Carlos Sija', 'Municipio de San Carlos Sija', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (153, 'Sibilia', 'Municipio de Sibilia', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (154, 'Cabricán', 'Municipio de Cabricán', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (155, 'Cajolá', 'Municipio de Cajolá', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (156, 'San Miguel Sigüilá', 'Municipio de San Miguel Sigüilá', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (157, 'Concepción Chiquirichapa', 'Municipio de Concepción Chiquirichapa', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (158, 'San Martín Sacatepéquez', 'Municipio de San Martín Sacatepéquez', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (159, 'Almolonga', 'Municipio de Almolonga', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (160, 'Cantel', 'Municipio de Cantel', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (161, 'Huitán', 'Municipio de Huitán', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (162, 'Zunil', 'Municipio de Zunil', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (163, 'Colomba Costa Cuca', 'Municipio de Colomba Costa Cuca', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (164, 'San Francisco La Unión', 'Municipio de San Francisco La Unión', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (165, 'El Palmar', 'Municipio de El Palmar', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (166, 'Coatepeque', 'Municipio de Coatepeque', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (167, 'Génova', 'Municipio de Génova', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (168, 'Flores Costa Cuca', 'Municipio de Flores Costa Cuca', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (169, 'La Esperanza', 'Municipio de La Esperanza', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (170, 'Palestina de Los Altos', 'Municipio de Palestina de Los Altos', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (171, 'San Juan Ostuncalco', 'Municipio de San Juan Ostuncalco', 8, 26);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (172, 'San Mateo', 'Municipio de San Mateo', 8, 26);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (173, 'Mazatenango', 'Municipio de Mazatenango', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (174, 'Cuyotenango', 'Municipio de Cuyotenango', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (175, 'San Francisco Zapotitlán', 'Municipio de San Francisco Zapotitlán', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (176, 'San Bernardino', 'Municipio de San Bernardino', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (177, 'San José El Idolo', 'Municipio de San José El Idolo', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (178, 'Santo Domingo Suchitepéquez', 'Municipio de Santo Domingo Suchitepéquez', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (179, 'San Lorenzo', 'Municipio de San Lorenzo', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (180, 'Samayac', 'Municipio de Samayac', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (181, 'San Pablo Jocopilas', 'Municipio de San Pablo Jocopilas', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (182, 'San Antonio Suchitepéquez', 'Municipio de San Antonio Suchitepéquez', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (183, 'San Miguel Panán', 'Municipio de San Miguel Panán', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (184, 'San Gabriel', 'Municipio de San Gabriel', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (185, 'Chicacao', 'Municipio de Chicacao', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (186, 'Patulul', 'Municipio de Patulul', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (187, 'Santa Bárbara', 'Municipio de Santa Bárbara', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (188, 'San Juan Bautista', 'Municipio de San Juan Bautista', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (189, 'Santo Tomás La Unión', 'Municipio de Santo Tomás La Unión', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (190, 'Zunilito', 'Municipio de Zunilito', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (191, 'Pueblo Nuevo', 'Municipio de Pueblo Nuevo', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (192, 'Río Bravo', 'Municipio de Río Bravo', 8, 27);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (193, 'San José La Maquina', 'Municipio de San José La Maquina', 8, 27);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (194, 'Retalhuleu', 'Municipio de Retalhuleu', 8, 28);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (195, 'San Sebastián', 'Municipio de San Sebastián', 8, 28);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (196, 'Santa Cruz Muluá', 'Municipio de Santa Cruz Muluá', 8, 28);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (197, 'San Martín Zapotitlán', 'Municipio de San Martín Zapotitlán', 8, 28);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (198, 'San Felipe', 'Municipio de San Felipe', 8, 28);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (199, 'San Andrés Villa Seca', 'Municipio de San Andrés Villa Seca', 8, 28);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (200, 'Champerico', 'Municipio de Champerico', 8, 28);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (201, 'Nuevo San Carlos', 'Municipio de Nuevo San Carlos', 8, 28);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (202, 'El Asintal', 'Municipio de El Asintal', 8, 28);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (203, 'San Felipe', 'Municipio de San Felipe', 8, 28);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (204, 'San Marcos', 'Municipio de San Marcos', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (205, 'San Pedro Sacatepéquez', 'Municipio de San Pedro Sacatepéquez', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (206, 'San Antonio Sacatepéquez', 'Municipio de San Antonio Sacatepéquez', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (207, 'Comitancillo', 'Municipio de Comitancillo', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (208, 'San Miguel Ixtahuacán', 'Municipio de San Miguel Ixtahuacán', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (209, 'Concepción Tutuapa', 'Municipio de Concepción Tutuapa', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (210, 'Tacaná', 'Municipio de Tacaná', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (211, 'Sibinal', 'Municipio de Sibinal', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (212, 'Tajumulco', 'Municipio de Tajumulco', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (213, 'Tejutla', 'Municipio de Tejutla', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (214, 'San Rafael Pie de la Cuesta', 'Municipio de San Rafael Pie de la Cuesta', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (215, 'Nuevo Progreso', 'Municipio de Nuevo Progreso', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (216, 'El Tumbador', 'Municipio de El Tumbador', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (217, 'San José Ojetenam', 'Municipio de San José Ojetenam', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (218, 'San Cristóbal Cucho', 'Municipio de San Cristóbal Cucho', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (219, 'Sipacapa', 'Municipio de Sipacapa', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (220, 'Esquipulas Palo Gordo', 'Municipio de Esquipulas Palo Gordo', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (221, 'Río Blanco', 'Municipio de Río Blanco', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (222, 'San Lorenzo', 'Municipio de San Lorenzo', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (223, 'La Blanca', 'Municipio de La Blanca', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (224, 'San Pablo', 'Municipio de San Pablo', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (225, 'Ayutla', 'Municipio de Ayutla', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (226, 'Catarina', 'Municipio de Catarina', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (227, 'El Quetzal', 'Municipio de El Quetzal', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (228, 'Ixchiguán', 'Municipio de Ixchiguán', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (75, 'La Reforma', 'Municipio de La Reforma', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (229, 'Malacatán', 'Municipio de Malacatán', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (230, 'Ocós', 'Municipio de Ocós', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (231, 'Pajapita', 'Municipio de Pajapita', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (232, 'San Miguel Ixtahuacán', 'Municipio de San Miguel Ixtahuacán', 8, 29);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (233, 'San José El Rodeo', 'Municipio de San José El Rodeo', 8, 29);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (234, 'Huehuetenango', 'Municipio de Huehuetenango', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (235, 'Chiantla', 'Municipio de Chiantla', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (236, 'Malacatancito', 'Municipio de Malacatancito', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (237, 'Cuilco', 'Municipio de Cuilco', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (238, 'Nentón', 'Municipio de Nentón', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (239, 'San Pedro Necta', 'Municipio de San Pedro Necta', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (240, 'Jacaltenango', 'Municipio de Jacaltenango', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (241, 'San Pedro Soloma', 'Municipio de San Pedro Soloma', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (242, 'San Ildefonso Ixtahuacán', 'Municipio de San Ildefonso Ixtahuacán', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (243, 'Santa Bárbara', 'Municipio de Santa Bárbara', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (244, 'La Libertad', 'Municipio de La Libertad', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (245, 'La Democracia', 'Municipio de La Democracia', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (246, 'San Miguel Acatán', 'Municipio de San Miguel Acatán', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (247, 'San Rafael La Independencia', 'Municipio de San Rafael La Independencia', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (248, 'Todos Santos Cuchumatán', 'Municipio de Todos Santos Cuchumatán', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (249, 'San Juan Atitán', 'Municipio de San Juan Atitán', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (250, 'Santa Eulalia', 'Municipio de Santa Eulalia', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (251, 'San Mateo Ixtatán', 'Municipio de San Mateo Ixtatán', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (252, 'Colotenango', 'Municipio de Colotenango', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (253, 'San Sebastián Huehuetenango', 'Municipio de San Sebastián Huehuetenango', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (254, 'Tectitán', 'Municipio de Tectitán', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (255, 'Concepción Huista', 'Municipio de Concepción Huista', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (256, 'San Juan Ixcoy', 'Municipio de San Juan Ixcoy', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (257, 'San Antonio Huista', 'Municipio de San Antonio Huista', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (258, 'San Sebastián Coatán', 'Municipio de San Sebastián Coatán', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (260, 'Aguacatán', 'Municipio de Aguacatán', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (261, 'San Rafael Pétzal', 'Municipio de San Rafael Pétzal', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (262, 'San Gaspar Ixchil', 'Municipio de San Gaspar Ixchil', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (263, 'Santiago Chimaltenango', 'Municipio de Santiago Chimaltenango', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (264, 'Santa Ana Huista', 'Municipio de Santa Ana Huista', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (265, 'Unión Cantinil', 'Municipio de Unión Cantinil', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (266, 'Petatán', 'Municipio de Petatán', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (267, 'Santa Cruz Barillas', 'Municipio de Santa Cruz Barillas', 8, 30);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (269, 'San Sebastián', 'Municipio de San Sebastián', 8, 30);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (270, 'Santa Cruz del Quiché', 'Municipio de Santa Cruz del Quiché', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (271, 'Chiché', 'Municipio de Chiché', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (272, 'Chinique', 'Municipio de Chinique', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (273, 'Zacualpa', 'Municipio de Zacualpa', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (274, 'Chichicastenango', 'Municipio de Chichicastenango', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (275, 'Patzité', 'Municipio de Patzité', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (276, 'San Antonio Ilotenango', 'Municipio de San Antonio Ilotenango', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (277, 'San Pedro Jocopilas', 'Municipio de San Pedro Jocopilas', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (278, 'Cunén', 'Municipio de Cunén', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (279, 'San Juan Cotzal', 'Municipio de San Juan Cotzal', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (280, 'Joyabaj', 'Municipio de Joyabaj', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (281, 'Nebaj', 'Municipio de Nebaj', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (282, 'San Andrés Sajcabajá', 'Municipio de San Andrés Sajcabajá', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (284, 'Sacapulas', 'Municipio de Sacapulas', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (285, 'San Bartolomé Jocotenango', 'Municipio de San Bartolomé Jocotenango', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (286, 'Canillá', 'Municipio de Canillá', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (287, 'Chicamán', 'Municipio de Chicamán', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (288, 'Ixcán', 'Municipio de Ixcán', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (289, 'Pachalum', 'Municipio de Pachalum', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (290, 'Chajul', 'Municipio de Chajul', 8, 31);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (291, 'San Miguel Uspantán', 'Municipio de San Miguel Uspantán', 8, 31);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (292, 'Cobán', 'Municipio de Cobán', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (293, 'Santa Cruz Verapaz', 'Municipio de Santa Cruz Verapaz', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (294, 'San Cristóbal Verapaz', 'Municipio de San Cristóbal Verapaz', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (295, 'Tactic', 'Municipio de Tactic', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (296, 'Tamahú', 'Municipio de Tamahú', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (297, 'Tucurú', 'Municipio de Tucurú', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (298, 'Panzós', 'Municipio de Panzós', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (299, 'Senahú', 'Municipio de Senahú', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (300, 'San Pedro Carchá', 'Municipio de San Pedro Carchá', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (301, 'San Juan Chamelco', 'Municipio de San Juan Chamelco', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (302, 'Lanquín', 'Municipio de Lanquín', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (303, 'Santa María Cahabón', 'Municipio de Santa María Cahabón', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (304, 'Chisec', 'Municipio de Chisec', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (305, 'Chahal', 'Municipio de Chahal', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (306, 'Fray Bartolomé de las Casas', 'Municipio de Fray Bartolomé de las Casas', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (307, 'La Tinta', 'Municipio de La Tinta', 8, 33);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (308, 'Raxruhá', 'Municipio de Raxruhá', 8, 33);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (309, 'Flores', 'Municipio de Flores', 8, 34);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (310, 'San José', 'Municipio de San José', 8, 34);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (311, 'San Benito', 'Municipio de San Benito', 8, 34);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (312, 'San Andrés', 'Municipio de San Andrés', 8, 34);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (313, 'La Libertad', 'Municipio de La Libertad', 8, 34);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (314, 'San Francisco', 'Municipio de San Francisco', 8, 34);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (315, 'Santa Ana', 'Municipio de Santa Ana', 8, 34);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (316, 'Dolores', 'Municipio de Dolores', 8, 34);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (317, 'San Luis', 'Municipio de San Luis', 8, 34);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (318, 'Sayaxché', 'Municipio de Sayaxché', 8, 34);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (319, 'Melchor de Mencos', 'Municipio de Melchor de Mencos', 8, 34);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (320, 'Poptún', 'Municipio de Poptún', 8, 34);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (321, 'Las Cruces', 'Municipio de Las Cruces', 8, 34);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (322, 'El Chal', 'Municipio de El Chal', 8, 34);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (323, 'Cubulco', 'Municipio de Cubulco', 8, 32);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (324, 'Santa Cruz El Chol', 'Municipio de Santa Cruz El Chol', 8, 32);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (325, 'Granados', 'Municipio de Granados', 8, 32);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (326, 'Purulhá', 'Municipio de Purulhá', 8, 32);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (327, 'Rabinal', 'Municipio de Rabinal', 8, 32);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (328, 'Salamá', 'Municipio de Salamá', 8, 32);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (329, 'San Jerónimo', 'Municipio de San Jerónimo', 8, 32);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (330, 'San Miguel Chicaj', 'Municipio de San Miguel Chicaj', 8, 32);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (331, 'El Estor', 'Municipio de El Estor', 8, 35);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (332, 'Morales', 'Municipio de Morales', 8, 35);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (333, 'Livingston', 'Municipio de Livingston', 8, 35);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (334, 'Los Amates', 'Municipio de Los Amates', 8, 35);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (335, 'Puerto Barrios', 'Municipio de Puerto Barrios', 8, 35);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (336, 'Cabañas', 'Municipio de Cabañas', 8, 36);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (337, 'Estanzuela', 'Municipio de Estanzuela', 8, 36);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (338, 'Gualán', 'Municipio de Gualán', 8, 36);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (339, 'Huité', 'Municipio de Huité', 8, 36);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (340, 'La Unión', 'Municipio de La Unión', 8, 36);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (341, 'Río Hondo', 'Municipio de Río Hondo', 8, 36);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (342, 'San Diego', 'Municipio de San Diego', 8, 36);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (343, 'San Jorge', 'Municipio de San Jorge', 8, 36);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (344, 'Teculután', 'Municipio de Teculután', 8, 36);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (345, 'Usumatlán', 'Municipio de Usumatlán', 8, 36);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (346, 'Zacapa', 'Municipio de Zacapa', 8, 36);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (347, 'Chiquimula', 'Municipio de Chiquimula', 8, 37);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (348, 'Camotán', 'Municipio de Camotán', 8, 37);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (349, 'Concepción Las Minas', 'Municipio de Concepción Las Minas', 8, 37);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (350, 'Esquipulas', 'Municipio de Esquipulas', 8, 37);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (351, 'Ipala', 'Municipio de Ipala', 8, 37);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (352, 'Jocotán', 'Municipio de Jocotán', 8, 37);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (353, 'Olopa', 'Municipio de Olopa', 8, 37);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (354, 'Quezaltepeque', 'Municipio de Quezaltepeque', 8, 37);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (355, 'San José La Arada', 'Municipio de San José La Arada', 8, 37);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (356, 'San Juan Ermita', 'Municipio de San Juan Ermita', 8, 37);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (357, 'San Jacinto', 'Municipio de San Jacinto', 8, 37);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (358, 'Jalapa', 'Municipio de Jalapa', 8, 38);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (359, 'San Pedro Pinula', 'Municipio de San Pedro Pinula', 8, 38);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (360, 'San Luis Jilotepeque', 'Municipio de San Luis Jilotepeque', 8, 38);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (361, 'San Manuel Chaparrón', 'Municipio de San Manuel Chaparrón', 8, 38);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (362, 'San Carlos Alzatate', 'Municipio de San Carlos Alzatate', 8, 38);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (363, 'Monjas', 'Municipio de Monjas', 8, 38);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (364, 'Mataquescuintla', 'Municipio de Mataquescuintla', 8, 38);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (365, 'Jutiapa', 'Municipio de Jutiapa', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (366, 'El Progreso', 'Municipio de El Progreso', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (367, 'Santa Catarina Mita', 'Municipio de Santa Catarina Mita', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (368, 'Agua Blanca', 'Municipio de Agua Blanca', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (369, 'Asunción Mita', 'Municipio de Asunción Mita', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (370, 'Yupiltepeque', 'Municipio de Yupiltepeque', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (371, 'Atescatempa', 'Municipio de Atescatempa', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (372, 'Jerez', 'Municipio de Jerez', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (373, 'El Adelanto', 'Municipio de El Adelanto', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (374, 'Zapotitlán', 'Municipio de Zapotitlán', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (375, 'Comapa', 'Municipio de Comapa', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (376, 'Jalpatagua', 'Municipio de Jalpatagua', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (377, 'Conguaco', 'Municipio de Conguaco', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (378, 'Moyuta', 'Municipio de Moyuta', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (379, 'Pasaco', 'Municipio de Pasaco', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (380, 'San José Acatempa', 'Municipio de San José Acatempa', 8, 39);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (381, 'Quesada', 'Municipio de Quesada', 8, 39);

INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (382, 'El Jícaro', 'Municipio de El Jícaro', 8, 74);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (383, 'Guastatoya', 'Municipio de Guastatoya', 8, 74);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (384, 'Morazán', 'Municipio de Morazán', 8, 74);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (385, 'San Agustín Acasaguastlán', 'Municipio de San Agustín Acasaguastlán', 8, 74);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (386, 'San Cristóbal Acasaguastlán', 'Municipio de San Cristóbal Acasaguastlán', 8, 74);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (387, 'Sanarate', 'Municipio de Sanarate', 8, 74);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (388, 'Sansare', 'Municipio de Sansare', 8, 74);
INSERT INTO catalogs.item (id, value, description, catalog_id,item_id) VALUES (389, 'an Antonio La Paz', 'Municipio de an Antonio La Paz', 8, 74);

INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (390, 'Comerciante', 'Comerciante', 9);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (391, 'Asalariado', 'Persona que labora para una organizacion', 9);

INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (392, 'Pastilla', 'Pastilla', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (393, 'Jarabe', 'Jarabe', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (394, 'Inyección', 'Inyección', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (395, 'Crema', 'Crema', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (396, 'Tableta', 'Tableta', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (397, 'Cápsula', 'Cápsula', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (398, 'Polvo', 'Polvo', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (399, 'Gotas', 'Gotas', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (400, 'Supositorio', 'Supositorio', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (401, 'Solución', 'Solución', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (402, 'Suspensión', 'Suspensión', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (403, 'Aerosol', 'Aerosol', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (404, 'Gel', 'Gel', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (405, 'Loción', 'Loción', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (406, 'Pomada', 'Pomada', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (407, 'Óvulo', 'Óvulo', 10);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (408, 'Colirio', 'Colirio', 10);

INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (409, 'Monetaria', 'Cuenta Monetaria', 11);
INSERT INTO catalogs.item (id, value, description, catalog_id) VALUES (410, 'Ahorro', 'Cuenta de Ahorro', 11);