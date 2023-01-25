require 'selenium-webdriver'
require_relative "framework"

class Automate
	
	attr_accessor :framework

	def initialize()
		@framework = Framework.new
	end

	def open_website()
		framework.open_browser("file:///C:/Users/TURBO/Desktop/OMKAR/PROGRAMMING/Infuse/Docker/Workshop/Test/index.html")
		framework.maximize_window
		sleep(2)
	end

	def enter_name(str)
		username = framework.find_element_by_id("name")
		framework.send_keys_to(username, str)
	end

	def enter_mail(str)
		email = framework.find_element_by_id("email")
		framework.send_keys_to(email, str)
	end

	def enter_phone_number(str)
		phone = framework.find_element_by_id("phone")
		framework.send_keys_to(phone, str)
	end

	def enter_city(str)
		city = framework.find_element_by_id("city")
		framework.send_keys_to(city, str)
	end

	def select_gender(str=1)
		gender = framework.find_element_by_id("gender")
		opts = framework.find_elements_by_tag_name("option", gender)
		framework.click_element(opts[str-1])
	end

	def enter_pincode(str)
		zip = framework.find_element_by_id("zip")
		framework.send_keys_to(zip, str)
	end

	def enter_website(str)
		website = framework.find_element_by_id("website")
		framework.send_keys_to(website, str)
	end

	def select_hosting(str)
		radio = framework.find_element_by_id("radio")
		inps = framework.find_elements_by_tag_name("input", radio)
		opt = str == "Yes" ? 0 : 1
		framework.click_element(inps[opt])
	end

	def enter_desc(str)
		comment = framework.find_element_by_id("comment")
		framework.send_keys_to(comment, str)
	end

	def submit_form()
		submit = framework.find_element_by_id("submit")
		framework.click_element(submit)
	end

	def close_browser()
		framework.close_browser()
	end
end

automate = Automate.new
automate.open_website()
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