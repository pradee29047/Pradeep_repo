{{ config(materialized='table',transient=true)}}


select * from(
select*,
count(O_ORDERPRIORITY) over (partition by O_ORDERPRIORITY order by O_ORDERDATE) as no_of_O_ORDERPRIORITY
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.orders)




