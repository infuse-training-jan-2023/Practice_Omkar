# Write a script to click a button.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class ClickButton
	def click_button(url)
		driver = Selenium::WebDriver.for :chrome
		driver.get(url)
		submit_button = driver.find_element(id: 'nav-search-submit-button')
		submit_button.click
		driver.quit
	end
end

click = ClickButton.new
url = "https://www.amazon.in/"
click.click_button(url)