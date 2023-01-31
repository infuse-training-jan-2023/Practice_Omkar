# Automate a website taking advantage of many selenium functions.
require 'selenium-webdriver'
Selenium::WebDriver::Chrome.driver_path = "C:\\Users\\TURBO\\Desktop\\OMKAR\\PROGRAMMING\\Infuse\\Selenium\\chromedriver.exe"

class Automate_Website
	attr_accessor :driver

	def initialize
		@driver = Selenium::WebDriver.for :chrome
	end

	def open_browser(url)
		driver.get(url)
		driver.manage.window.maximize
		search = driver.find_elements(class: "Al5GE")
		if search.length
			inp = search[0].find_element(tag_name: "input")
			inp.send_keys("Panaji") 
			sleep(2)
			btn = search[0].find_element(class: "_2W-T9")
			btn.click
		end
		sleep(2)
	end

	def search_Biryani()
		nav = driver.find_element(class: "_1JNGZ")
		search = nav.find_elements(tag_name: "li")
		search = search[4]
		search.click
		sleep(2)
		form = driver.find_element(tag_name: "form")
		inp = form.find_element(tag_name: "input")
		inp.send_keys("Biryani", :return)
		sleep(2)
	end

	def select_filters()
		filters = driver.find_element(class: "Facets_wrapper__ogDKN")
		divs = filters.find_elements(tag_name: "div")
		sleep(2)
		btn = divs[6].find_element(tag_name: "button")
		btn.click
		sleep(2)
		filters = driver.find_element(class: "Facets_wrapper__ogDKN")
		divs = filters.find_elements(tag_name: "div")
		sleep(2)
		btn = divs[10].find_element(tag_name: "button")
		btn.click
		sleep(2)
	end

	def control_pop_up()
		popup = driver.find_elements(class: "_1Kr-y")
		btn = popup[0].find_element(class: "_3coNr")
		btn.click
	end

	def add_product()
		rests = driver.find_element(class: "_2NSqs")
		rest = rests.find_element(class: "_1RPOp")
		rest.click
		sleep(3)
		if driver.find_elements(class: "_1Kr-y").length
			control_pop_up(driver)
		end
		sleep(2)
		plus = rests.find_element(class: "_1ds9T")
		plus.click
		sleep(2)
	end

	def check_more_items()
		driver.execute_script("window.scrollTo(0, 900)")
		menu = driver.find_elements(class: "styles_label__3kDB0")
		btn = menu[1].find_element(tag_name: "button")
		btn.click
		sleep(2)
	end

	def close_browser()
		driver.close
	end
end

swiggy = Automate_Website.new()
url = "https://www.swiggy.com/"
swiggy.open_browser(url)
swiggy.search_Biryani()
swiggy.select_filters()
swiggy.add_product()
swiggy.check_more_items()
swiggy.close_browser()