USE ROLE SYSADMIN;

USE DATABASE econom_ads;

CREATE SCHEMA IF NOT EXISTS warehouse;

SHOW SCHEMAS IN DATABASE econom_ads;

USE ROLE securityadmin;

GRANT ROLE econom_dlt_role TO ROLE econom_dbt_role;

SHOW GRANTS TO ROLE econom_dbt_role;

GRANT USAGE,
CREATE TABLE,
CREATE VIEW ON SCHEMA econom_ads.warehouse TO ROLE econom_dbt_role;


GRANT SELECT,
INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA econom_ads.warehouse TO ROLE econom_dbt_role;
GRANT SELECT ON ALL VIEWS IN SCHEMA econom_ads.warehouse TO ROLE econom_dbt_role;

GRANT SELECT,
INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA econom_ads.warehouse TO ROLE econom_dbt_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA econom_ads.warehouse TO ROLE econom_dbt_role;
USE ROLE econom_dbt_role;

SHOW GRANTS ON SCHEMA econom_ads.warehouse;

