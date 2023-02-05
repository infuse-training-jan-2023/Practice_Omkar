class SubArray:
	
	def __init__(self, arr, k) -> None:
		self.arr = arr
		self.k = k
		self.count = 0
	
	def check_sum(self) -> str:
		if (len(self.arr) == 0):
			return("Invalid array input")
		sum_dict = []
		sum = 0
		for i in range(len(self.arr)):
			sum += self.arr[i]
			sum_dict.append(sum)
			if (sum == self.k):
				self.count += 1
			if (sum - self.k) in sum_dict:
				self.count += sum_dict.count(sum - self.k)
		return("Output = " + str(self.count))