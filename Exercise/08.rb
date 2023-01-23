# Write a script to change move the horizontal slider.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Prob08
	def move_slider
		driver = Selenium::WebDriver.for :chrome
		driver.get("https://www.globalsqa.com/demo-site/sliders/#Steps")
		iframe = driver.find_element(:css,'iframe.lazyloaded')
		driver.switch_to.frame(iframe)
		slider = driver.find_element(:tag_name,'span')
		driver.action.key_down(:control).perform
		driver.action.drag_and_drop_by(slider, 100,250).perform
		driver.quit
	end
  end
  
prob = Prob08.new
prob.move_slider