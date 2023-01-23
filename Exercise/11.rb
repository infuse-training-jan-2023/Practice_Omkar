# Write a script to get a cell value of a table.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Prob11
	def get_cell_value
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://the-internet.herokuapp.com/tables")
		i = 1 # row value
		i = i - 1
		j = 1 # col value
		j = j-1
		table = driver.find_element(tag_name: 'tbody')
		trs = table.find_elements(tag_name: 'tr')
		tr = trs[i]
		tds = tr.find_elements(tag_name: 'td')
		print(tds[j].text)
		driver.quit
	end
end

prob = Prob11.new
prob.get_cell_value