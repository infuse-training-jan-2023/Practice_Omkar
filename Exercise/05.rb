# Write a script to use a search engine to find something.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Prob05
	def search
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://www.google.com/")
		inp = driver.find_element(tag_name: 'input')
		inp.send_keys("Selenium", :return)
		driver.quit
	end
end

prob = Prob05.new
prob.search