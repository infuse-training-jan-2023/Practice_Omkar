# Write a script to get a particular column in table.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Columns
	def get_column(url, col_val)
		driver = Selenium::WebDriver.for :chrome
		driver.get(url)
		thead = driver.find_element(tag_name: 'thead')
		trow = thead.find_element(tag_name: 'tr')
		theads = trow.find_elements(tag_name: 'th')
		puts theads[col_val-1].text
		tbody = driver.find_element(tag_name: 'tbody')
		trows = tbody.find_elements(tag_name: 'tr')
		trows.each{ |trow|
			tdata = trow.find_elements(tag_name: 'td')
			puts tdata[col_val-1].text
		}
		driver.quit
	end
end

columns = Columns.new
url = "https://computer-database.gatling.io/computers"
col_val = 1
columns.get_column(url, col_val)