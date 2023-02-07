from flask import Flask, Response
import requests
import json

app = Flask(__name__)

@app.route('/', methods = ['GET'])
def welcome():
	return "Hello World"

@app.route('/validate/<int:num>', methods = ['GET'])
def validate(num):
	try:
		if (num < 1) or (num > 200):
			raise TypeError("Invalid input")
		url = "https://jsonplaceholder.typicode.com/todos/" + str(num)
		res = requests.get(url)
		data = res.json()
		output = json.dumps(data)
		stat = 200
		if res == {}:
			output = "{'Error': 'Error fetching item'}"
			stat = 404
		return Response(output, mimetype='application/json', status=stat)
	except:
		return Response("{'Error': 'Invalid input'}", mimetype='application/json', status=404)

if __name__ == '__main__':
	app.run(debug = True, host='0.0.0.0', port=5000)