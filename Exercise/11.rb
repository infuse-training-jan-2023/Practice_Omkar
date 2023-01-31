# Write a script to get a cell value of a table.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class GetCell
	def get_cell_value(i, j)
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://the-internet.herokuapp.com/tables")
		table = driver.find_element(tag_name: 'tbody')
		trs = table.find_elements(tag_name: 'tr')
		tr = trs[i-1]
		tds = tr.find_elements(tag_name: 'td')
		print(tds[j-1].text)
		driver.quit
	end
end

getCell = GetCell.new
row_val = 1
col_val = 1
getCell.get_cell_value(row_val, col_val)