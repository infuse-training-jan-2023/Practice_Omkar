# Write a script to get table headers.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Prob09
	def get_headers
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://cosmocode.io/automation-practice-webtable/")
		tr = driver.find_element(tag_name: 'tr')
		tds = tr.find_elements(tag_name: 'td')
		tds.each{ |e|
			h3 = e.find_element(tag_name: 'h3')
			str = h3.find_element(tag_name: 'strong')
			print("\n", str.text)
		}
		driver.quit
	end
end

prob = Prob09.new
prob.get_headers