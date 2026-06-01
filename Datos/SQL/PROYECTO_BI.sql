create database BD_Bancos
GO
use BD_Bancos

CREATE TABLE DimBanco (
    IdBanco INT IDENTITY(1,1) PRIMARY KEY,
    NombreBanco VARCHAR(200)
);

CREATE TABLE DimCuentaFinanciera (
    IdCuenta INT IDENTITY(1,1) PRIMARY KEY,
    CodigoCuenta VARCHAR(10),
    Concepto VARCHAR(300),
    TipoCuenta VARCHAR(20)
);

CREATE TABLE DimTiempo (
    IdTiempo INT IDENTITY(1,1) PRIMARY KEY,
    Fecha DATE,
    Anio INT,
    Mes INT,
    NombreMes VARCHAR(20),
    Trimestre INT
);

CREATE TABLE FactEstadoResultados (
    IdFact BIGINT IDENTITY(1,1) PRIMARY KEY,
    IdBanco INT,
    IdCuenta INT,
    IdTiempo INT,
    Monto DECIMAL(18,3),

    FOREIGN KEY (IdBanco)
        REFERENCES DimBanco(IdBanco),

    FOREIGN KEY (IdCuenta)
        REFERENCES DimCuentaFinanciera(IdCuenta),

    FOREIGN KEY (IdTiempo)
        REFERENCES DimTiempo(IdTiempo)
);


BULK INSERT DimBanco
FROM 'D:\Dimensiones_proyectoBI\DimBanco.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a', 
    CODEPAGE = '65001'
);

BULK INSERT DimCuentaFinanciera
FROM 'D:\Dimensiones_proyectoBI\DimCuenta.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a', 
    CODEPAGE = '65001'
);

BULK INSERT DimTiempo
FROM 'D:\Dimensiones_proyectoBI\DimTiempo.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a', 
    CODEPAGE = '65001'
);

BULK INSERT FactEstadoResultados
FROM 'D:\Dimensiones_proyectoBI\FactEstadoResultados.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a', 
    CODEPAGE = '65001'
);

select * from DimBanco
where IdBanco = 4
select * from DimCuentaFinanciera
where IdCuenta = 23
select * from DimTiempo
where IdTiempo = 60
select * from FactEstadoResultados
where IdFact = 19273

