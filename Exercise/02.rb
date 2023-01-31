# Write a script to navigate to a website and get its title.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class WebsiteTitle
	def get_title
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://www.amazon.in/")
		puts driver.title
		driver.quit
	end
end

title = WebsiteTitle.new
title.get_title