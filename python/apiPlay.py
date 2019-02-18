import requests

response = requests.get("https://magauran.herokuapp.com")

# Print the status code of the response.
print(response.status_code)
