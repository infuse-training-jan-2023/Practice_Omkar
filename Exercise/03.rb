# Write a script to click a button.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"
class Prob03
	def click_button
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://www.amazon.in/")
		btn = driver.find_element(id: 'nav-search-submit-button')
		btn.click
		driver.quit
	end
end

prob = Prob03.new
prob.click_button