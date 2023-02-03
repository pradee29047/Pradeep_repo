{{ config(materialized='table',transient=true)}}

WITH total_products AS (
  SELECT COUNT(*) AS count
  FROM {{ ref('AMAZON_E_COM_DATA') }}
), in_stock AS (
  SELECT COUNT(*) AS count
  FROM {{ ref('AMAZON_E_COM_DATA') }}
  WHERE NUMBER_AVAILABLE_IN_STOCK > 0 AND NUMBER_AVAILABLE_IN_STOCK IS NOT NULL
  AND NUMBER_AVAILABLE_IN_STOCK <> ''
)
SELECT (in_stock.count * 100.0) / total_products.count AS percent_in_stock
FROM total_products, in_stock
