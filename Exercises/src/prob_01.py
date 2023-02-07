from flask import Flask, Response, request
import json
import re

app = Flask(__name__)

@app.route('/', methods = ['GET'])
def welcome():
	return "Hello World"

@app.route('/validate', methods = ['GET'])
def validate():
	request_data = request.get_json()
	email = request_data['email']
	regex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$"
	match = re.findall(regex, email)
	output = "{'Status' : 'Not Valid'}"
	stat = 400
	if match:
		output = "{'Status' : 'Valid'}"
		stat = 200
	return Response(output, mimetype='application/json', status=stat)

if __name__ == '__main__':
	app.run(debug = True, host='0.0.0.0', port=5000)