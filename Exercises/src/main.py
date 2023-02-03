from flask import Flask, Response, request
from item_actions import ItemActions
from item_repository import ItemRepository
import json

app = Flask(__name__)
item_actions = ItemActions()
item_repository = ItemRepository()

@app.route('/', methods = ['GET'])
def welcome():
	return "Hello World"

@app.route('/items', methods = ['GET'])
def get_all_items():
	items = item_actions.get_all_items()
	return Response(json.dumps(items), mimetype='application/json', status=200)

@app.route('/item/<int:id>', methods = ['GET'])
def get_item(id):
	item = item_actions.get_item(id)
	if item == []:
		return Response("{'error': 'ID doesn't exist'}", mimetype='application/json', status=404)
	return Response(json.dumps(item), mimetype='application/json', status=200)

@app.route('/item', methods = ['POST'])
def additem():
	request_data = request.get_json()
	item = request_data['item']
	reminder = request_data['reminder']
	added_item = item_actions.add_item(item, reminder)
	if added_item == {}:
		return Response("{'error': 'Error addding the item'}", mimetype='application/json', status=500)
	return Response(json.dumps(added_item), mimetype='application/json', status=201)

@app.route('/item/<int:id>', methods = ['DELETE'])
def delete_item(id):
	deleted_item = item_actions.delete_item(id)
	if deleted_item == {}:
		return Response("{'error': 'Error deleting the item'}", mimetype='application/json', status=404)
	return Response(json.dumps(deleted_item), mimetype='application/json', status=201)

@app.route('/item/<int:id>', methods=['PUT'])
def update_item(id):
	request_data = request.get_json()
	try:
		item = request_data['item']
	except:
		item = None
	try:
		status = request_data['status']
	except:
		status = None
	try:
		reminder = request_data['reminder']
	except:
		reminder = None
	update = [item, status, reminder]
	updated_item = item_actions.update_item(id, update)
	if updated_item == {}:
		return Response("{'error': 'Error updating the item'}", mimetype='application/json', status=404)
	return Response(json.dumps(updated_item), mimetype='application/json', status=201)

@app.route('/user', methods = ['POST'])
def add_user():
	request_data = request.get_json()
	name = request_data["name"]
	age = request_data["age"]
	added_user = item_actions.add_user(name, age)
	if added_user == {}:
		return Response("{'error': 'Error addding the item'}", mimetype='application/json', status=500)
	return Response(json.dumps(added_user), mimetype='application/json', status=201)

@app.route("/save", methods = ['GET'])
def save_data():
	data = item_actions.save_data()
	if data == {}:
		return Response("{'error': 'Could not save data'}", mimetype='application/json', status=404)
	return Response(json.dumps(data), mimetype='application/json', status=200)

if __name__ == '__main__':
	app.run(debug = True, host='0.0.0.0', port=5000)