DROP VIEW IF EXISTS gold.payers_dim;
CREATE VIEW gold.payers_dim AS
SELECT py.id,
       py.name,
       py.city
FROM silver.payers py;
===================================
DROP VIEW IF EXISTS gold.organizations_dim;
CREATE VIEW gold.organizations_dim AS
SELECT *
FROM silver.organizations;
===================================
DROP VIEW IF EXISTS gold.patients_dim;
CREATE VIEW gold.patients_dim AS
SELECT
id,
    CASE
    WHEN
    EXTRACT (YEAR FROM MAKE_DATE('2021','01','01'))-EXTRACT(YEAR FROM birthdate) <=12 THEN 'Children'
    WHEN
    EXTRACT (YEAR FROM MAKE_DATE('2021','01','01'))-EXTRACT(YEAR FROM birthdate) <=17 THEN 'Teen'
    WHEN
    EXTRACT (YEAR FROM MAKE_DATE('2021','01','01'))-EXTRACT(YEAR FROM birthdate) <=44 THEN 'Adult'
    WHEN
    EXTRACT (YEAR FROM MAKE_DATE('2021','01','01'))-EXTRACT(YEAR FROM birthdate) <=64 THEN 'Middle Aged'
    WHEN
    EXTRACT (YEAR FROM MAKE_DATE('2021','01','01'))-EXTRACT(YEAR FROM birthdate) >64 THEN 'Elderly'
    ELSE 'Unkown'
    END AS age_grp,
TRIM(CONCAT(FIRST,' ',LAST)) AS name,
GENDER,
maiden,
MARITAL,
RACE,
ETHNICITY,
CITY
FROM silver.patients;   
===================================
DROP VIEW IF EXISTS gold.encounters_fact;
CREATE VIEW gold.encounters_fact AS
WITH cte_3 as(
WITH cte_2 as(
WITH cte_1 as(
SELECT en.id,
    en.start:: DATE AS encounter_start_date,
    en.Stop::DATE AS encounter_Stop_date,
    en.patient AS patients_id,
    en.Organization AS organizations_id,
    en.Payer AS payers_id,
    en.Base_Encounter_Cost,
    en.Total_Claim_Cost,
    en.Payer_Coverage,
    en.EncounterClass,
    en.Description,
    en.ReasonDescription
FROM silver.encounters en)

SELECT
        cte_1.id,
        cte_1.encounter_start_date,
        cte_1.encounter_stop_date,
        cte_1.patients_id,
        LAG(cte_1.encounter_stop_date) OVER(PARTITION BY cte_1.patients_id ORDER BY cte_1.encounter_start_date) as prev_encounter
FROM cte_1
)
SELECT cte_2.id
FROM cte_2
WHERE cte_2.encounter_stop_date + interval '1 month' > cte_2.prev_encounter
)

SELECT en.id,
    en.start:: DATE AS encounter_start_date,
    en.Stop::DATE AS encounter_Stop_date,
    ROUND(EXTRACT(EPOCH FROM AGE(en.Stop::TIMESTAMP,en.start:: TIMESTAMP))/3600,1) AS total_encounter_hours,
    TO_CHAR(en.start::TIMESTAMP,'HH12 AM') AS encounter_time,
    en.patient AS patients_id,
    en.Organization AS organizations_id,
    en.Payer AS payers_id,
    en.Base_Encounter_Cost,
    en.Total_Claim_Cost,
    en.Payer_Coverage,
    en.EncounterClass,
    en.Description,
    en.ReasonDescription,
    CASE
    WHEN en.id IN (cte_3.id) THEN 'Re Admitted'
    ELSE 'Admitted'
    END AS encounter_status
FROM silver.encounters en
LEFT JOIN cte_3 ON cte_3.id=en.id;
================================
DROP VIEW IF EXISTS gold.procedures_fact;
CREATE VIEW gold.procedures_fact as
SELECT
ROW_NUMBER() OVER (ORDER BY sp.start ASC) AS id,
sp.start::TIMESTAMP AS procedure_start_date,
sp.stop::TIMESTAMP AS procedure_stop_date,
se.organization AS organizations_id,
se.Payer AS payers_id,
sp.patient AS patients_id,
sp.encounter AS encounters_id,
sp.Description,
sp.Base_Cost as encounter_base_cost,
sp.ReasonDescription
FROM silver.procedures sp
LEFT JOIN silver.encounters se ON sp.encounter=se.id 
;

===========================================================

