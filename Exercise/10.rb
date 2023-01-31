# Write a script to get a particular column in table.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Columns
	def get_column(j)
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://computer-database.gatling.io/computers")
		thead = driver.find_element(tag_name: 'thead')
		tr = thead.find_element(tag_name: 'tr')
		ths = tr.find_elements(tag_name: 'th')
		puts ths[j-1].text
		tbody = driver.find_element(tag_name: 'tbody')
		trs = tbody.find_elements(tag_name: 'tr')
		trs.each{ |tr|
			tds = tr.find_elements(tag_name: 'td')
			puts tds[j-1].text
		}
		driver.quit
	end
end

columns = Columns.new
col_val = 1
columns.get_column(col_val)