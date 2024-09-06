USE ROLE SYSADMIN;

USE DATABASE econom_ads;

CREATE SCHEMA IF NOT EXISTS marts;

SHOW SCHEMAS IN DATABASE econom_ads;

USE ROLE securityadmin;

GRANT USAGE,
CREATE TABLE,
CREATE VIEW ON SCHEMA econom_ads.marts TO ROLE econom_dbt_role;

-- grant CRUD and select tables and views
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA econom_ads.marts TO ROLE econom_dbt_role;
GRANT SELECT ON ALL VIEWS IN SCHEMA econom_ads.marts TO ROLE econom_dbt_role;

-- grant CRUD and select on future tables and views
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA econom_ads.marts TO ROLE econom_dbt_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA econom_ads.marts TO ROLE econom_dbt_role;
USE ROLE econom_dbt_role;

SHOW GRANTS ON SCHEMA econom_ads.marts;

-- manual test
USE SCHEMA econom_ads.marts;
CREATE TABLE test (id INTEGER);
SHOW TABLES;
DROP TABLE TEST;