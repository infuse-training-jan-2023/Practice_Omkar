from subarray import SubArray
import unittest
from data import arr, k

class TestSubArray(unittest.TestCase):
	def test_instance_of_Subarray(self):
		subarray = SubArray([1, 2, 3], 3)
		assert(isinstance(subarray, SubArray))

	def test_check_empty_array(self):
		subarray = SubArray([], 1)
		self.assertEqual(subarray.check_sum(), "Invalid array input")
	
	def test_check_positive_array_elements(self):
		subarray = SubArray([1, 2, 3], 3)
		self.assertEqual(subarray.check_sum(), "Output = 2")
	
	def test_check_negative_array_elements(self):
		subarray = SubArray([-1, -2, -3], -3)
		self.assertEqual(subarray.check_sum(), "Output = 2")
	
	def test_check_mixed_array_elements(self):
		subarray = SubArray([1, -1, 2, -2, 3, -3], 3)
		self.assertEqual(subarray.check_sum(), "Output = 3")
	
	def test_check_k_equal_to_zero(self):
		subarray = SubArray([1, -1, 1, -1], 0)
		self.assertEqual(subarray.check_sum(), "Output = 8")

	def test_check_positive_k(self):
		subarray = SubArray([1, 2, 3], 3)
		self.assertEqual(subarray.check_sum(), "Output = 2")

	def test_check_negative_k(self):
		subarray = SubArray(arr, k)
		self.assertEqual(subarray.check_sum(), "Output = 1023")
