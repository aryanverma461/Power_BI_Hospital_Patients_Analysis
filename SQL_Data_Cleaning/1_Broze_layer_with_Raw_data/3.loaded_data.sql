=================================================================================================================================

CREATE OR REPLACE PROCEDURE bronze.bronze_load()
LANGUAGE plpgsql
AS $$
BEGIN

TRUNCATE TABLE bronze.encounters;
COPY bronze.encounters FROM 'D:\DataAnalysis\Hospital_patient_record\data_csv_files\encounters.csv' DELIMITER ',' CSV HEADER;

TRUNCATE TABLE bronze.organizations;
COPY bronze.organizations FROM 'D:\DataAnalysis\Hospital_patient_record\data_csv_files\organizations.csv' DELIMITER ',' CSV HEADER;

TRUNCATE TABLE bronze.patients;
COPY bronze.patients FROM 'D:\DataAnalysis\Hospital_patient_record\data_csv_files\patients.csv' DELIMITER ',' CSV HEADER ;

TRUNCATE TABLE bronze.payers;
COPY bronze.payers FROM 'D:\DataAnalysis\Hospital_patient_record\data_csv_files\payers.csv' DELIMITER ',' CSV HEADER;

TRUNCATE TABLE bronze.procedures;
COPY bronze.procedures FROM 'D:\DataAnalysis\Hospital_patient_record\data_csv_files\procedures.csv' DELIMITER ',' CSV HEADER;

END;
$$;

=================================================================================================================================

-- Created a STORED PROCEDURE For the Bronze Layer TO Load_data_From CSVs AS: bronze.bronze_load()
CALL bronze.bronze_load()
-- Calling bronze.bronze_load() will get the updated data from the CSVs
=================================================================================================================================