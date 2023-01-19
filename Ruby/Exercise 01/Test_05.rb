require "test/unit"
require_relative "05"

class Test05 < Test::Unit::TestCase
    def test_make_object
        prob = Problem5.new()
        assert prob.instance_of? Problem5
    end

    def test_create_file
        assert_equal(true, File.file?('./data_exp_05.json'))
    end

    def test_check_file_content
        assert_equal('{"name"=>"Nicole Smith", "age"=>25, "salary"=>25552.67}', JSON.parse(File.read('./data_exp_05.json')).to_s)
    end

    def test_update_file
        prob = Problem5.new()
        assert_equal('{"age"=>25, "salary"=>25552.67, "first_name"=>"Nicole", "last_name"=>"Smith"}', prob.update_file().to_s)
    end

    def test_new_file_data
        prob = Problem5.new()
        data = JSON.parse(File.read('./data_exp_05.json'))
        assert_equal('{"name":"Nicole Smith","age":25,"salary":25552.67}', prob.new_file(data))
    end

end