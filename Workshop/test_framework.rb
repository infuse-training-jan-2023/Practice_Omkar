require "test/unit"
require 'selenium-webdriver'
require_relative 'framework'
require_relative 'driver'

class Test_Website < Test::Unit::TestCase
	
	attr_accessor :framework, :driver, :url

	def setup()
		@url = "file:///app/index.html"
		# @url = "file:///C:/Users/TURBO/Desktop/OMKAR/PROGRAMMING/Practice_Omkar/Workshop/index.html"
		@driver = Driver.new.driver_init()
		@framework = Framework.new(@driver)
	end

	def test_make_framework()
        assert framework.instance_of? Framework
    end

	def test_get_title()
		driver.get(url)
		sleep(2)
		assert_equal("Document", framework.get_title())
		framework.close_browser()
	end

	def test_get_element_by_id()
		driver.get(url)
		assert_equal("", (framework.get_element({:id => 'name'})).text)
		framework.close_browser()
	end

	def test_negative_get_element_by_id()
		driver.get(url)
		assert_equal("Error - No element found", framework.get_element({:id => 'names'}))
		framework.close_browser()
	end

	def test_get_element_by_class()
		driver.get(url)
		assert_equal("Contact Us Today!", (framework.get_elements({:class => "legend"})[0]).text)
		framework.close_browser()
	end

	def test_negative_get_element_by_class() 
		driver.get(url)
		assert_equal("Error - No elements found", framework.get_elements({:class => "legends"}))
		framework.close_browser()
	end

	def test_get_element_by_tag_name()
		driver.get(url)
		assert_equal("Contact Us Today!", (framework.get_elements({:tag_name => "legend"})[0]).text)
		framework.close_browser()
	end

	def test_negative_get_element_by_tag_name() 
		driver.get(url)
		assert_equal("Error - No elements found", framework.get_elements({:tag_name => "legends"}))
		framework.close_browser()
	end

	def test_get_element_by_name()
		driver.get(url)
		assert_equal(nil, (framework.get_elements({:name => "legends"})[0])['value'])
		framework.close_browser()
	end

	def test_negative_get_element_by_name() 
		driver.get(url)
		assert_equal("Error - No elements found", framework.get_elements({:name => "legends"}))
		framework.close_browser()
	end

	def test_get_element_by_xpath()
		driver.get(url)
		assert_equal("", (framework.get_element({:xpath => '//*[@id="name"]'})).text)
		framework.close_browser()
	end

	def test_negative_get_element_by_xpath()
		driver.get(url)
		assert_equal("Error - No element found", framework.get_element({:xpath => '//*[@id="names"]'}))
		framework.close_browser()
	end

	def test_sleep_for()
		driver.get(url)
		assert_equal(2, framework.sleep_for(2))
		framework.close_browser()
	end

	def test_negative_sleep_for()
		driver.get(url)
		assert_equal("Error - Could not wait for given amount of time", framework.sleep_for("2"))
		framework.close_browser()
	end

	def test_implicit_wait_for()
		driver.get(url)
		assert_equal(2, framework.implicit_wait_for(2))
		framework.close_browser()
	end

	def test_negative_implicit_wait_for()
		driver.get(url)
		assert_equal("Error - Could not implicitly wait for given amount of time", framework.implicit_wait_for("2"))
		framework.close_browser()
	end

	def test_send_keys_to()
		driver.get(url)
		username = driver.find_element(:id, "name")
		framework.send_keys_to(username, "Omkar Savoikar")
		assert_equal("Omkar Savoikar", username['value'])
		framework.close_browser()
	end

	def test_get_text()
		driver.get(url)
		assert_equal("", framework.get_text(driver.find_element(:id, "name")))
		framework.close_browser()
	end

	def test_negative_get_text() 
		driver.get(url)
		assert_equal("", framework.get_text(driver.find_element(:id, "name")))
		framework.close_browser()
	end

	def test_click_element()
		driver.get(url)
		framework.click_element(driver.find_elements(:tag_name, "button")[0])
		sleep(2)
		assert_equal("Fill the form!", driver.find_elements(:tag_name, "span")[0].text)
		framework.close_browser()
	end
end