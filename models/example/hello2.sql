{{ config(materialized='table',transient=true)}}

select *
from 
SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS
where O_TOTALPRICE>9000