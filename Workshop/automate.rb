require 'selenium-webdriver'
require_relative 'framework'
require_relative 'driver'

class Automate
	
	attr_accessor :framework

	def initialize()
		driver = Driver.new.driver_init()
		@framework = Framework.new(driver)
	end

	def open_website()
		framework.open_browser("C:/Users/TURBO/Desktop/OMKAR/PROGRAMMING/Practice_Omkar/Workshop/index.html")
		framework.maximize_window
		sleep(2)
	end

	def click_btn()
		btn = framework.get_element({:id => "btn"})
		framework.click_element(btn)
	end

	def enter_name(str)
		username = framework.get_element({:id => "name"})
		framework.send_keys_to(username, str)
	end

	def enter_mail(str)
		email = framework.get_element({:id => "email"})
		framework.send_keys_to(email, str)
	end

	def enter_phone_number(str)
		phone = framework.get_element({:id => "phone"})
		framework.send_keys_to(phone, str)
	end

	def enter_city(str)
		city = framework.get_element({:id => "city"})
		framework.send_keys_to(city, str)
	end

	def select_gender(str=1)
		gender = framework.get_element({:id => "gender"})
		opts = framework.get_elements({:tag_name => "option"}, gender)
		framework.click_element(opts[str-1])
	end

	def enter_pincode(str)
		zip = framework.get_element({:id => "zip"})
		framework.send_keys_to(zip, str)
	end

	def enter_website(str)
		website = framework.get_element({:id => "website"})
		framework.send_keys_to(website, str)
	end

	def select_hosting(str)
		radio = framework.get_element({:id => "radio"})
		inps = framework.get_elements({:tag_name => "input"}, radio)
		opt = str == "Yes" ? 0 : 1
		framework.click_element(inps[opt])
	end

	def enter_desc(str)
		comment = framework.get_element({:id => "comment"})
		framework.send_keys_to(comment, str)
	end

	def submit_form()
		submit = framework.get_element({:id => "submit"})
		framework.click_element(submit)
	end

	def close_browser()
		framework.close_browser()
	end
end

automate = Automate.new
automate.open_website()
automate.click_btn()
automate.enter_name("Omkar Savoikar")
automate.enter_mail("omkar.savoikar@infuse.it")
automate.enter_phone_number(1234567890)
automate.enter_city("Ponda")
automate.select_gender(1)
automate.enter_pincode("403401")
automate.enter_website("www.omkarsavoikar.com")
automate.select_hosting("No")
automate.enter_desc("My name is Omkar. I want to host my website. Help me out.")
sleep(2)
automate.submit_form()
sleep(2)
automate.close_browser()