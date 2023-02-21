# Write a script to select a checkbox, radio button.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class OptionSelect
	def select_options(url)
		driver = Selenium::WebDriver.for :chrome
		driver.get(url)
		radio_options = driver.find_elements(name: 'radiooptions')
		radio_options.each do |option|
			if option.attribute("value") == "Male"
				option.click
			end
		end
		driver.find_element(id: 'checkbox1').click
		driver.quit
	end
end

option_select = OptionSelect.new
url = "https://demo.automationtesting.in/Register.html"
option_select.select_options(url)