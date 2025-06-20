-- Organization_table_cleanup

INSERT INTO silver.organizations 
SELECT *
FROM bronze.organizations

SELECT *
FROM silver.organizations

-- payers_table_cleanup
INSERT INTO silver.payers
SELECT * FROM 
bronze.payers;

-- patients_table_cleanup
INSERT INTO silver.patients
SELECT
    Id,
    BIRTHDATE :: DATE,
    DEATHDATE :: DATE,
    INITCAP(TRIM(PREFIX)) AS PREFIX,
    INITCAP
 (   TRIM(REGEXP_REPLACE(REPLACE(FIRST,'Ångel', 'Angel'), '[^a-zA-Z ]', '', 'g')
))AS FIRST,
    INITCAP
    (TRIM(REGEXP_REPLACE(LAST, '[^a-zA-Z ]', '', 'g'))) AS LAST,
    INITCAP(TRIM(SUFFIX)) AS SUFFIX,
    INITCAP(
    TRIM(REGEXP_REPLACE((CASE
        WHEN MAIDEN IS NULL 
        THEN 'Unknown'
        ELSE
        MAIDEN
       END), '[^a-zA-Z ]', '', 'g'))) 
       AS MAIDEN
        ,
    INITCAP(TRIM(CASE
        WHEN MARITAL IS NULL THEN 'Unknown'
        WHEN MARITAL='S' THEN 'Single'
        WHEN MARITAL='M' THEN 'Married'
       END)) AS MARITAL,
    INITCAP(TRIM(RACE)) AS RACE,
    INITCAP(ETHNICITY) AS ETHNICITY,
    TRIM(CASE
        WHEN GENDER='F' THEN 'Female'
        WHEN GENDER='M' THEN 'Male'
        ELSE 'Unknown'
       END) AS GENDER,
       INITCAP
    (TRIM(REGEXP_REPLACE(BIRTHPLACE, '[^a-zA-Z ]+', '', 'g')))
    AS BIRTHPLACE,
     INITCAP
    (TRIM(REGEXP_REPLACE(ADDRESS, '[^a-zA-Z ]+', '', 'g')))
    AS
     ADDRESS,
    CITY,
    STATE,
    COUNTY,
    ZIP,
    LAT,
    LON
FROM bronze.patients

-- encounters_table_cleanup

INSERT INTO silver.encounters
SELECT 
 Id,
    Start::TIMESTAMP,
    Stop::TIMESTAMP,
    Patient,
    Organization,
    Payer,
    INITCAP(EncounterClass )AS EncounterClass, 
    Code,
    INITCAP
    (TRIM(REGEXP_REPLACE(REPLACE(
         REPLACE(
           REPLACE(Description, '(procedure)', ''),
         '(qualifier value)', ''),
       '(regime/therapy)', ''), '[^a-zA-Z ]+', '', 'g'))) AS
    Description,
    Base_Encounter_Cost ,
            CASE
        WHEN Total_Claim_Cost=0 THEN Base_Encounter_Cost
        ELSE Total_Claim_Cost
        END AS
    Total_Claim_Cost ,
    Payer_Coverage ,
    CASE WHEN ReasonCode IS NULL THEN '00000'
                ELSE ReasonCode END AS
    ReasonCode,
    INITCAP
    (TRIM(REGEXP_REPLACE(REPLACE(
         REPLACE( CASE WHEN ReasonDescription IS NULL THEN 'Unknown'
                ELSE ReasonDescription END,
          '(disorder)', ''),
         '(situation)', ''), '[^a-zA-Z ]', '', 'g'))) AS
    ReasonDescription
FROM
    bronze.encounters    

-- procedures_table_cleanup

INSERT INTO silver.procedures
SELECT  
    Start:: TIMESTAMP,
    Stop:: TIMESTAMP,
    Patient,
    Encounter,
    TRIM(Code) AS Code,
    INITCAP
    (TRIM(REGEXP_REPLACE(REPLACE(
         REPLACE( CASE WHEN Description IS NULL THEN 'Unknown'
                ELSE Description END,
          '(disorder)', ''),
         '(situation)', ''), '[^a-zA-Z ]', '', 'g'))) AS
    Description,
    Base_Cost,
    CASE WHEN ReasonCode IS NULL THEN '00000'
    ELSE ReasonCode END AS ReasonCode ,
    INITCAP
    (TRIM(REGEXP_REPLACE(REPLACE(
         REPLACE( CASE WHEN ReasonDescription IS NULL THEN 'Unknown'
                ELSE ReasonDescription END,
          '(disorder)', ''),
         '(situation)', ''), '[^a-zA-Z ]', '', 'g'))) AS
    ReasonDescription
FROM bronze.procedures    

-- to create index

-- SELECT ROW_NUMBER() OVER(ORDER BY Start) as id,patient
-- FROM silver.procedures

