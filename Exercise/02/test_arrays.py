from arrays import ArrayManipulation
import unittest

class TestArrays(unittest.TestCase):
	def test_instance_of_ArrayManipulation(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		assert(isinstance(obj, ArrayManipulation))

	def test_element_at_check_index_less_than_zero(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual(obj.element_at(-1), "Index out of range")
		assert(obj.element_at(-1) == "Index out of range")

	def test_element_at_check_index_greater_than_array_length(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual(obj.element_at(10), IndexError)

	def test_element_at(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual(obj.element_at(0), 9)

	def test_inclusive_range_check_start_pos_less_than_zero(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual(obj.inclusive_range(-1, 5), "Index out of range")

	def test_inclusive_range_at_check_end_pos_greater_than_array_length(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual(obj.inclusive_range(-1, 10), "Index out of range")

	def test_inclusive_range_check_start_pos_greater_than_end_pos(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual(obj.inclusive_range(5, 4), "Index out of range")

	def test_inclusive_range(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual((obj.inclusive_range(0, 2)), [9, 5, 1])

	def test_non_inclusive_range_check_start_pos_less_than_zero(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual(obj.non_inclusive_range(-1, 5), "Index out of range")

	def test_non_inclusive_range_at_check_end_pos_greater_than_array_length(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual(obj.non_inclusive_range(1, 15), "Index out of range")

	def test_non_inclusive_range_check_start_pos_greater_than_end_pos(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual(obj.non_inclusive_range(6, 3), "Index out of range")

	def test_non_inclusive_range(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual(obj.non_inclusive_range(0, 2), [9, 5])

	def test_start_and_length_check_start_pos_less_than_zero(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual(obj.start_and_length(-1, 4), "Index out of range")

	def test_start_and_length_at_check_start_pos_greater_than_array_length(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual(obj.start_and_length(10, 4), IndexError)

	def test_start_and_length_check_length_less_than_zero(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual(obj.start_and_length(10, -1), "Invalid length")

	def test_start_and_length_check_length_equal_to_zero(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual(obj.start_and_length(5, 0), [])

	def test_start_and_length(self):
		obj = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
		self.assertEqual(obj.start_and_length(0, 2), [9, 5])