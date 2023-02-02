class Sports:
	def __init__(self, arr) -> None:
		self.arr = arr
	
	def skip_sports(self, inp) -> list:
		if (inp < 0) or (inp > len(self.arr)):
			return "Index out of range"
		op = {}
		for i in range(inp, len(self.arr)):
			op.update({i: self.arr[i]})
		return op