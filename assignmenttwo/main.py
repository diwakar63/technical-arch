import json
import requests

imds_server_base_url = "http://169.254.169.254"

instance_api_version = "2021-02-01"
instance_endpoint = imds_server_base_url + \
    "/metadata/instance?api-version=" + instance_api_version

proxies = {
    "http": None,
    "https": None
}


def api_call(endpoint):
    headers = {'Metadata': 'True'}
    json_obj = requests.get(endpoint, headers=headers, proxies=proxies).json()
    return json_obj


def main():
    instance_json = api_call(instance_endpoint)
    print("Instance provider data:")
    print_json_obj_to_terminal(instance_json)
    
def print_json_obj_to_terminal(json_obj):
    print(json.dumps(json_obj, sort_keys=True, indent=4, separators=(',', ': ')))    
    
    if __name__ == "__main__":
    main()
