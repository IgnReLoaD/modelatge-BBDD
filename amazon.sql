DROP SCHEMA IF EXISTS Amazon;
CREATE DATABASE IF NOT EXISTS Amazon;
USE Amazon;

CREATE TABLE Autors (
	id_autor			INT(32) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom_autor			INT(32) NOT NULL,
    naix_autor			DATE, 
    pais_autor			VARCHAR(50),
    direccio			VARCHAR(50),
    mes_de_1_obra		BOOL  
);
CREATE TABLE Llibres (
	id_llibre			INT(32) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titol				VARCHAR(50) NOT NULL,
	fecha				DATE,
	editorial			VARCHAR(50),
	autors_id_autor	INT NOT NULL,    
    FOREIGN KEY (autors_id_autor) REFERENCES Autors(id_autor)
);    
CREATE INDEX buscar_llibre_per_titol ON Llibres(titol);

CREATE TABLE Botiga (
	id_producte			INT(32) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    llibre_id_llibre 	INT(32),
    preu				FLOAT,
    stock_actual		INT,
    stock_minim			INT,
    FOREIGN KEY (llibre_id_llibre) REFERENCES Llibres(id_llibre)
);
CREATE TABLE Usuaris (
	id_usuari			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nom					VARCHAR (25),
    email				VARCHAR (50),
    pwd					VARCHAR (9),
    descompte			FLOAT
);
CREATE TABLE Login (
	id_login			INT PRIMARY KEY,
    momento				TIMESTAMP,
    email				VARCHAR (50) NOT NULL,
    contrasenia			VARBINARY(10) NOT NULL    
);

CREATE TABLE Comanda (
	id_comanda			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha				DATE,
    client_id_usuari	INT,
    preu_base_imp		FLOAT,
    FOREIGN KEY (client_id_usuari) REFERENCES Usuaris(id_usuari)
);

CREATE TABLE Linies (
	id_comanda			INT NOT NULL,
    id_linia			INT NOT NULL,
    prod_id_producte	INT,
    quantitat			TINYINT,
    preu_unitat			FLOAT,
    descompte_usr		FLOAT,
    FOREIGN KEY (prod_id_producte) REFERENCES Botiga(id_producte),
    PRIMARY KEY (id_comanda, id_linia)
);
