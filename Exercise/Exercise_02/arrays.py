class ArrayManipulation:
	def __init__(self, arr) -> None:
		self.arr = arr

	def input_validation(self, index=None, start_pos=None, end_pos=None, length=None) -> bool:
		if index is not None:
			return ((index < 0) or (index > len(self.arr)))
		if start_pos is not None and end_pos is not None:
			return ((start_pos < 0) or (end_pos > len(self.arr)) or (start_pos > end_pos))
		if length is not None:
			return ((length < 0) or (length > len(self.arr)))
		if start_pos is not None:
			return ((start_pos < 0) or (start_pos > len(self.arr)))

	def element_at(self, index) -> int:
		try:
			if self.input_validation(index = index):
				print("HI")
				raise IndexError("Index out of range")
			return self.arr[index]
		except IndexError as e:
			return str(e)
	
	def inclusive_range(self, start_pos, end_pos) -> list:
		try:
			if self.input_validation(start_pos = start_pos, end_pos = end_pos):
				raise IndexError("Index out of range")
			return self.arr[start_pos:end_pos+1]
		except IndexError as e:
			return str(e)

	def non_inclusive_range(self, start_pos, end_pos) -> list:
		try:
			if self.input_validation(start_pos = start_pos, end_pos = end_pos):
				raise IndexError("Index out of range")
			return self.arr[start_pos:end_pos]
		except IndexError as e:
			return str(e)
	
	def start_and_length(self, start_pos, length) -> list:
		try:
			if self.input_validation(length = length):
				raise TypeError("Invalid length value")
			if self.input_validation(start_pos = start_pos):
				raise IndexError("Index out of range")
			return self.arr[start_pos: (start_pos+length)]
		except IndexError as e:
			return str(e)
		except TypeError as e:
			return str(e)

am = ArrayManipulation([9, 5, 1, 2, 3, 4, 0, -1])
am.element_at(-5)