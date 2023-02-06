from src.item_repository import ItemRepository

item = [
	(3, 'Go to shopping', 'Not Started', 1)
]

item_repo = ItemRepository()

def test_get_item_makes_db_call(mocker):
	mock = mocker.patch('src.item_repository.ItemRepository.get_item', return_value = [])
	_ = item_repo.get_item()
	assert mock.call_count == 1

def test_get_item(mocker):
	mock = mocker.patch('src.item_repository.ItemRepository.get_item', return_value = item)
	item_returned = item_repo.get_item()
	assert item == item_returned