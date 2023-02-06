require 'selenium-webdriver'
require_relative 'driver'


class Framework
	
	attr_accessor :driver
	
	def initialize(driver_new)
		@driver = driver_new
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
		child = parent.find_element(obj)
		if child != nil
			return child
		end
		return 'Error - No elements found'
	end

	def get_elements(obj, parent=@driver)
		children = parent.find_elements(obj)
		if children.length() > 0
			return children
		end
		return 'Error - No elements found'
	end

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
			return 'Error - Could not wait for given amount of time'
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