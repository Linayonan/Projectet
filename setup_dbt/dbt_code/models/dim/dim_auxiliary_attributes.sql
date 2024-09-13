WITH src_auxiliary_attributs AS (SELECT * FROM {{ ref('src_auxiliary_attributs') }})

SELECT 
    {{dbt_utils.generate_surrogate_key (['id', 'experience_required'])}} AS auxiliary_attributes_id,
    experience_required,
    driver_license,
    access_to_own_car

FROM src_auxiliary_attributs