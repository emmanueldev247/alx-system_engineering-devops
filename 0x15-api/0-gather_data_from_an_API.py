#!/usr/bin/python3
"""Script that uses a REST API, for a given employee ID, returns
information about his/her TODO list progress."""

import requests
import sys


def empApi():
    """Fetches employee data from the API"""
    base_url = 'https://jsonplaceholder.typicode.com/'
    emp_id = sys.argv[1]
    response = requests.get(base_url+f'users/{emp_id}')

    if response.status_code == 200:
        json_data = response.json()
    else:
        print('Error:', response.status_code)
        sys.exit()

    emp_id = int(emp_id)
    emp_name = json_data.get("name")

    response = requests.get(base_url+'todos/')
    if response.status_code == 200:
        json_data = response.json()
    else:
        print('Error:', response.status_code)
        sys.exit()

    todo_count = 0
    completed = []

    for x in json_data:
        user_id = x.get("userId")
        is_completed = x.get("completed")

        if user_id == emp_id:
            todo_count += 1
            if is_completed:
                completed.append(x.get("title"))

    print('Employee {} is done with tasks({}/{}):'.format(
                                        emp_name, len(completed), todo_count))
    for i in completed:
        print("\t {}".format(i))


if __name__ == "__main__":
    empApi()
