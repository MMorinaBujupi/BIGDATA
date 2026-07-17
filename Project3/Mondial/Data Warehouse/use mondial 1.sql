USE mondialDWH;

DROP TABLE IF EXISTS Fact_River_Country;
DROP TABLE IF EXISTS Dim_River;
DROP TABLE IF EXISTS Dim_Country;
DROP TABLE IF EXISTS Dim_Region;

CREATE TABLE Dim_River (
    RiverKey INT AUTO_INCREMENT PRIMARY KEY,
    RiverName VARCHAR(100) NOT NULL,
    RiverLength DECIMAL(10,2),
    UNIQUE (RiverName)
);

CREATE TABLE Dim_Country (
    CountryKey INT AUTO_INCREMENT PRIMARY KEY,
    CountryCode VARCHAR(10) NOT NULL,
    CountryName VARCHAR(100) NOT NULL,
    Population BIGINT,
    Capital VARCHAR(100),
    UNIQUE (CountryCode)
);

CREATE TABLE Dim_Region (
    RegionKey INT AUTO_INCREMENT PRIMARY KEY,
    RegionName VARCHAR(100) NOT NULL,
    UNIQUE (RegionName)
);

CREATE TABLE Fact_River_Country (
    FactKey INT AUTO_INCREMENT PRIMARY KEY,
    RiverKey INT NOT NULL,
    CountryKey INT NOT NULL,
    RegionKey INT NOT NULL,

    FOREIGN KEY (RiverKey)
        REFERENCES Dim_River(RiverKey),

    FOREIGN KEY (CountryKey)
        REFERENCES Dim_Country(CountryKey),

    FOREIGN KEY (RegionKey)
        REFERENCES Dim_Region(RegionKey)
);