# Write a script to navigate to a website and get its title.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Prob02
	def get_title
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://www.amazon.in/")
		title = driver.title
		print(title)
		driver.quit
	end
end

prob = Prob02.new
prob.get_title