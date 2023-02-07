require "test/unit"
require_relative "02"

class Test02 < Test::Unit::TestCase
    def test_make_object
        prob = Problem2.new()
        assert prob.instance_of? Problem2
    end

    def test_element_at_check_index_less_than_zero()
        prob = Problem2.new()
        assert_equal("Index cannot be less than 0", prob.element_at([9, 5, 1, 2, 3, 4, 0, -1], -1))
    end

    def test_element_at_check_index_greater_than_array_length()
        prob = Problem2.new()
        assert_equal("Index cannot be greater than array length", prob.element_at([9, 5, 1, 2, 3, 4, 0, -1], 10))
    end
    
    def test_element_at()
        prob = Problem2.new()
        assert_equal(-1, prob.element_at([9, 5, 1, 2, 3, 4, 0, -1], 7))
    end

    
    def test_inclusive_range_check_start_pos_less_than_zero()
        prob = Problem2.new()
        assert_equal("Starting index cannot be less than 0", prob.inclusive_range([9, 5, 1, 2, 3, 4, 0, -1], -1, 7))
    end

    def test_inclusive_range_at_check_end_pos_greater_than_array_length()
        prob = Problem2.new()
        assert_equal("End position cannot be greater than or equal to array length", prob.inclusive_range([9, 5, 1, 2, 3, 4, 0, -1], 0, 10))
    end

    def test_inclusive_range_check_start_pos_greater_than_end_pos()
        prob = Problem2.new()
        assert_equal("Start position cannot be greater than end position", prob.inclusive_range([9, 5, 1, 2, 3, 4, 0, -1], 5, 0))
    end
    
    def test_inclusive_range()
        prob = Problem2.new()
        assert_equal([9, 5, 1, 2, 3, 4, 0, -1], prob.inclusive_range([9, 5, 1, 2, 3, 4, 0, -1], 0, 7))
    end


    def test_non_inclusive_range_check_start_pos_less_than_zero()
        prob = Problem2.new()
        assert_equal("Starting index cannot be less than 0", prob.non_inclusive_range([9, 5, 1, 2, 3, 4, 0, -1], -1, 7))
    end

    def test_non_inclusive_range_at_check_end_pos_greater_than_array_length()
        prob = Problem2.new()
        assert_equal("End position cannot be greater than or equal to array length", prob.non_inclusive_range([9, 5, 1, 2, 3, 4, 0, -1], 0, 10))
    end

    def test_non_inclusive_range_check_start_pos_greater_than_end_pos()
        prob = Problem2.new()
        assert_equal("Start position cannot be greater than end position", prob.non_inclusive_range([9, 5, 1, 2, 3, 4, 0, -1], 5, 0))
    end
    
    def test_non_inclusive_range()
        prob = Problem2.new()
        assert_equal([9, 5, 1, 2, 3, 4, 0], prob.non_inclusive_range([9, 5, 1, 2, 3, 4, 0, -1], 0, 7))
    end


    def test_start_and_length_check_start_pos_less_than_zero()
        prob = Problem2.new()
        assert_equal("Starting index cannot be less than 0", prob.start_and_length([9, 5, 1, 2, 3, 4, 0, -1], -1, 7))
    end

    def test_start_and_length_at_check_start_pos_greater_than_array_length()
        prob = Problem2.new()
        assert_equal("Starting index cannot be greater than array length", prob.start_and_length([9, 5, 1, 2, 3, 4, 0, -1], 10, 2))
    end

    def test_start_and_length_check_length_less_than_zero()
        prob = Problem2.new()
        assert_equal("Length cannot be less than 0", prob.start_and_length([9, 5, 1, 2, 3, 4, 0, -1], 5, -2))
    end

    def test_start_and_length_check_length_equal_to_zero()
        prob = Problem2.new()
        assert_equal([], prob.start_and_length([9, 5, 1, 2, 3, 4, 0, -1], 5, 0))
    end
    
    def test_start_and_length()
        prob = Problem2.new()
        assert_equal([9, 5], prob.start_and_length([9, 5, 1, 2, 3, 4, 0, -1], 0, 2))
    end
end