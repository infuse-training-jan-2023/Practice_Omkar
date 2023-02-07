# Write a script to get table headers.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Headers
	def get_headers(url)
		driver = Selenium::WebDriver.for :chrome
		driver.get(url)
		trow = driver.find_element(tag_name: 'tr')
		tdata = trow.find_elements(tag_name: 'td')
		tdata.each{ |element|
			puts element.text
		}
		driver.quit
	end
end

headers = Headers.new
url = "https://cosmocode.io/automation-practice-webtable/"
headers.get_headers(url)