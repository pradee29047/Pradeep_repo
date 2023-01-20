
{{ config(materialized='table',transient=true)}}

select 
*
-- CUSTOMER.C_CUSTKEY,CUSTOMER.C_NAME,orders.O_ORDERKEY
from 
SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER
as CUSTOMER
left join SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.orders
on CUSTOMER.C_CUSTKEY = orders.O_CUSTKEY



