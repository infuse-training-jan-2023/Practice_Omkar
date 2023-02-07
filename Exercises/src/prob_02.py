from flask import Flask, Response, request
import re

app = Flask(__name__)

@app.route('/', methods = ['GET'])
def welcome():
	return "Hello World"

@app.route('/validate', methods = ['GET'])
def validate():
	request_data = request.get_json()
	password = request_data['password']
	regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9]).{8,}$"
	match = re.findall(regex, password)
	output = "{'Password' : 'Not Valid'}"
	stat = 400
	if match:
		output = "{'Password' : 'Valid'}"
		stat = 200
	return Response(output, mimetype='application/json', status=stat)

if __name__ == '__main__':
	app.run(debug = True, host='0.0.0.0', port=5000)