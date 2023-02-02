from sports import Sports

class Test_Sports:
	def test_instance_of_Sports(self):
		sports = Sports(["Cricket", "TT", "Football", "Hockey"])
		assert(isinstance(sports, Sports))
	
	def test_skip_sports(self):
		sports = Sports(["Cricket", "TT", "Football", "Hockey"])
		assert(sports.skip_sports(2) == {2: 'Football', 3: 'Hockey'})
	
	def test_skip_sports_check_skip_greater_than_length(self):
		sports = Sports(["Cricket", "TT", "Football", "Hockey"])
		assert(sports.skip_sports(10) == "Index out of range")