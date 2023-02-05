class ArrayTasks:
	def __init__(self, arr) -> None:
		self.arr = arr

	def input_validation(self, start_pos, end_pos) -> bool:
		return ((start_pos < 0) or (end_pos > len(self.arr)) or (start_pos > end_pos))

	def element_at(self, index) -> int:
		if index < 0:
			return "Index out of range"
		try:
			return self.arr[index]
		except IndexError:
			return(IndexError)
	
	def inclusive_range(self, start_pos, end_pos) -> list:
		if self.input_validation(start_pos, end_pos):
			return "Index out of range"
		return self.arr[start_pos:end_pos+1]

	def non_inclusive_range(self, start_pos, end_pos) -> list:
		if self.input_validation(start_pos, end_pos):
			return "Index out of range"
		return self.arr[start_pos:end_pos]
	
	def start_and_length(self, start_pos, length) -> list:
		if start_pos < 0:
			return "Index out of range"
		if length < 0:
			return "Invalid length"
		try:
			op = []
			for i in range(start_pos, start_pos+length):
				op.append(self.arr[i])
			return op
		except IndexError:
			return(IndexError)