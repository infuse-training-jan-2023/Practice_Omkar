from item_repository import ItemRepository
import csv

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
			res = []
			res.append({
				'id': item[0],
				'item': item[1],
				'status': item[2],
				'reminder': item[3],
			})
			return res
		except Exception as e:
			print(e)
			return {}
	
	def update_item(self, id, request_data):
		try:
			item = self.item_repo.update_item(id, request_data)
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
	
	def save_data(self):
		try:
			rows = self.item_repo.get_all_items()
			fields = ['id', 'item', 'status', 'reminder']
			filename = "data.csv"
			res = []
			for row in rows:
				res.append({
					'id': row[0],
					'item': row[1],
					'status': row[2],
					'reminder': row[3]
				})
			with open(filename, "w") as file:
				writer = csv.DictWriter(file, fieldnames = fields)
				writer.writeheader()
				writer.writerows(res)
			return {
				'filename': filename,
				'status': 'Data Saved'
			}
		except Exception as e:
			print(e)
			return {}