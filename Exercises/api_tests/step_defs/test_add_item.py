import pytest
from pytest_bdd import scenarios, when, then
import requests

scenarios('../features/add_item.feature')

url = "http://127.0.0.1:5000/item"
item = {"item": "Sleep", "reminder": False}

@when('I add an item')
def get_all_items():
  pytest.api_response = requests.post(url, json=item)

@then('The item should get added')
def check_the_items_returned():
  body = pytest.api_response.json()
  assert type(body) == dict

@then('the api status code should be 201')
def check_status_code():
  assert pytest.api_response.status_code == 201

@then('the api response content type should be application/json')
def check_content_type():
  assert pytest.api_response.headers['Content-type'] == 'application/json'