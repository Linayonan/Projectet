WITH jobads AS (SELECT * FROM {{ ref('src_econom_ads') }}),

jobdetails AS (SELECT * FROM {{ ref('src_econom_details') }}),

e AS (SELECT * FROM {{ ref('src_employer') }}),

o AS (SELECT * FROM {{ ref('src_occupation') }}),

aa AS (SELECT * FROM {{ ref('src_auxiliary_attributs') }})

SELECT 
    jobads.id AS fct_job_id,
    {{dbt_utils.generate_surrogate_key(['jobdetails.id', 'jobdetails.headline'])}} AS job_details_key,
    {{dbt_utils.generate_surrogate_key(['e.id', 'e.employer_name'])}} AS employer_key,
    {{dbt_utils.generate_surrogate_key(['o.id', 'o.occupation_label'])}} AS occupation_key,
    application_deadline,
    {{dbt_utils.generate_surrogate_key(['aa.id', 'aa.experience_required'])}} AS auxiliary_attributes_key,
    vacancies,
    relevance
FROM jobads
JOIN jobdetails ON jobads.id = jobdetails.id
JOIN e ON jobads.id = e.id 
JOIN o ON jobads.id = o.id  
JOIN aa ON jobads.id = aa.id