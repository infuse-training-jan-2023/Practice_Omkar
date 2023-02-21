# Write a script to change move the horizontal slider.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Slider
	def move_slider(url)
		driver = Selenium::WebDriver.for :chrome
		driver.get(url)
		sleep(2)
		iframe = driver.find_element(:css,'iframe.lazyloaded')
		driver.switch_to.frame(iframe)
		slider = driver.find_element(:tag_name,'span')
		slider.click
		slider.send_keys(:arrow_right)
		slider.send_keys(:arrow_left)
		driver.quit
	end
end
  
slider = Slider.new
url = "https://www.globalsqa.com/demo-site/sliders/#Steps"
slider.move_slider(url)