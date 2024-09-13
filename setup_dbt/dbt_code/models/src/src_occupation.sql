WITH stg_econom_job_ads AS (SELECT * FROM {{ source('econom_ads', 'stg_econom_ads') }})

SELECT 
    id,
    occupation__label AS occupation_label,
    occupation_group__label AS occupation_group_label,
    occupation_field__label AS occupation_field_label
FROM stg_econom_job_ads