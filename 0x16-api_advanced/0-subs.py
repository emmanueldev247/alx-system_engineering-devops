#!/usr/bin/python3
"""function that queries the Reddit API & returns the number of subscribers"""
import requests


def number_of_subscribers(subreddit):
    """The query function
        Args:
            subreddit - Subreddit to check for
        Return: The number of subs for the subreddit
    """

    url = f"https://oauth.reddit.com/r/{subreddit}/about"

    tok = ("eyJhbGciOiJSUzI1NiIsImtpZCI6IlNIQTI1NjpzS3dsMnlsV0VtMjVmcXhwTU40c"
           "WY4MXE2OWFFdWFyMnpLMUdhVGxjdWNZIiwidHlwIjoiSldUIn0.eyJzdWIiOiJ1c2"
           "VyIiwiZXhwIjoxNzEzMTEzMTk2Ljg3OTg5MSwiaWF0IjoxNzEzMDI2Nzk2Ljg3OTg"
           "5LCJqdGkiOiJIYWxVLXVwUnZUY2gzT213RGhuc2txUVVsUzdEVFEiLCJjaWQiOiJn"
           "NHgydmdOQXByS1d1YXNZdjl3NWZ3IiwibGlkIjoidDJfeTQ4dmsybXkyIiwiYWlkI"
           "joidDJfeTQ4dmsybXkyIiwibGNhIjoxNzEyODgwMTc4MTIyLCJzY3AiOiJlSnlLVn"
           "RKU2lnVUVBQURfX3dOekFTYyIsImZsbyI6OX0.Xyh5DjwWCJoGJWLQA_2AtAdgCbP"
           "ykQMjTkxhBjKU_9SpQST0SC5m6AUApDiKk0cC8QDFsdUqqC9nCTjO_TyYLZthUsRE"
           "dMLPj8jodJEfl6wn9wpUSrjTukVRHh_LZYdDfMY6rh5UlwbX-kPe6LBpGG2LfWhoT"
           "mghyvodKgcwVo-Tgm7WayP7xNrcLxniRVAqcTaLKpRsL6GkAjKyC1Um6_CA_4rwMi"
           "o2mMeb6sOWB51Ju2iWgxXAJVHlLN6LPZznAklDQwIEmIgSGHc0D2q7Cz9KTRP8TQi"
           "oZrb6lKA2CVRAIJQ5KvDLstZLY5wXNNffujdPxpj2joQPKF1kqTRBjQ"
           )

    headers = {
        'User-Agent': 'MyAPI/1.0',
        'Authorization': f'bearer {tok}'
    }

    response = requests.get(url, headers=headers)
    if response.status_code == 200:
        sub_count = response.json().get("data").get("subscribers")
        return sub_count
    else:
        return 0
