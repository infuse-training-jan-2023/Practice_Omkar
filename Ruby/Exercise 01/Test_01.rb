require "test/unit"
require_relative "01"

class Test01 < Test::Unit::TestCase
    def test_make_object
        prob = Problem1.new
        assert prob.instance_of? Problem1
    end
    def test_average()
        prob = Problem1.new
        assert_equal("002-10.00", prob.serial_average("002-10.00-10.00"))
    end
end