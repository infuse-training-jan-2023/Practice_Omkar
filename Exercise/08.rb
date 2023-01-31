# Write a script to change move the horizontal slider.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Slider
	def move_slider
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://www.globalsqa.com/demo-site/sliders/#Steps")
		iframe = driver.find_element(:css,'iframe.lazyloaded')
		driver.switch_to.frame(iframe)
		slider = driver.find_element(:tag_name,'span')
		left_key = driver.action.key_down(:arrow_left).to_s
		right_key = driver.action.key_down(:arrow_right).to_s
		driver.action.drag_and_drop_by(slider, left_key.to_i, right_key.to_i).perform
		driver.quit
	end
end
  
slider = Slider.new
slider.move_slider