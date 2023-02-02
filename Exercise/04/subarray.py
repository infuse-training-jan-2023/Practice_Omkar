from data import arr, k

class SubArray:
	
	def __init__(self) -> None:
		self.arr = arr
		self.k = k
		self.count = 0
	
	def check_sum(self):
		print("Array: " + str(arr))
		print("k = " + str(k))
		sum_list = []
		sum = 0
		for i in range(len(self.arr)):
			sum += self.arr[i]
			sum_list.append(sum)
			if (sum == self.k):
				self.count += 1
			if (sum - self.k in sum_list):
				self.count += sum_list.count(sum - self.k)
		return("Output = " + str(self.count))

subArray = SubArray()
print(subArray.check_sum())