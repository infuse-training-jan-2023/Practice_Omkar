import sqlite3

class ItemRepository:
	def __init__(self) -> None:
		self.DBPATH = "./todo.db"
		self.connection = None
		self.NOT_STARTED = "Not Started"

	def connect_db(self):
		if self.connection == None:
			self.connection = sqlite3.connect(self.DBPATH, check_same_thread=False)

	def get_all_items(self):
		try:
			self.connect_db()
			c = self.connection.cursor()
			rows = c.execute("SELECT * FROM items")
			return rows
		except Exception as e:
			raise Exception("Error: ", e)
	
	def get_item(self,id):
		try:
			self.connect_db()
			c = self.connection.cursor()
			row = c.execute("SELECT * FROM items WHERE id = " + str(id))
			return row.fetchone()
		except Exception as e:
			raise Exception("Error: ", e)
	
	def add_item(self, item, remineder):
		try:
			self.connect_db()
			c = self.connection.cursor()
			insert_cursor = c.execute("INSERT INTO items(item, status, reminder) VALUES(?, ?, ?)", (item, self.NOT_STARTED, remineder))
			self.connection.commit()
			return {
				'id': insert_cursor.lastrowid,
				'item': item,
				'status': self.NOT_STARTED,
				'reminder': remineder
			}
		except Exception as e:
			raise Exception("Error: ", e)
	
	def delete_item(self,id):
		try:
			self.connect_db()
			c = self.connection.cursor()
			insert_cursor = self.get_item(id)
			res = insert_cursor.fetchone()
			if res == []:
				raise TypeError("Invalid ID")
			c.execute("DELETE FROM items WHERE id = " + str(id))
			self.connection.commit()
			return res
		except Exception as e:
			raise Exception("Error: ", e)

	def update_item(self, id, request_data):
		try:
			self.connect_db()
			c = self.connection.cursor()
			insert_cursor = self.get_item(id)
			res = insert_cursor.fetchone()[0]
			if res == []:
				raise TypeError("Invalid ID")
			for key, value in request_data.items():
				insert_cursor = c.execute(f'UPDATE items SET {key} = ? WHERE id = ?', (value, id, ))
				self.connection.commit()
			insert_cursor = self.get_item(id)
			return insert_cursor
		except Exception as e:
			raise Exception("Error: ", e)