import snowflake.connector

conn = snowflake.connector.connect(
    user='username',
    password='password',
    account='Account Identifier',
    warehouse='COMPUTE_WH',
    database='econom_ads',
    schema='econom_ads.staging',
    role='din role'
)