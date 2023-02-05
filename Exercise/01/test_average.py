from average import SerialAverage
import unittest

class Test_Average(unittest.TestCase):
	def test_instance_of_SerialAverage(self):
		obj = SerialAverage("002-00.00-08.00")
		assert(isinstance(obj, SerialAverage))

	def test_string_split(self):
		obj = SerialAverage("002-00.00-08.00")
		self.assertEqual(obj.string_split(), ['002', '00.00', '08.00'])
		# assert(obj.string_split() == ['002', '00.00', '08.00'])

	def test_serial_average(self):
		obj = SerialAverage("002-00.00-08.00")
		self.assertEqual(obj.serial_average(), "002-04.00")
		# assert(obj.serial_average() == "002-04.00")

	def test_input_negative(self):
		obj = SerialAverage("002--0.00-08.00")
		self.assertEqual(obj.serial_average(), "Invalid input format")
		# assert(obj.serial_average() == "Invalid input format")

	def test_no_input(self):
		obj = SerialAverage("")
		self.assertEqual(obj.serial_average(), "Invalid input format")
		# assert(obj.serial_average() == "Invalid input format")
