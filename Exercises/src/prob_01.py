from flask import Flask, Response, request
import re

app = Flask(__name__)

@app.route('/', methods = ['GET'])
def welcome():
	return "Hello World"

@app.route('/validate/<string:email>', methods = ['GET'])
def validate(email):
	regex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$"
	match = re.findall(regex, email)
	if match:
		output = "{'Status' : 'Valid'}"
		return Response(output, mimetype='application/json', status=200)
	else:
		output = "{'Status' : 'Not Valid'}"
		return Response(output, mimetype='application/json', status=500)

if __name__ == '__main__':
	app.run(debug = True, host='0.0.0.0', port=5001)