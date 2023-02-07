from user_repository import UserRepository

class UserActions:
	def __init__(self) -> None:
		self.user_repo = UserRepository()
	
	def add_user(self, name, age):
		try:
			item = self.user_repo.add_user(name, age)
			return item
		except Exception as e:
			print(e)
			return {}