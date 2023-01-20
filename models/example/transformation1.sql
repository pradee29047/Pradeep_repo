{{ config(materialized='table',transient=true)}}


with source_data as
(
select 
count(*) as count_sales ,YEAR(O_ORDERDATE) AS year,
MONTH(O_ORDERDATE) AS month
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.orders 
group by O_ORDERDATE
order by O_ORDERDATE)
select month,year,max(count_sales) as max_sales
from source_data
group by month,year
order by month,year








