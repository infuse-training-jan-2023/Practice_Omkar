import re

class SerialAverage:
	
	def __init__(self, inp) -> None:
		self.inp = inp

	def average(self, num1, num2) -> float:
		return (num1 + num2) / 2
	
	def string_split(self) -> list:
		nums = [self.inp[:3], self.inp[4:9], self.inp[10:]]
		return nums

	def serial_average(self) -> str:
		match = re.search(r'[0-9]{3}-[0-9]{2}.[0-9]{2}-[0-9]{2}.[0-9]{2}', self.inp)
		if(not match):
			return "Invalid input format"
		nums = self.string_split()
		avg = self.average(float(nums[1]), float(nums[2]))
		return (nums[0]+"-%05.2f"% avg)