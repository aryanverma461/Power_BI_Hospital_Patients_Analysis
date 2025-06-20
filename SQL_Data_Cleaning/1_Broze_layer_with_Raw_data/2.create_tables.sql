=================================================================================================================================
-- Table: organizations
DROP TABLE IF EXISTS bronze.organizations;
CREATE TABLE bronze.organizations (
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
DROP TABLE IF EXISTS bronze.patients;
CREATE TABLE bronze.patients (
    Id TEXT,
    BIRTHDATE TEXT,
    DEATHDATE TEXT,
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
DROP TABLE IF EXISTS bronze.payers;
CREATE TABLE bronze.payers (
   Id TEXT,
   NAME TEXT,
   ADDRESS TEXT,
   CITY TEXT,
   STATE_HEADQUARTERED TEXT,
   ZIP TEXT,
   PHONE TEXT
);

-- Table: encounters
DROP TABLE IF EXISTS bronze.encounters;
CREATE TABLE bronze.encounters (
    Id TEXT,
    Start TEXT,
    Stop TEXT,
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
DROP TABLE IF EXISTS bronze.procedures;
CREATE TABLE bronze.procedures (
    Start TEXT,
    Stop TEXT,
    Patient TEXT,
    Encounter TEXT,
    Code TEXT,
    Description TEXT,
    Base_Cost NUMERIC,
    ReasonCode TEXT,
    ReasonDescription TEXT
);

=================================================================================================================================



