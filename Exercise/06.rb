# Write a script to get the content of dropdown list.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"
		
class Prob06
	def select_dropdown
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://letcode.in/forms")
		sel = driver.find_element(tag_name: 'select')
		opt = sel.find_elements(tag_name: 'option')
		print("Country codes:")
		opt.each{|e|
			print("\n", e.text)
		}
		driver.quit
	end
end

prob = Prob06.new
prob.select_dropdown