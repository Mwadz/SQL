
use project1;

/* Data Preview */

select *
from nashvillehousing;



/* 1.
 Normalizing date format */

SELECT SaleDate
FROM project1.nashvillehousing;


SELECT  STR_TO_DATE(SaleDate, '%m/%d/%Y')
FROM    yourtable

/* confirming datatype conversion */

SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS 
  WHERE table_name = 'nashvillehousing' AND COLUMN_NAME = 'SaleDate';