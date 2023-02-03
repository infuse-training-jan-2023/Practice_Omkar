from item_repository import ItemRepository

class ItemActions:
	def __init__(self) -> None:
		self.item_repo = ItemRepository()

	def get_all_items(self):
		try:
			items = self.item_repo.get_all_items()
			res = []
			for item in items:
				res.append({
					'id': item[0],
					'item': item[1],
					'status': item[2],
					'reminder': item[3]
				})
			return res
		except Exception as e:
			print(e)
			return {}
	
	def get_item(self, id):
		try:
			item = self.item_repo.get_item(id)
			res = []
			for x in item:
				res.append({
					'id': x[0],
					'item': x[1],
					'status': x[2],
					'reminder': x[3]
				})
			return res
		except Exception as e:
			print(e)
			return {}
	
	def add_item(self, item, reminder):
		try:
			item = self.item_repo.add_item(item, reminder)
			return item
		except Exception as e:
			print(e)
			return {}
	
	def delete_item(self, id):
		try:
			item = self.item_repo.delete_item(id)
			return item
		except Exception as e:
			print(e)
			return {}
	
	def update_item(self, id, update):
		try:
			item = self.item_repo.update_item(id, update)
			res = []
			for x in item:
				res.append({
					'id': x[0],
					'item': x[1],
					'status': x[2],
					'reminder': x[3]
				})
			return res
		except Exception as e:
			print(e)
			return {}
	
	def add_user(self, name, age):
		try:
			item = self.item_repo.add_user(name, age)
			return item
		except Exception as e:
			print(e)
			return {}
	
	def save_data(self):
		try:
			item = self.item_repo.save_data()
			return item
		except Exception as e:
			print(e)
			return {}