from flask import Flask, Response, request
import re

app = Flask(__name__)

@app.route('/', methods = ['GET'])
def welcome():
	return "Hello World"

@app.route('/validate/<string:password>', methods = ['GET'])
def validate(password):
	regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9]).{8,}$"
	match = re.findall(regex, password)
	if match:
		output = "{'Password' : 'Valid'}"
		return Response(output, mimetype='application/json', status=200)
	else:
		output = "{'Password' : 'Not Valid'}"
		return Response(output, mimetype='application/json', status=400)

if __name__ == '__main__':
	app.run(debug = True, host='0.0.0.0', port=5000)