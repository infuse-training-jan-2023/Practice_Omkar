from Exercise_03.sports import Sports
import unittest

class TestSports(unittest.TestCase):
	def setUp(self):
		self.sports = Sports(["Cricket", "TT", "Football", "Hockey"])

	def test_instance_of_Sports(self):
		assert(isinstance(self.sports, Sports))
	
	def test_skip_sports_check_skip_greater_than_length(self):
		self.assertEqual(self.sports.skip_sports(10), "Index out of range")
	
	def test_skip_sports_check_input_less_than_zero(self):
		self.assertEqual(self.sports.skip_sports(-1), "Index out of range")
	
	def test_skip_sports(self):
		self.assertEqual(self.sports.skip_sports(2), {2: 'Football', 3: 'Hockey'})