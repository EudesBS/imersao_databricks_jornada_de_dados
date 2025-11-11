CREATE OR REFRESH STREAMING LIVE TABLE transaction_commodities
TBLPROPERTIES ("quality" = "bronze")
AS
SELECT *,
       current_timestamp() as ingested_at
FROM cloud_files(
  '/Volumes/lakehouse/raw_public/transaction_commodities',
  'csv',
  map('header', 'true',
      'inferSchema', 'true')
);