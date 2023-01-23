# Write a script to select the i-th dropdown item and return the value.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Prob07
	def select_dropdown_item
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://testpages.herokuapp.com/styled/basic-html-form-test.html")
		j = 4 # value of dropdown to be selected
		j = j - 1
		sel = driver.find_element(name: 'dropdown')
		opt = sel.find_elements(tag_name: 'option')
		opt[j].click
		sleep(5)
		driver.quit
	end
end

prob = Prob07.new
prob.select_dropdown_item