import sqlite3
import json
import csv

class ItemRepository:
	NOT_STARTED = "Not Started"
	DBPATH = "./todo.db"

	@staticmethod
	def connect_db():
		return sqlite3.connect(ItemRepository.DBPATH)

	@staticmethod
	def get_all_items():
		try:
			conn = ItemRepository.connect_db()
			c = conn.cursor()
			rows = c.execute("SELECT * FROM items")
			return rows
		except Exception as e:
			raise Exception("Error: ", e)
	
	@staticmethod
	def get_item(id):
		try:
			conn = ItemRepository.connect_db()
			c = conn.cursor()
			row = c.execute("SELECT * FROM items WHERE id = " + str(id))
			return row
		except Exception as e:
			raise Exception("Error: ", e)
	
	@staticmethod
	def add_item(item, remineder):
		try:
			conn = ItemRepository.connect_db()
			c = conn.cursor()
			insert_cursor = c.execute("INSERT INTO items(item, status, reminder) VALUES(?, ?, ?)", (item, ItemRepository.NOT_STARTED, remineder))
			conn.commit()
			return {
				'id': insert_cursor.lastrowid,
				'item': item,
				'status': ItemRepository.NOT_STARTED,
				'reminder': remineder
			}
		except Exception as e:
			raise Exception("Error: ", e)
	
	@staticmethod
	def delete_item(id):
		try:
			conn = ItemRepository.connect_db()
			c = conn.cursor()
			insert_cursor = ItemRepository.get_item(id)
			res = []
			for item in insert_cursor:
				res.append({
					'id': item[0],
					'item': item[1],
					'status': item[2],
					'reminder': item[3]
				})
			if res == []:
				raise TypeError("Invalid ID")
			insert_cursor = c.execute("DELETE FROM items WHERE id = " + str(id))
			conn.commit()
			return res
		except Exception as e:
			raise Exception("Error: ", e)

	@staticmethod
	def update_item(id, update):
		try:
			conn = ItemRepository.connect_db()
			c = conn.cursor()
			insert_cursor = ItemRepository.get_item(id)
			res = []
			for item in insert_cursor:
				res.append({
					'id': item[0]
				})
			if res == []:
				raise TypeError("Invalid ID")
			query = "UPDATE items SET "
			if update[0] is not None:
				query += ("item = '" + str(update[0]) + "',")
			if update[1] is not None:
				query += (" status = '" + str(update[1]) + "',")
			if update[2] is not None:
				query += (" reminder = " + str(update[2]))
			query += (" WHERE id = " + str(id))
			print(query)
			insert_cursor = c.execute(query)
			conn.commit()
			insert_cursor = ItemRepository.get_item(id)
			return insert_cursor
		except Exception as e:
			raise Exception("Error: ", e)
		
	@staticmethod
	def add_user(name, age):
		try:
			conn = ItemRepository.connect_db()
			c = conn.cursor()
			insert_cursor = c.execute("INSERT INTO users(name, age) VALUES(?, ?)", (name, age))
			conn.commit()
			return {
				'id': insert_cursor.lastrowid,
				'name': name,
				'age': age
			}
		except Exception as e:
			raise Exception("Error: ", e)

	@staticmethod
	def save_data():
		try:
			rows = ItemRepository.get_all_items()
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
			raise Exception("Error: ", e)