USE ROLE econom_dlt_role;

USE DATABASE econom_ads;

SHOW SCHEMAS;

DESC TABLE staging.econom_field_ads;

SELECT headline, employer__workplace
FROM staging.econom_field_ads;

SHOW TABLES IN SCHEMA staging;