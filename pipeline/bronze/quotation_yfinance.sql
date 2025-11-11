CREATE OR REFRESH STREAMING LIVE TABLE quotation_yfinance
TBLPROPERTIES ("quality" = "bronze")
AS
SELECT *,
       current_timestamp() as ingested_at
FROM cloud_files(
  '/Volumes/lakehouse/raw_public/quotation_yfinance',
  'csv',
  map('header', 'true',
      'inferSchema', 'true')
);