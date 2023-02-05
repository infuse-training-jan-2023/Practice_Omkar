require_relative "framework"

class Target

	attr_accessor :framework

	def initialize()
		@framework = Framework.new
	end

	def open_website()
		framework.implicit_wait_for(5)
		puts "Opening website"
		framework.open_browser("https://www.target.com/")
		framework.maximize_window
	end

	def get_options()
		puts "Open right side bar"
		nav = framework.get_elements({:tag_name, "nav"})[0]
		anchor = framework.get_elements({:tag_name, "a"}, nav)[8]
		framework.click_element(anchor)
		framework.sleep_for(2)
	end

	def check_for_login()
		puts "Check if user already logged in"
		nav = framework.get_elements({:tag_name, "nav"})[0]
		anchor = framework.get_elements({:tag_name, "a"}, nav)[8]
		return anchor['aria-label'] == "Account, sign in"
	end

	def register()
		puts "Registering user"
		get_options()
		register_user = framework.get_element({:id, "listaccountNav-createAccount"})
		framework.click_element(register_user)
		framework.sleep_for(2)
		title = framework.get_title()
		username = framework.get_element({:id, "username"})
		framework.send_keys_to(username, "lefyaparza@gufum.com")
		firstname = framework.get_element({:id, "firstname"})
		framework.send_keys_to(firstname, "Omkar")
		lastname = framework.get_element({:id, "lastname"})
		framework.send_keys_to(lastname, "Savoikar")
		password = framework.get_element({:id, "password"})
		framework.send_keys_to(password, "hello_world")
		button = framework.find_element({:id, "createAccount"})
		framework.click_element(button)
		framework.sleep_for(2)
		if framework.get_title() == title
			msg = framework.get_text(framework.find_elements({:class, "styles__AlertBox-sc-11xpv0b-3"})[0])
		else
			msg = "Login successful"
		end
		return msg
	end

	def login()
		puts "Logging in user"
		get_options()
		login_user = framework.get_element({:id, "listaccountNav-signIn"})
		framework.click_element(login_user)
		framework.sleep_for(2)
		title = framework.get_title
		username = framework.get_element({:id, "username"})
		framework.send_keys_to(username, "lefyaparza@gufum.com")
		password = framework.get_element({:id, "password"})
		framework.send_keys_to(password, "hello_world")
		button = framework.get_element({:id, "login"})
		framework.click_element(button)
		framework.sleep_for(5)
		if framework.get_title == title
			msg = framework.get_text(framework.get_elements({:class, "styles__AlertBox-sc-11xpv0b-3"})[0])
		else
			msg = "Login successful"
		end
		return msg
	end

	def add_to_cart(product)
		puts "Adding to cart"
		framework.click_element(product)
		framework.sleep_for(5)
		framework.scroll_page(500)
		add_cart = framework.get_element({:xpath, "/html/body/div[1]/div[2]/div/div[2]/div[1]/div[2]/div[2]/div/div[4]/div/div/div[2]/div"})
		btn = framework.get_elements({:class, "eitQue"}, add_cart)
		framework.click_element(btn[0])
		framework.sleep_for(2)
		div = framework.get_elements({:class, "dIJNyY"})[0]
		btn = framework.get_elements({:tag_name, "button"}, div)[0]
		framework.click_element(btn)
		framework.sleep_for(5)
	end

	def add_filters()
		puts "Adding filter"
		div = framework.get_elements({:class, "CEden"})[0]
		framework.click_element(div)
		framework.sleep_for(2)
		div = framework.get_element({:xpath, "/html/body/div[1]/div[2]/div/div[2]/div[1]/div/div[4]/div/div[1]/div[2]/div/section/div"})
		products = framework.get_elements({:tag_name, "div"}, div)
		return products[0]
	end

	def search_product(str)
		puts "Searching product"
		search = framework.get_element({:id, "search"})
		framework.send_keys_to(search, str)
		framework.send_keys_to(search, :return)
		framework.sleep_for(5)
		return add_filters()
	end

	def empty_cart()
		puts "Removing from cart"
		nav = framework.get_elements({:tag_name, "nav"})[0]
		anchors = framework.get_elements({:tag_name, "a"}, nav)
		a = anchors[anchors.length-1]
		span = framework.get_elements({:tag_name, "span"}, a)[0]
		framework.click_element(a)
		framework.sleep_for(2)
		items = framework.get_elements({:class, "lonabl"})
		for i in 1..items.length-1 do
			cross = framework.get_elements({:class, "ktUJeX"}, items[i])[0]
			btn = framework.get_elements({:tag_name, "button"}, cross)[0]
			framework.click_element(btn)
		end
		framework.sleep_for(2)
	end

	def logout()
		puts "Logging out"
		nav = framework.get_elements({:tag_name, "nav"})[0]
		anchor = framework.get_elements({:tag_name, "a"}, nav)[8]
		framework.click_element(anchor)
		framework.sleep_for(2)
		logout = framework.get_element({:id, "listaccountNav-guestSignOut"})
		framework.click_element(logout)
	end
end

target = Target.new
target.open_website()
login_check = target.check_for_login()
if login_check
	puts target.register()
	puts target.login()
end
str = "Tshirt Men"
product = target.search_product(str)
target.add_to_cart(product)
str = "Shirt Men"
product = target.search_product(str)
target.add_to_cart(product)
target.empty_cart()
target.logout()