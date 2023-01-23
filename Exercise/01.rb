# Write a script to launch a browser, maximize and close/quit it
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Prob01
	def open_browser
		driver = Selenium::WebDriver.for :chrome
		driver.manage.window.maximize
		driver.quit
	end
end

prob = Prob01.new
prob.open_browser