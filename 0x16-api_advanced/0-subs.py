#!/usr/bin/python3
"""function that queries the Reddit API & returns the number of subscribers"""
import requests


def number_of_subscribers(subreddit):
    """The query function
        Args:
            subreddit - Subreddit to check for
        Return: The number of subs for the subreddit
    """
    url = f"https://api.reddit.com/r/{subreddit}/about"

    # Setting a custom User-Agent to avoid too many requests error
    headers = {'User-Agent': 'My user Agent 1.0'}

    # send a GET request to the Reddit API
    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        sub_count = response.json().get("data").get("subscribers")
        return sub_count
    else:
        return 0
