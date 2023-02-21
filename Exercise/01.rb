# Write a script to launch a browser, maximize and close/quit it
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class OpenBrowser
	def open_browser
		driver = Selenium::WebDriver.for :chrome
		driver.manage.window.maximize
		driver.quit
	end
end

openBrowser = OpenBrowser.new
openBrowser.open_browser