require 'selenium-webdriver'


class Framework
	
	attr_accessor :driver
	
	def initialize
		Selenium::WebDriver::Chrome.driver_path = "/opt/chromedriver-109.0.5414.74/chromedriver"
		options = Selenium::WebDriver::Chrome::Options.new
        options.add_argument("--headless")
        options.add_argument("--no-sandbox")
        options.add_argument("--window-size=1920,1080")
        options.add_argument("--disable-gpu")
        options.add_argument("--disable-dev-shm-usage")
        @driver = Selenium::WebDriver.for :chrome, options: options
	end

	def open_browser(get_url)
		begin
			driver.get(get_url)
		rescue
			return 'Error - Could not fetch URL'
		end
	end

	def get_title()
		begin
			driver.title
		rescue
			return 'Error - Title not found'
		end
	end

	def maximize_window()
		begin	
			driver.manage.window.maximize
		rescue
			return 'Error - Could not maximize window'
		end
	end

	def get_element(obj, parent=@driver)
		begin
			parent.find_element(obj)
		rescue
			return 'Error - No element found'
		end
	end

	def get_elements(obj, parent=@driver)
		begin
			parent.find_elements(obj)
		rescue
			return 'Error - No element found'
		end
	end

	# def find_element_by_id(id_value, parent=@driver)
	# 	begin
	# 		parent.find_element(:id, id_value)
	# 	rescue
	# 		return 'Error - No element with given ID found'
	# 	end
	# end

	# def find_elements_by_class(class_name, parent=@driver)
	# 	begin	
	# 		parent.find_elements(:class, class_name)
	# 	rescue
	# 		return 'Error - No element with given class found'
	# 	end
	# end

	# def find_elements_by_name(name_value, parent=@driver)
	# 	begin	
	# 		parent.find_elements(:name, name_value)
	# 	rescue
	# 		return 'Error - No element with given name found'
	# 	end
	# end

	# def find_elements_by_tag_name(tag_name, parent=@driver)
	# 	begin	
	# 		parent.find_elements(:tag_name, tag_name)
	# 	rescue
	# 		return 'Error - No element with given tag name found'
	# 	end
	# end

	# def find_element_by_xpath(xpath_value, parent=@driver)
	# 	begin	
	# 		parent.find_element(:xpath, xpath_value)
	# 	rescue
	# 		return 'Error - No element with given xpath found'
	# 	end
	# end

	def click_element(element)
		begin	
			element.click
		rescue
			return 'Error - Could not perform click on given element'
		end
	end

	def sleep_for(sec_value)
		begin	
			sleep(sec_value)
		rescue
			return 'Error'
		end
	end

	def implicit_wait_for(sec_value)
		begin	
			driver.manage.timeouts.implicit_wait = sec_value
		rescue
			return 'Error - Could not implicitly wait for given amount of time'
		end
	end

	def send_keys_to(element, keys)
		begin	
			element.send_keys(keys)
		rescue
			return 'Error - Could not send keys to given element'
		end
	end

	def scroll_page(num)
		begin	
			driver.execute_script("window.scrollTo(0, #{num})")
		rescue
			return 'Error - Could not perform scroll function'
		end
	end

	def get_text(element)
		begin	
			element.text
		rescue
			return 'Error - No text element found'
		end
	end

	def close_browser()
		begin	
			driver.quit
		rescue
			return 'Error - Could not close browser'
		end
	end
end