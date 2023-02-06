from src.item_repository import ItemRepository

user = [
	(1, 'Omkar Savoikar', 23)
]

item_repo = ItemRepository()

def test_add_user_makes_db_call(mocker):
	mock = mocker.patch('src.item_repository.ItemRepository.add_user', return_value = [])
	_ = item_repo.add_user()
	assert mock.call_count == 1

def test_add_user(mocker):
	mock = mocker.patch('src.item_repository.ItemRepository.add_user', return_value = user)
	item_returned = item_repo.add_user()
	assert user == item_returned