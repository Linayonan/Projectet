USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS econom_dlt_role;

USE ROLE SECURITYADMIN;

GRANT ROLE econom_dlt_role TO USER user_dlt;

GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE econom_dlt_role;
GRANT USAGE ON DATABASE econom_ads TO ROLE econom_dlt_role;
GRANT USAGE ON SCHEMA econom_ads.staging TO ROLE econom_dlt_role;
GRANT CREATE TABLE ON SCHEMA econom_ads.staging TO ROLE econom_dlt_role;

GRANT SELECT, INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA econom_ads.staging TO ROLE econom_dlt_role;
GRANT SELECT, INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA econom_ads.staging TO ROLE econom_dlt_role;