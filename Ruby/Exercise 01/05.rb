# 1. Save the given the content to a JSON file:
# {
# "name": "Nicole Smith",
# "age": 25,
# "salary": 25552.67,
# }
# 2. Read from this newly created JSON file and change the name to first name and last name as 2 separate key value pairs. 
# 3. Save the contents to a new JSON file in the same folder having a name as follows:
# <Your name>_<timestamp>.json, timestamp should be in UTC format.

require "json"

class Problem5
    def update_file()
        f = File.read('./data_exp_05.json')
        data = JSON.parse(f)
        name = data["name"]
        names = name.split()
        data["first_name"] = names[0]
        data["last_name"] = names[1]
        data.delete("name")
        return data
    end

    def new_file(data)
        str = "OmkarSavoikar_#{Time.now.utc.strftime("%Y-%m-%d %H-%M-%S")}.json"
        File.write("./#{str}", JSON.dump(data))
        return (File.read("./#{str}"))
    end
end

prob = Problem5.new()
f = File.new("./data_exp_05.json", "w+")
f.puts '{"name": "Nicole Smith", "age": 25, "salary": 25552.67}'
f.close
puts "File Creation: #{JSON.parse(File.read('./data_exp_05.json'))}"
data = prob.update_file()
puts "Updated data: #{data}"
puts "New file: #{prob.new_file(data)}"
