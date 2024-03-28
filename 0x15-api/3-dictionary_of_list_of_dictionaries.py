#!/usr/bin/python3
"""Script to export data in the JSON format"""

import json
import requests
import sys


def usersAPI():
    """fetch all users data from the API"""
    base_url = 'https://jsonplaceholder.typicode.com/'
    response = requests.get(base_url+f'users/')

    if response.status_code == 200:
        json_data = response.json()
    else:
        print('Error:', response.status_code)
        sys.exit()

    data = {}
    for user in json_data:
        id = user.get("id")
        tasks = empAPI(id)

        data[str(id)] = tasks

    exportJSON(data, id)


def empAPI(emp_id):
    """fetch employee data from the API
    Args:
        emp_id: ID of employee whose data is to be fetched

    Return: tasks that are owned by this employee
    """
    base_url = 'https://jsonplaceholder.typicode.com/'
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

    tasks = []

    for x in json_data:
        task = {}
        if x.get("userId") == emp_id:
            task["username"] = emp_username
            task["task"] = x.get("title")
            task["completed"] = x.get("completed")

            tasks.append(task)

    return tasks


def exportJSON(data, user_id):
    """
    Exports data to a JSON file named after the user ID

    Args:
        data: A list of dictionaries, where each dictionary contains data:
             "task": "TASK_TITLE", "completed": TASK_COMPLETED_STATUS,
             "username": "USERNAME"
        user_id: The ID of the user whose data are being exported.
  """
    filename = "todo_all_employees.json"

    with open(filename, "w") as jsonfile:
        json.dump(data, jsonfile)


if __name__ == "__main__":
    usersAPI()
