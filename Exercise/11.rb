# Write a script to get a cell value of a table.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class GetCell
	def get_cell_value(url, row_val, col_val)
		driver = Selenium::WebDriver.for :chrome
		driver.get(url)
		table = driver.find_element(tag_name: 'tbody')
		trows = table.find_elements(tag_name: 'tr')
		trow = trows[row_val-1]
		tdata = trow.find_elements(tag_name: 'td')
		print(tdata[col_val-1].text)
		driver.quit
	end
end

getCell = GetCell.new
url = "https://the-internet.herokuapp.com/tables"
row_val = 1
col_val = 1
getCell.get_cell_value(url, row_val, col_val)