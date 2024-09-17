{% docs __overview__%}

# Job ad project

The Job Ad project aims to provide a structured and comprehensive view of job advertisements, specifically in the field of economics. combining data from multiple dimensions such as employers, job details, auxiliary attributes, and occupation information. The project uses a fact and dimensional modeling approach to efficiently store, query, and analyze job ad data for analytic purposes.

## Dimensional model

The dimensional model structure enables a clear overview of the data and flexible querying of job advertisement data across multiple dimensions. The star schema design simplifies the reporting process and allows easy navigation through relationships between fact and dimension tables.
 
![Final_dimensional_model](assets/Final_dimensional_model.png)

## Key Models

- **Fact Table (`fct_job_ads`)**: Contains key metrics and facts related to job ads such as relevance, vacancies, and application       deadline.
- **Dimension Tables**:
  - `dim_employer`: Stores details about the employers posting the job ads.
  - `dim_job_details`: Contains specifics of the job listings such as job title and employment type.
  - `dim_auxiliary_attributes`: Captures additional job requirements, such as experience or driver’s license.
  - `dim_occupation`: Stores information about job classifications and occupations.

## Next Steps

- Explore the lineage and relationships between different models.
- Check the data tests to ensure data quality and accuracy.

{% enddocs %}
