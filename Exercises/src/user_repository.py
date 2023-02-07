import sqlite3

class UserRepository:
	def __init__(self) -> None:
		self.DBPATH = "./todo.db"
		self.connection = None

	def connect_db(self):
		if self.connection == None:
			self.connection = sqlite3.connect(self.DBPATH, check_same_thread=False)
	
	def add_user(self,name, age):
		try:
			self.connect_db()
			c = self.connection.cursor()
			insert_cursor = c.execute("INSERT INTO users(name, age) VALUES(?, ?)", (name, age))
			self.connection.commit()
			return {
				'id': insert_cursor.lastrowid,
				'name': name,
				'age': age
			}
		except Exception as e:
			raise Exception("Error: ", e)