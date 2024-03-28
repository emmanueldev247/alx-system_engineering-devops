#!/usr/bin/python3
"""Script to export data in the CSV format"""

import csv
import requests
import sys


def empAPI():
    """Exports task data to a CSV file"""
    base_url = 'https://jsonplaceholder.typicode.com/'
    emp_id = sys.argv[1]

    response = requests.get(base_url+f'users/{emp_id}')

    if response.status_code == 200:
        json_data = response.json()
    else:
        print('Error:', response.status_code)
        sys.exit()

    emp_id = int(emp_id)
    emp_username = json_data.get("username")

    response = requests.get(base_url+'todos/')
    if response.status_code == 200:
        json_data = response.json()
    else:
        print('Error:', response.status_code)
        sys.exit()

    data = []

    for x in json_data:
        if x.get("userId") == emp_id:
            data.append([emp_id, emp_username,
                        x.get("completed"), x.get("title")])

    exportCSV(data, emp_id)


def exportCSV(data, user_id):
    """
    Exports data to a CSV file named after the user ID,
    with quotes around all data.

    Args:
        data: A list of lists, where each list contains data "USER_ID",
              "USERNAME", "TASK_COMPLETED_STATUS", and "TASK_TITLE".
        user_id: The ID of the user whose data are being exported.
  """
    filename = f"{user_id}.csv"

    with open(filename, "w", newline="") as csvfile:
        writer = csv.writer(csvfile, quoting=csv.QUOTE_ALL)
        writer.writerows(data)


if __name__ == "__main__":
    empAPI()
