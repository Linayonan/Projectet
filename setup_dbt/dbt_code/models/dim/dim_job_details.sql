WITH src_econom_details AS (SELECT * FROM {{ ref('src_econom_details') }})

SELECT 
    {{ dbt_utils.generate_surrogate_key(['id', 'headline'])}} AS econom_details_id,
    headline,
    "description",
    description_html,
    employment_type,
    coalesce(duration, 'Duration not specified') AS duration, 
    salary_type,
    scope_of_work_min,
    scope_of_work_max
FROM src_econom_details