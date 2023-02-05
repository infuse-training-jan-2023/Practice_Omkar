from sports import Sports
import unittest

class TestSports(unittest.TestCase):
	def test_instance_of_Sports(self):
		sports = Sports(["Cricket", "TT", "Football", "Hockey"])
		assert(isinstance(sports, Sports))
	
	def test_skip_sports_check_skip_greater_than_length(self):
		sports = Sports(["Cricket", "TT", "Football", "Hockey"])
		self.assertEqual(sports.skip_sports(10), "Index out of range")
	
	def test_skip_sports_check_input_less_than_zero(self):
		sports = Sports(["Cricket", "TT", "Football", "Hockey"])
		self.assertEqual(sports.skip_sports(-1), "Index out of range")
	
	def test_skip_sports(self):
		sports = Sports(["Cricket", "TT", "Football", "Hockey"])
		self.assertEqual(sports.skip_sports(2), {2: 'Football', 3: 'Hockey'})