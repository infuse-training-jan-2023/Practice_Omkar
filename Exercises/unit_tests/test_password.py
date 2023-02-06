from src.prob_02 import validate

def test_valid_password():
	output_returned = validate("Omkar@Savoikar")
	assert b"{'Password' : 'Valid'}" == output_returned.data

def test_valid_status():
	output_returned = validate("Omkar@Savoikar")
	assert 200 == output_returned.status_code

def test_invalid_status():
	output_returned = validate("OmkarSavoikar")
	assert 400 == output_returned.status_code

def test_invalid_password_without_upper_case():
	output_returned = validate("omkar@savoikar")
	assert b"{'Password' : 'Not Valid'}" == output_returned.data

def test_invalid_password_without_special_char():
	output_returned = validate("OmkarSavoikar")
	assert b"{'Password' : 'Not Valid'}" == output_returned.data

def test_invalid_password_without_lower_case():
	output_returned = validate("OMKAR@SAVOIKAR")
	assert b"{'Password' : 'Not Valid'}" == output_returned.data