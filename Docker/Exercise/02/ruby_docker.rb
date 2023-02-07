require "json"

class Problem02
    def myFun
        str = '{
			"name": "Omkar",
			"age": 23
		}'
        data = JSON.parse(str)
        return data
    end
end

prob = Problem02.new
data = prob.myFun
puts "Name: #{data['name']}"
puts "Age: #{data['age']}"