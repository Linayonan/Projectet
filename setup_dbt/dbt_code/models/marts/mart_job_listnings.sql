WITH fct_job_ads AS (SELECT * FROM {{ ref('fct_job_ads') }}),

job_details AS (SELECT * FROM {{ ref('dim_job_details') }}),
employer AS (SELECT * FROM {{ ref('dim_employer') }}),
auxiliary AS (SELECT * FROM {{ ref('dim_auxiliary_attributes') }}),
occupation AS (SELECT * FROM {{ ref('dim_occupation') }})

SELECT
    e.employer_name,
    e.workplace_city,
    jd.headline,
    jd."description",
    jd.emplpoyment_type,
    jd.salary_type,
    jd.scope_of_work_min,
    jd.scope_of_work_max,
    f.vacancies,
    f.relevance,
    jd.duration,
    a.experience_required,
    o.occupation_label,
    o.occupation_group_label

FROM fct_job_ads AS f
LEFT JOIN job_details AS jd 
    ON f.job_details_key = jd.econom_details_id
LEFT JOIN employer AS e
    ON f.employer_key = e.employer_id
LEFT JOIN auxiliary AS a 
    ON f.auxiliary_attributes_key = a.auxiliary_attributes_id
LEFT JOIN occupation AS o
    ON f.occupation_key = o.occupation_id
