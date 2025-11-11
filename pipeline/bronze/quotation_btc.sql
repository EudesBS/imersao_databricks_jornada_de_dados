CREATE OR REFRESH STREAMING LIVE TABLE quotation_btc
TBLPROPERTIES ("quality" = "bronze")
AS
SELECT *,
       current_timestamp() as ingested_at
FROM cloud_files(
  '/Volumes/lakehouse/raw_public/quotation_btc',
  'csv',
  map('header', 'true',
      'inferSchema', 'true')
);