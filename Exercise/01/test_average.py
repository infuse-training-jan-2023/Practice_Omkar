from average import SerialAverage

class Test_Average:
	def test_instance_of_SerialAverage(self):
		obj = SerialAverage("002-00.00-08.00")
		assert(isinstance(obj, SerialAverage))

	def test_average(self):
		obj = SerialAverage("002-00.00-08.00")
		assert(obj.average(10.00, 20.00) == 15.0)

	def test_string_split(self):
		obj = SerialAverage("002-00.00-08.00")
		assert(obj.string_split() == ['002', '00.00', '08.00'])

	def test_serial_average(self):
		obj = SerialAverage("002-00.00-08.00")
		assert(obj.serial_average() == "002-04.00")

	def test_input_negative(self):
		obj = SerialAverage("002--0.00-08.00")
		assert(obj.serial_average() == "Invalid input format")

	def test_no_input(self):
		obj = SerialAverage("")
		assert(obj.serial_average() == "Invalid input format")
