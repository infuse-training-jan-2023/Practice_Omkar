# Write a script to get a particular column in table.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Prob09
	def get_column
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://computer-database.gatling.io/computers")
		j = 1 # col value
		j = j-1
		thead = driver.find_element(tag_name: 'thead')
		tr = thead.find_element(tag_name: 'tr')
		ths = tr.find_elements(tag_name: 'th')
		print("\n", ths[j].text)
		tbody = driver.find_element(tag_name: 'tbody')
		trs = tbody.find_elements(tag_name: 'tr')
		trs.each{ |tr|
			tds = tr.find_elements(tag_name: 'td')
			print("\n", tds[j].text)
		}
		driver.quit
	end
end

prob = Prob09.new
prob.get_column