require "test/unit"
require_relative "03"

class Test03 < Test::Unit::TestCase
    def test_make_object
        prob = Problem3.new()
        assert prob.instance_of? Problem3
    end

    def test_create_hash
        prob = Problem3.new()
        assert_equal({1=>1, 2=>4, 3=>9, 4=>16, "Hello"=>"World"}, prob.create_hash())
    end

    def test_add_pair
        prob = Problem3.new()
        assert_equal({1=>1, 2=>4, 3=>9, 4=>16, "Hello"=>"World", 54121=>100}, prob.add_pair({1=>1, 2=>4, 3=>9, 4=>16, "Hello"=>"World"}, 54121, 100))
    end

    def test_add_pair_key_present
        prob = Problem3.new()
        assert_equal("Key value already exist", prob.add_pair({1=>1, 2=>4, 3=>9, 4=>16, "Hello"=>"World", 54121=>100}, 54121, 100))
    end

    def test_retain_integer_keys
        prob = Problem3.new()
        assert_equal({1=>1, 2=>4, 3=>9, 4=>16, 54121=>100}, prob.retain_integer_keys({1=>1, 2=>4, 3=>9, 4=>16, "Hello"=>"World", 54121=>100}))        
    end

    def test_delete_even_keys
        prob = Problem3.new()
        assert_equal({1=>1, 3=>9, 54121=>100}, prob.delete_even_keys({1=>1, 2=>4, 3=>9, 4=>16, 54121=>100}))        
    end
end