PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE sales_person
(
    sale_no INT PRIMARY KEY NOT NULL,
    name VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    phone VARCHAR(20) NOT NULL,
    comm VARCHAR,
    base_salary VARCHAR NOT NULL,
    ytdSales VARCHAR NOT NULL
);
INSERT INTO "sales_person" VALUES(654,'SALLY ROGERS','45 CROSS ST','573-555-8888','52000','55000','109000');
CREATE TABLE customer_D2
(
    buyer_no INT PRIMARY KEY NOT NULL,
    name VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    phone VARCHAR(20) NOT NULL
);
INSERT INTO "customer_D2" VALUES(5678,'MIKE KING','33 SECOND','573-555-7890');
CREATE TABLE Rebate2
(
    model VARCHAR(20) PRIMARY KEY NOT NULL,
    amount INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);
INSERT INTO "Rebate2" VALUES('RAV4',1750,1391230800000,1401508800000);
CREATE TABLE Options
(
    Serial INT PRIMARY KEY NOT NULL,
    Options VARCHAR NOT NULL
);
CREATE TABLE autos
(
    vehicle_no VARCHAR PRIMARY KEY NOT NULL,
    model VARCHAR NOT NULL,
    color VARCHAR NOT NULL,
    autoTrans VARCHAR NOT NULL,
    warehouse VARCHAR NOT NULL,
    financed VARCHAR NOT NULL
);
INSERT INTO "autos" VALUES('S12212','Tundra','Silver','yes','Liberty','yes');
INSERT INTO "autos" VALUES('S14414','RAV4','Yellow','no','Lees Summit','no');
CREATE TABLE Deal
(
    deal_no VARCHAR PRIMARY KEY NOT NULL,
    rep_no INT NOT NULL,
    customer_no INT NOT NULL,
    serial_no VARCHAR NOT NULL,
    amount INT NOT NULL,
    fin_amt INT NOT NULL,
    date DATE NOT NULL,
    rebate_amt INT NOT NULL
);
INSERT INTO "Deal" VALUES('T45678',654,5678,'S14414',23000,13000,1391749200000,1750);
CREATE TABLE Finance
(
    vehicle_no VARCHAR PRIMARY KEY NOT NULL,
    buyer_no INT NOT NULL,
    amount INT NOT NULL,
    months INT NOT NULL,
    balance INT NOT NULL
);
INSERT INTO "Finance" VALUES('S14414',5678,13000,60,13000);
COMMIT;
