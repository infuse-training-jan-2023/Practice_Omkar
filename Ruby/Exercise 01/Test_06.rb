require "test/unit"
require_relative "06"

class Test05 < Test::Unit::TestCase
    def test_make_object
        prob = Problem6.new()
        assert prob.instance_of? Problem6
    end

    def test_create_file
        prob = Problem6.new()
        assert_equal(true, File.file?('./data_exp_06.txt'))
    end

    def test_output
        prob = Problem6.new()
        data = 'Originally, John Doe was a sham name used to indicate any plaintiff in an action of ejectment (a legal action to regain property) in civil court [ “ dGhlIHN0cmluZyB0aGF0IHdpbGwgYmUgYmFzZSBlbmNvZGVk ”]. Richard Roe was the counterpart, to indicate the defendant. These fake names were used in delicate legal matters, a practice that was abolished in English law in 1852.
'
        str = "the string that will be base encoded"
        assert_equal(data, prob.encode_file(str).force_encoding("utf-8"))
    end
end