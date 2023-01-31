# Write a script to get the content of dropdown list.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"
		
class DropDownSelect
	def select_dropdown
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://letcode.in/forms")
		sel = driver.find_element(tag_name: 'select')
		opt = sel.find_elements(tag_name: 'option')
		print("Country codes:")
		opt.each{|e|
			puts e.text
		}
		driver.quit
	end
end

dropDownSelect = DropDownSelect.new
dropDownSelect.select_dropdown