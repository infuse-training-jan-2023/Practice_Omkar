# Write a script to select a checkbox, radio button.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Prob04
	def select_options
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://demo.automationtesting.in/Register.html")
		radio = driver.find_elements(name: 'radiooptions')[0]
		radio.click
		select1 = driver.find_element(id: 'checkbox1')
		select1.click
		driver.quit
	end
end

prob = Prob04.new
prob.select_options