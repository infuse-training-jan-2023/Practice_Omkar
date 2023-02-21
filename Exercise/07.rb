# Write a script to select the i-th dropdown item and return the value.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class DropDownSelectItem
	def select_dropdown_item(url)
		driver = Selenium::WebDriver.for :chrome
		driver.get(url)
		select_text = "Drop Down Item 5"
		drop_options = driver.find_element(name: 'dropdown')
		dropdown = Selenium::WebDriver::Support::Select.new(drop_options)
		dropdown.select_by(:text, select_text)
		driver.quit
	end
end

dropDownSelectItem = DropDownSelectItem.new
url = "https://testpages.herokuapp.com/styled/basic-html-form-test.html"
dropDownSelectItem.select_dropdown_item(url)