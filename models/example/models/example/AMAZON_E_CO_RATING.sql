{{ config(materialized='table',transient=true)}}

WITH sub AS (
  SELECT UNIQ_ID
,PRODUCT_NAME,NUMBER_OF_ANSWERED_QUESTIONS,AVERAGE_REVIEW_RATING,NUMBER_OF_REVIEWS,
PRICE,
NUMBER_AVAILABLE_IN_STOCK, DENSE_RANK() OVER (ORDER BY AVERAGE_REVIEW_RATING desc) as rn
  FROM {{ ref('AMAZON_E_COM_DATA') }}
)
SELECT UNIQ_ID
,PRODUCT_NAME,NUMBER_OF_ANSWERED_QUESTIONS,NUMBER_OF_REVIEWS,
PRICE,
NUMBER_AVAILABLE_IN_STOCK,regexp_replace(AVERAGE_REVIEW_RATING,'[^0-9.]','') as AVERAGE_REVIEW_RATING
FROM sub
WHERE rn <= 10





