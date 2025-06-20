# Hospital Patient Encounter Dashboard
> ## Tracking Patient Admissions and Readmissions (2011–2022)

![](Power_Bi_Reports\GIF_Dashboard.gif)

## 📌 Overview
This dashboard project analyzes synthetic patient encounter data from Massachusetts General Hospital (~1,000 patients) over a 12-year period. It tracks Total Encounters, New admissions, Readmissions, and time-based trends to assist healthcare professionals and analysts in identifying volume patterns and optimizing patient flow.

## ⛓️‍💥 Project Data Model
![](Power_Bi_Reports\Data_Model.png)

## 🛠️ Skills & Tools Used (SQL+ POWER BI)

> ### 🧼 SQL (Data Cleaning/Preparation)
1) Cleaned and transformed raw data using **CTEs**, **String functions**, **Subqueries**, and **CASE statements**

2) Applied **Window functions** for advanced calculations and ranking logic

3) **Created and normalized tables** using ***joins, views, and stored procedures***

4) Performed **ETL** operations to prepare structured data for analysis
### 🗄️ SQL Scripts

You can find all the SQL scripts used for data cleaning, table creation, and modifications in the [`SQL_Data_Cleaning`](SQL_Data_Cleaning) folder:

- [Data Cleaning Script](SQL_Data_Cleaning\2_Silver_layer_with_CLeaned_data\2_data_cleaning.sql)
- [Table Creation Script](SQL_Data_Cleaning\2_Silver_layer_with_CLeaned_data\1_create_table_silver.sql)
- [Final Table Modifications Script](SQL_Data_Cleaning\3_Gold_layer_With_Business_Ready_date\gold_view.sql)

> ### 📊Power BI (Data Visualization , Reporting & DAX)
1) Built an interactive dashboard with **Data modeling, DAX measures, and KPI cards**

2) Used **explicit measures**, **charts**, **tables**, slicers, and **Drill-through pages** for deep-dive analysis

3) Implemented custom *time intelligence* and *filtering for trends across monthly, quarterly, and time-slot levels*

> ### 📊 Data Analysis
1) Identified patterns in patient admissions and readmissions

2) Detected anomalies and seasonal trends

3) Delivered actionable insights for hospital operations and resource planning

## 📈 Visuals & Trends

> ### 📊 Key Insights from Admissions Trend Chart (2011–2022)
![](Power_Bi_Reports\Encounter_Trend_Linechart.png)

### ***Unusual Spike in 2013–2014***

- A sharp rise in total encounters suggests a potential mass admission event due to some Hazardous Disease Crisis.
- Stable Readmission & New Admission Rates
Despite fluctuations in total encounters indicating efficient patient care and low return rates.

### ***Post-2020 Recovery & Drop in 2022***
- A slight increase in encounters after 2020 reflects delayed care post-COVID, followed by a dip in 2022 that may align with seasonal or operational shifts.

> ### 📊 Key Insights from Encounters Over Week

![](Power_Bi_Reports\Encounter_Over_week_Horizontal_BarChart.png)

***🏥 How This Helps Hospital Administration
When slicing by encounter class, gender, age group, year, or quarter, this visual enables:***
| Slicer Used       | What It Helps Track                                                      |
|-------------------|---------------------------------------------------------------------------|
| Encounter Class   | Identify which services are most used on which days (e.g., ER spikes)     |
| Gender            | Explore gender-based preferences in weekday visits                        |
| Age Group         | Determine if certain age groups avoid weekends or prefer midweek visits   |
| Year / Quarter    | Track how weekday trends shift over time (e.g., post-COVID patterns)      |

>### ⏰ Hourly Encounter Chart: How This Helps Hospital Administration
![](Power_Bi_Reports\Encounters_Over_time.png)

***How This Helps Hospital Administration ?***
| Slicer Used       | What It Helps Track                                                        |
|-------------------|-----------------------------------------------------------------------------|
| Encounter Class   | Identify peak emergency hours vs scheduled outpatient or routine care       |
| Age Group         | Understand time preferences by patient demographics (e.g., elderly mornings)|
| Gender            | Analyze if specific services dominate certain hours                         |
| Year / Quarter    | Detect changes in hourly load due to policy or seasonal trends              |
> ### 🧍 Top Patient Table: How This Helps Hospital Administration
![](Power_Bi_Reports\Top_10_patients.png)
***What Analysis can be done using this visual table?***
| Slicer Used       | What It Helps Track                                                           |
|-------------------|--------------------------------------------------------------------------------|
| Age Group / Gender| Identify if high-frequency users are from vulnerable demographics             |
| Payer Type        | Track resource impact of high-use patients across insurance providers         |
| Encounter Class   | Understand the type of care most used by repeat visit patients                |

![](Power_Bi_Reports\Dashboard_Overview.png)

## 📍 Business Use Case
This dashboard provides critical insights into hospital capacity, readmission rates, and daily operational load, making it valuable for:

>Hospital administrators

>Healthcare analysts

>Patient flow optimization

>Quality of care tracking

Analyzed 1,000+ synthetic hospital patient records to track new admissions and readmissions over a decade. Created a Power BI dashboard to identify volume trends, optimize patient flow, and visualize time-based insights from 2011–2022.