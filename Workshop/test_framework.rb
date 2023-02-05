require "test/unit"
require 'selenium-webdriver'
require_relative "framework"
Selenium::WebDriver::Chrome.driver_path = "/opt/chromedriver-109.0.5414.74/chromedriver"

class Test_Website < Test::Unit::TestCase

	def test_make_object
		framework = Framework.new()
        assert framework.instance_of? Framework
    end

	def test_get_title
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal("Document", framework.get_title())
		framework.close_browser()
	end

	def test_get_element_by_id
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal("", (framework.getelement({:id 'name'})).text)
		framework.close_browser()
	end

	def test_negative_get_element_by_id
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal("Error - No element found", (framework.getelement({:id 'name'})).text)
		framework.close_browser()
	end

	def test_get_element_by_class
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal("Contact Us Today!", (framework.get_elements({:class, "legend"})[0]).text)
		framework.close_browser()
	end

	def test_negative_get_element_by_class
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal("Error - No element found", (framework.get_elements({:class, "legends"})[0]).text)
		framework.close_browser()
	end

	def test_get_element_by_tag_name
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal("Contact Us Today!", (framework.get_elements({:tag_name, "legends"})[0]).text)
		framework.close_browser()
	end

	def test_negative_get_element_by_tag_name
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal("Error - No element found", (framework.get_elements({:tag_name, "legends"})[0]).text)
		framework.close_browser()
	end

	def test_get_element_by_name
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal("", (framework.get_elements({:name, "legends"})[0]).text)
		framework.close_browser()
	end

	def test_negative_get_element_by_name
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal("Error - No element found", (framework.get_elements({:name, "legends"})[0]).text)
		framework.close_browser()
	end

	def test_get_element_by_xpath
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal("", framework.get_text(framework.get_element({:xpath, '//*[@id="name"]'})))
		framework.close_browser()
	end

	def test_negative_get_element_by_xpath
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal("Error - No element found", framework.get_text(framework.get_element({:xpath, '//*[@id="name"]'})))
		framework.close_browser()
	end

	def test_sleep_for
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal(2, framework.sleep_for(2))
		framework.close_browser()
	end

	def test_negative_sleep_for
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal("Error - Could not wait for given amount of time", framework.sleep_for("2"))
		framework.close_browser()
	end

	def test_implicit_wait_for
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal(2, framework.implicit_wait_for(2))
		framework.close_browser()
	end

	def test_negative_implicit_wait_for
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal("Error - Could not implicitly wait for given amount of time", framework.implicit_wait_for("2"))
		framework.close_browser()
	end

	def test_send_keys_to
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		username = framework.find_element_by_id("name")
		framework.send_keys_to(username, "Omkar Savoikar")
		assert_equal("Omkar Savoikar", username['value'])
		framework.close_browser()
	end

	def test_get_text
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal("", framework.get_text(driver.find_element(:id, "name")))
		framework.close_browser()
	end

	def test_negative_get_text
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		assert_equal("Error - No text element found", framework.get_text(driver.find_element(:id, "names")))
		framework.close_browser()
	end

	def test_click_element
		framework = Framework.new()
		driver = Selenium::WebDriver.for :chrome
		driver.get("file:///app/index.html")
		framework.click_element(driver.find_elements(:tag_name, "button")[0])
		driver.sleep(2)
		assert_equal("Fill the form!", driver.find_elements(:tag_name, "span")[0].text)
		framework.close_browser()
	end
end