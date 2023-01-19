require "test/unit"
require_relative "04"

class Test04 < Test::Unit::TestCase
    def test_make_object
        prob = Problem4.new()
        assert prob.instance_of? Problem4
    end

    def test_skip_sports
        prob = Problem4.new()
        assert_equal({2=>"Football", 3=>"Hockey"}, prob.skip_sports(["Cricket", "TT", "Football", "Hockey"], 2))
    end

    def test_skip_sports_skip_greater_than_length
        prob = Problem4.new()
        assert_equal("Skip cannot be greater than or equal to array length", prob.skip_sports(["Cricket", "TT", "Football", "Hockey"], 5))
    end
end