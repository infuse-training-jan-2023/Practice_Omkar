from subarray import SubArray

class Test_SubArray:
	def test_instance_of_Subarray(self):
		subarray = SubArray()
		assert(isinstance(subarray, SubArray))

	def test_check_sum(self):
		subarray = SubArray()
		assert(subarray.check_sum() == "Output = 1023")