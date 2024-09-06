USE ROLE useradmin;
CREATE ROLE econom_streamlit_role;

USE ROLE securityadmin;

GRANT USAGE ON WAREHOUSE COMPUTE_WH TO ROLE econom_streamlit_role;

GRANT USAGE ON DATABASE econom_ads TO ROLE econom_streamlit_role;
GRANT USAGE ON SCHEMA econom_ads.marts TO ROLE econom_streamlit_role;
GRANT SELECT ON ALL TABLES IN SCHEMA econom_ads.marts TO ROLE econom_streamlit_role;
GRANT SELECT ON ALL VIEWS IN SCHEMA econom_ads.marts TO ROLE econom_streamlit_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA econom_ads.marts TO ROLE econom_streamlit_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA econom_ads.marts TO ROLE econom_streamlit_role;


GRANT ROLE econom_streamlit_role TO USER user_streamlit;
GRANT ROLE econom_streamlit_role TO USER SodahB;

USE ROLE econom_streamlit_role;

SHOW GRANTS TO ROLE econom_streamlit_role;
