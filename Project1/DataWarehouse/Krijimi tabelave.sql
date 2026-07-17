USE DWH_mondial;

DROP TABLE IF EXISTS Fact_River_Country;
DROP TABLE IF EXISTS Dim_River;
DROP TABLE IF EXISTS Dim_Country;
DROP TABLE IF EXISTS Dim_Region;

CREATE TABLE Dim_River (
    RiverID INT AUTO_INCREMENT PRIMARY KEY,
    RiverName VARCHAR(100) NOT NULL UNIQUE,
    RiverLength FLOAT NULL
);

CREATE TABLE Dim_Country (
    CountryID VARCHAR(4) PRIMARY KEY,
    CountryName VARCHAR(100) NOT NULL,
    Population BIGINT NULL
);

CREATE TABLE Dim_Region (
    RegionID INT AUTO_INCREMENT PRIMARY KEY,
    RegionName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Fact_River_Country (
    FactID INT AUTO_INCREMENT PRIMARY KEY,
    RiverID INT NOT NULL,
    CountryID VARCHAR(4) NOT NULL,
    RegionID INT NOT NULL,

    FOREIGN KEY (RiverID)
        REFERENCES Dim_River(RiverID),

    FOREIGN KEY (CountryID)
        REFERENCES Dim_Country(CountryID),

    FOREIGN KEY (RegionID)
        REFERENCES Dim_Region(RegionID)
);