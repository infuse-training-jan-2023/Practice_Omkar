# Write a script to use a search engine to find something.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class SearchGoogle
	def search
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://www.google.com/")
		driver.find_element(tag_name: 'input').send_keys("Selenium", :return)
		driver.quit
	end
end

searchGoogle = SearchGoogle.new
searchGoogle.search