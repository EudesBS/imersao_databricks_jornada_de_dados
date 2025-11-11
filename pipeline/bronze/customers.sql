CREATE OR REFRESH STREAMING LIVE TABLE customers
TBLPROPERTIES ("quality" = "bronze")
AS
SELECT *,
       current_timestamp() as ingested_at
FROM cloud_files(
  '/Volumes/lakehouse/raw_public/customers',
  'csv',
  map('header', 'true',
      'inferSchema', 'true')
);