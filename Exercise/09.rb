# Write a script to get table headers.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Headers
	def get_headers
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://cosmocode.io/automation-practice-webtable/")
		tr = driver.find_element(tag_name: 'tr')
		tds = tr.find_elements(tag_name: 'td')
		tds.each{ |e|
			puts e.text
		}
		driver.quit
	end
end

headers = Headers.new
headers.get_headers