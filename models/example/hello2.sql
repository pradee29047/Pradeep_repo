{{ config(materialized='table',transient=true)}}

with orders as(
select *

from {{ source('jaffle_shop', 'orders') }}
)
select * from orders
where O_ORDERSTATUS in ('F')
