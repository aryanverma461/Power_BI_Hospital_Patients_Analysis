-- =================================================================================================================================
-- Table: organizations
DROP TABLE IF EXISTS silver.organizations;
CREATE TABLE silver.organizations (
    Id TEXT,
    Name TEXT,
    Address TEXT,
    City TEXT,
    State TEXT,  
    Zip TEXT,
    Lat TEXT,  
    Lon TEXT   
);
-- Table: patients
DROP TABLE IF EXISTS silver.patients;
CREATE TABLE silver.patients (
    Id TEXT,
    BIRTHDATE DATE,
    DEATHDATE DATE,
    PREFIX TEXT,
    FIRST TEXT,
    LAST TEXT,
    SUFFIX TEXT,
    MAIDEN TEXT,
    MARITAL TEXT,
    RACE TEXT,
    ETHNICITY TEXT,
    GENDER TEXT,
    BIRTHPLACE TEXT,
    ADDRESS TEXT,
    CITY TEXT,
    STATE TEXT,
    COUNTY TEXT,
    ZIP TEXT,
    LAT TEXT,
    LON TEXT
);

-- Table: payers
DROP TABLE IF EXISTS silver.payers;
CREATE TABLE silver.payers (
   Id TEXT,
   NAME TEXT,
   ADDRESS TEXT,
   CITY TEXT,
   STATE_HEADQUARTERED TEXT,
   ZIP TEXT,
   PHONE TEXT
);

-- Table: encounters
DROP TABLE IF EXISTS silver.encounters;
CREATE TABLE silver.encounters (
    Id TEXT,
    Start TIMESTAMP,
    Stop TIMESTAMP,
    Patient TEXT,
    Organization TEXT,
    Payer TEXT,
    EncounterClass TEXT, 
    Code TEXT,
    Description TEXT,
    Base_Encounter_Cost NUMERIC,
    Total_Claim_Cost NUMERIC,
    Payer_Coverage NUMERIC,
    ReasonCode TEXT,
    ReasonDescription TEXT
);
-- Table: procedures
DROP TABLE IF EXISTS silver.procedures;
CREATE TABLE silver.procedures (
    Start TIMESTAMP,
    Stop TIMESTAMP,
    Patient TEXT,
    Encounter TEXT,
    Code TEXT,
    Description TEXT,
    Base_Cost NUMERIC,
    ReasonCode TEXT,
    ReasonDescription TEXT
);

-- =================================================================================================================================
SELECT MAX(age) as max_age, MIN
(age) As min_age
FROM(
SELECT sp.birthdate, EXTRACT(YEAR FROM MAKE_DATE('2021','01','01'))-EXTRACT(YEAR FROm sp.birthdate ) as age
FROM silver.patients sp
)