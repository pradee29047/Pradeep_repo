
{{ config(materialized='table',transient=true)}}

with source_data as(
select *
from 
SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER
as CUSTOMER
left join SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.orders
on CUSTOMER.C_CUSTKEY = orders.O_CUSTKEY)

select *,
REGEXP_REPLACE(C_NAME,'[^0-9]','') as C_NAMES
from source_data
