WITH stg_econom_job_ads AS (SELECT * FROM {{ source('econom_ads', 'stg_econom_ads') }})

SELECT 
    id,
    number_of_vacancies AS vacancies,
    relevance, 
    application_deadline
FROM stg_econom_job_ads ORDER BY application_deadline ASC