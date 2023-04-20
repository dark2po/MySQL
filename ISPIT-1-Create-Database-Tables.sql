-- DROP DATABASE IF EXISTS ajti_IT;
CREATE DATABASE IF NOT EXISTS ajti_IT;
USE ajti_IT;

-- DROP TABLE IF EXISTS zaposlenici;
CREATE TABLE IF NOT EXISTS zaposlenici(
	ID INT AUTO_INCREMENT PRIMARY KEY,
	ime VARCHAR(50) NOT NULL,
	prezime VARCHAR(50) NOT NULL,
	nadredjeniID INT,
	placa DECIMAL(9,2) NOT NULL,
	pozicija VARCHAR(50) NOT NULL,
	FOREIGN KEY (nadredjeniID)
		REFERENCES zaposlenici(ID)
		ON UPDATE CASCADE ON DELETE SET NULL
);

-- DROP TABLE IF EXISTS odjeli;
CREATE TABLE IF NOT EXISTS odjeli(
	ID INT NOT NULL AUTO_INCREMENT,
	naziv VARCHAR(50)NOT NULL,
	voditeljID INT NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (voditeljID)
		REFERENCES zaposlenici(ID)
		ON UPDATE CASCADE ON DELETE RESTRICT
);

-- DROP TABLE IF EXISTS satnica;
CREATE TABLE IF NOT EXISTS satnica(
	zaposlenikID INT,
	odjelID INT,
	tjednoSati TINYINT UNSIGNED,
	PRIMARY KEY (zaposlenikID, odjelID),
	FOREIGN KEY (zaposlenikID)
		REFERENCES zaposlenici(ID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (odjelID)
		REFERENCES odjeli(ID)
		ON UPDATE CASCADE ON DELETE CASCADE
);