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
			return 'Error'
		end
	end

	def get_title()
		begin
			driver.title
		rescue
			return 'Error'
		end
	end

	def maximize_window()
		begin	
			driver.manage.window.maximize
		rescue
			return 'Error'
		end
	end

	def find_element_by_id(id_value, parent=@driver)
		begin
			parent.find_element(:id, id_value)
		rescue
			return 'Error'
		end
	end

	def find_elements_by_class(class_name, parent=@driver)
		begin	
			parent.find_elements(:class, class_name)
		rescue
			return 'Error'
		end
	end

	def find_elements_by_name(name_value, parent=@driver)
		begin	
			parent.find_elements(:name, name_value)
		rescue
			return 'Error'
		end
	end

	def find_elements_by_tag_name(tag_name, parent=@driver)
		begin	
			parent.find_elements(:tag_name, tag_name)
		rescue
			return 'Error'
		end
	end

	def find_element_by_xpath(xpath_value, parent=@driver)
		begin	
			parent.find_element(:xpath, xpath_value)
		rescue
			return 'Error'
		end
	end

	def click_element(element)
		begin	
			element.click
		rescue
			return 'Error'
		end
	end

	def sleep_for(sec_value)
		begin	
			sleep(sec_value)
		rescue
			return 'Error'
		end
	end

	def send_keys_to(element, keys)
		begin	
			element.send_keys(keys)
		rescue
			return 'Error'
		end
	end

	def scroll_page(num)
		begin	
			driver.execute_script("window.scrollTo(0, #{num})")
		rescue
			return 'Error'
		end
	end

	def get_text(element)
		begin	
			element.text
		rescue
			return 'Error'
		end
	end

	def close_browser()
		begin	
			driver.quit
		rescue
			return 'Error'
		end
	end
end