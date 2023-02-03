{{ config(materialized='table',transient=true)}}

SELECT STATE, LAST_UPDATE, max(TOTAL_POPULATION) as TOTAL_POPULATION
FROM PC_DBT_DB.DBT_PSAHU.CSV_DATASET_THIRD
GROUP BY STATE, LAST_UPDATE





select regexp_replace(PRICE,'[^0-9.]','') as PRICE
from "PC_DBT_DB"."DBT_PSAHU"."AMAZON_E_COM"