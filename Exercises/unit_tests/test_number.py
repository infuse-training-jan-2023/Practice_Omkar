from src.prob_03 import validate

def test_valid_number():
	output_returned = validate(1)
	assert b'{"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}' == output_returned.data

def test_valid_status():
	output_returned = validate(1)
	assert 500 == output_returned.status_code

def test_invalid_number_less_than_one():
	output_returned = validate(0)
	assert b"{'Error': 'Invalid input'}" == output_returned.data

def test_invalid_number_greater_than_two_hundred():
	output_returned = validate(201)
	assert b"{'Error': 'Invalid input'}" == output_returned.data