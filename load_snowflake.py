import dlt
import requests
import json
from pathlib import Path
import os

def _get_ads(url_for_search, params):
    headers = {'accept': 'application/json'}
    response = requests.get(url_for_search, headers=headers, params=params)
    response.raise_for_status()  # check for http errors
    return json.loads(response.content.decode('utf8'))

@dlt.source
def load_snowflake_source(api_secret_key: str = dlt.secrets.value):
    # print(f"api_secret_key={api_secret_key}")
    return load_snowflake_resource(api_secret_key)


@dlt.resource(write_disposition="replace")
def load_snowflake_resource(params):
    url = 'https://jobsearch.api.jobtechdev.se'
    url_for_search = f"{url}/search"

    for ad in _get_ads(url_for_search, params)["hits"]:
        yield ad

def run_pipeline(query, table_name):
    pipeline = dlt.pipeline(
        pipeline_name="jobsearch", #namn på pipelinen, om du vill testköra så kan du byta namn annars måste kan man behöva deleta den gamla om man hade en gammal
        destination="snowflake",
        dataset_name="econom_ads.staging" #lägg scheman här
    )

    params = {"q": query, "limit": 100}
    load_info = pipeline.run(load_snowflake_resource(params=params), table_name=table_name)
    print(load_info)


if __name__ == "__main__":
    working_directory = Path(__file__).parent
    os.chdir(working_directory)

    query= "ekonomi"
    query= "economy"
    query= "sales"
    query= "ekonom"
    query= "account manager"
    query= "invest"
    query= "investment"
    query = "salesman"
    query = "bank"
    query = "redovisning"
    query = "administratör"
    
    table_name = "econom_ads"

    run_pipeline(query, table_name)
