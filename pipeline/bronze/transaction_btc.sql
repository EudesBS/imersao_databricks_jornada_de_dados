CREATE OR REFRESH STREAMING LIVE TABLE transaction_btc
TBLPROPERTIES ("quality" = "bronze")
AS
SELECT *,
       current_timestamp() as ingested_at
FROM cloud_files(
  '/Volumes/lakehouse/raw_public/transacation_btc',
  'csv',
  map('header', 'true',
      'inferSchema', 'true')
);