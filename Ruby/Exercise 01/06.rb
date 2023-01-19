# In this challenge, we will try to encode and decode a string to base 64 format, and have it written to a file. Perform the following tasks:
# 1. Create a file having the following contents:
#   Originally, John Doe was a sham name used to indicate any plaintiff in an action of ejectment (a legal action to regain property) in civil court [ “
#   the string that will be base encoded ”]. Richard Roe was the counterpart, to indicate the defendant. These fake names were used in delicate legal matters,
#   a practice that was abolished in English law in 1852.
# 2. Read the content from the file
# 3. Base64 encode the string containing the string that will be base encoded line.
# 4. Write the extracted and encoded string to a new file.
# 5. The file name should be <your name>.txt

require "base64"

class Problem6
    def encode_file(str)
        data = File.read('./data_exp_06.txt')
        if data
            data[str] = Base64.encode64(str).chomp()
            File.write("./Omkar.txt", data)
            return File.read("./Omkar.txt")
        else
            return "File cannot be opened"
        end
    end
end

prob = Problem6.new()
data = "Originally, John Doe was a sham name used to indicate any plaintiff in an action of ejectment (a legal action to regain property) in civil court [ “ the string that will be base encoded ”]. Richard Roe was the counterpart, to indicate the defendant. These fake names were used in delicate legal matters, a practice that was abolished in English law in 1852."
str = "the string that will be base encoded"
f = File.new("./data_exp_06.txt", "w+")
f.puts data
f.close
if data.include? str
    puts prob.encode_file(str)
else
    puts "String doesn't exist"
end