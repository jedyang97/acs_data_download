import os

import requests
import argparse
import us
import urllib.parse

import numpy as np
import pandas as pd

from tqdm import tqdm


def get_json_from_url(url):
    response = requests.get(url, allow_redirects=True)
    response = response.json()

    return response


def compose_urls(year, list_variables, state, geography):
    # Example URL:
    # https://api.census.gov/data/2018/acs/acs5?get=B00001_001E&for=block%20group:*&in=state:01%20county:025&key=YOUR_KEY_GOES_HERE

    assert geography in ['block group', 'state', 'consolidated city', 'zip code tabulation area']
    base_url = f'https://api.census.gov/data/{year}/acs/acs5?'

    county_url_list = []

    state_fips = us.states.lookup(state).fips

    # get all counties' fips in this state
    params_for_all_county_fips = {'get': 'NAME',
                                  'for': 'county:*',
                                  'in': f'state:{state_fips}',
                                  }
    url_for_all_county_fips = base_url + urllib.parse.urlencode(params_for_all_county_fips)
    json_for_all_county_fips = get_json_from_url(url_for_all_county_fips)
    list_all_count_fips = np.array(json_for_all_county_fips)[1:, -1].tolist()

    for county_fips in list_all_count_fips:
        params = {'get': ','.join(list_variables),
                  'for': f'{geography}:*',
                  'in': ' '.join([f'state:{state_fips}', f'county:{county_fips}']),
                  }

        county_url_list.append(base_url + urllib.parse.urlencode(params))

    return county_url_list


def map_variable_ids_to_names(list_variable_ids):
    json_variables_id_to_name_map = get_json_from_url('https://api.census.gov/data/2018/acs/acs5/variables.json')
    names = []
    for variable_id in list_variable_ids:
        if variable_id in json_variables_id_to_name_map:
            names.append(json_variables_id_to_name_map[variable_id]['label'])
        else:
            names.append(variable_id)
    return names


def get_args():
    parser = argparse.ArgumentParser()

    # required args
    parser.add_argument("--year", type=str, required=True, help="the year you want to download the data from")
    parser.add_argument("--state", type=str, required=True,
                        help="the state you want to download the data from, e.g. PA, GA")
    parser.add_argument("--variables", nargs='+', required=True,
                        help="the list of variables you want to query, space separated")
    parser.add_argument("--geography", type=str, required=True,
                        help="the geography level you want to use")

    # optional args
    parser.add_argument("--out_dir", type=str, default='.',
                        help="which directory you want to save the .csv file at")

    return parser.parse_args()


if __name__ == '__main__':

    args = get_args()

    list_url_per_geography = compose_urls(year=args.year,
                                          list_variables=args.variables,
                                          state=args.state,
                                          geography=args.geography)

    df_result = pd.DataFrame()
    for idx, url_per_geography in enumerate(tqdm(list_url_per_geography)):
        json_data = get_json_from_url(url_per_geography)

        # first row is always header
        list_names = map_variable_ids_to_names(json_data[0])
        df_county = pd.DataFrame.from_records(json_data[1:], columns=list_names)
        df_result = df_result.append(df_county)


    df_result.to_csv(os.path.join(args.out_dir, 'output.csv'), index=False)
