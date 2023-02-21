# Write a script to get the content of dropdown list.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"
		
class DropDownSelect
	def select_dropdown(url)
		driver = Selenium::WebDriver.for :chrome
		driver.get(url)
		dropdown = driver.find_element(tag_name: 'select')
		options = dropdown.find_elements(tag_name: 'option')
		print("Country codes:")
		options.each{|option|
			puts option.text
		}
		driver.quit
	end
end

dropDownSelect = DropDownSelect.new
url = "https://letcode.in/forms"
dropDownSelect.select_dropdown(url)