from src.prob_01 import validate

def test_valid_email():
	output_returned = validate("omkar.savoikar@infuse.it")
	assert b"{'Status' : 'Valid'}" == output_returned.data

def test_valid_status():
	output_returned = validate("omkar.savoikar@infuse.it")
	assert 200 == output_returned.status_code

def test_invalid_status():
	output_returned = validate("omkar.savoikarinfuse.it")
	assert 400 == output_returned.status_code

def test_invalid_email_without_at_the_rate():
	output_returned = validate("omkar.savoikarinfuse.it")
	assert b"{'Status' : 'Not Valid'}" == output_returned.data

def test_invalid_email_without_dot():
	output_returned = validate("omkar.savoikar@infuseit")
	assert b"{'Status' : 'Not Valid'}" == output_returned.data

def test_invalid_email_without_at_the_rate_and_dot():
	output_returned = validate("omkar.savoikarinfuseit")
	assert b"{'Status' : 'Not Valid'}" == output_returned.data

def test_invalid_email_without_body():
	output_returned = validate("@infuseit")
	assert b"{'Status' : 'Not Valid'}" == output_returned.data

def test_invalid_email_without_domain():
	output_returned = validate("omkar.savoikar@infuse")
	assert b"{'Status' : 'Not Valid'}" == output_returned.data