WITH src_employer AS (SELECT * FROM {{ ref('src_employer') }})

SELECT 
    {{dbt_utils.generate_surrogate_key(['id', 'employer_name'])}} AS employer_id,
    employer_name,
    employer_workplace,
    coalesce(employer_organization_number, 'Org not specified') AS employer_organization_number,
    coalesce(employer_url, 'URL not specified') AS employer_url,
    {{capitalize_first_letter("coalesce(workplace_street_address, 'address not specified')")}} AS workplace_street_address,
    coalesce(workplace_postcode, 'Postcode not specified') AS workplace_postcode,
    {{capitalize_first_letter("coalesce(workplace_city, 'city not specified')") }} AS workplace_city,
    workplace_region,
    workplace_country
FROM src_employer