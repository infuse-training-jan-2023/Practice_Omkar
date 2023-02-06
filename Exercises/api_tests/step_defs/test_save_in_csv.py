import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/save_in_csv.feature')

url = "http://127.0.0.1:5000/save"

@when('I save items in a CSV file')
def get_all_items():
  pytest.api_response = requests.get(url)

@then('The item should get added in a CSV file')
def check_the_items_returned():
  body = pytest.api_response.json()
  assert type(body) == dict

@then('the api status code should be 200')
def check_status_code():
  assert pytest.api_response.status_code == 200

@then('the api response content type should be application/json')
def check_content_type():
  assert pytest.api_response.headers['Content-type'] == 'application/json'