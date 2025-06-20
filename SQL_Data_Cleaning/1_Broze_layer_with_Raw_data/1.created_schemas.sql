/* Created three schemas bronze, silver, gold
    bronze: It will contain all the raw data exactly like the CSVs
    silver: It will contain all the Data Cleaning and processing hence Clean data
    gold: It will Contain views not Tables A view according to businnes user case and Dshboard Prep
*/    

-- Schemas creation script

-- bronze: It will contain all the raw data exactly like the CSVs
CREATE SCHEMA bronze;

-- silver: It will contain all the Data Cleaning and processing hence Clean data
CREATE SCHEMA silver;

-- gold: It will Contain views not Tables A view according to businnes user case and Dshboard Prep
CREATE SCHEMA gold ;

