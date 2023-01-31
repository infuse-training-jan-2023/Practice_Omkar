# Write a script to click a button.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class ClickButton
	def click_button
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://www.amazon.in/")
		submit_button = driver.find_element(id: 'nav-search-submit-button')
		submit_button.click
		driver.quit
	end
end

click = ClickButton.new
click.click_button