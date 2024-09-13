WITH stg_econom_job_ads AS (SELECT * FROM {{ source('econom_ads', 'stg_econom_ads') }})

SELECT 
    id,
    experience_required,
    driving_license_required AS driver_license,
    access_to_own_car
FROM stg_econom_job_ads