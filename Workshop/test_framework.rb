require "test/unit"
require_relative "framework"

class Test_Website < Test::Unit::TestCase

	def test_make_object
		framework = Framework.new()
        assert framework.instance_of? Framework
    end

	def test_get_title
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		assert_equal("Document", framework.get_title())
		framework.close_browser()
	end

	def test_get_element_by_id()
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		assert_equal("", framework.get_text(framework.find_element_by_id("name")))
		framework.close_browser()
	end

	def test_negative_get_element_by_id()
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		assert_equal("Error", framework.get_text(framework.find_element_by_id("names")))
		framework.close_browser()
	end

	def test_get_element_by_class()
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		assert_equal("Contact Us Today!", framework.get_text(framework.find_elements_by_class("legend")[0]))
		framework.close_browser()
	end

	def test_negative_get_element_by_class()
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		assert_equal("Error", framework.get_text(framework.find_elements_by_class("legends")[0]))
		framework.close_browser()
	end

	def test_get_element_by_tag_name()
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		assert_equal("Contact Us Today!", framework.get_text(framework.find_elements_by_tag_name("legend")[0]))
		framework.close_browser()
	end

	def test_negative_get_element_by_tag_name()
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		assert_equal("Error", framework.get_text(framework.find_elements_by_tag_name("legends")[0]))
		framework.close_browser()
	end

	def test_get_element_by_name()
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		assert_equal("", framework.get_text(framework.find_elements_by_name("name")[0]))
		framework.close_browser()
	end

	def test_negative_get_element_by_name()
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		assert_equal("Error", framework.get_text(framework.find_elements_by_name("names")[0]))
		framework.close_browser()
	end

	def test_get_element_by_xpath()
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		assert_equal("", framework.get_text(framework.find_element_by_xpath('//*[@id="name"]')))
		framework.close_browser()
	end

	def test_negative_get_element_by_xpath()
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		assert_equal("Error", framework.get_text(framework.find_element_by_xpath('//*[@id="names"]')))
		framework.close_browser()
	end

	def test_sleep_for
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		assert_equal(2, framework.sleep_for(2))
		framework.close_browser()
	end

	def test_negative_sleep_for
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		assert_equal("Error", framework.sleep_for("2"))
		framework.close_browser()
	end

	def test_send_keys_to
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		username = framework.find_element_by_id("name")
		framework.send_keys_to(username, "Omkar Savoikar")
		assert_equal("Omkar Savoikar", username['value'])
		framework.close_browser()
	end

	def test_get_text
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		assert_equal("", framework.get_text(framework.find_element_by_id("name")))
		framework.close_browser()
	end

	def test_negative_get_text
		framework = Framework.new()
		framework.open_browser("file:///app/index.html")
		assert_equal("Error", framework.get_text(framework.find_element_by_id("names")))
		framework.close_browser()
	end

end