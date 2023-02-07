import re

class SerialAverage:
	
	def __init__(self, input) -> None:
		self.input = input
	
	def string_split(self) -> list:
		return [self.input[:3], self.input[4:9], self.input[10:]]

	def serial_average(self) -> str:
		match = re.search(r'[0-9]{3}-[0-9]{2}.[0-9]{2}-[0-9]{2}.[0-9]{2}', self.input)
		if(not match):
			return "Invalid input format"
		nums = self.string_split()
		avg = (lambda x, y: ((x + y) /2))
		average = avg(float(nums[1]), float(nums[2]))
		# avg = self.average(float(nums[1]), float(nums[2]))
		return (nums[0]+"-%05.2f"% average)
