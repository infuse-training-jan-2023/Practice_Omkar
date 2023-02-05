class Sports:
	def __init__(self, arr) -> None:
		self.arr = arr
	
	def skip_sports(self, input) -> list:
		if (input < 0) or (input > len(self.arr)):
			return "Index out of range"
		op = {}
		for i in range(input, len(self.arr)):
			op.update({i: self.arr[i]})
		return op