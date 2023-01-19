# In this challenge, your task is to code a serial_average method which is described below: It takes a fixed width string in format: SSS-XX.XX-YY.YY. SSS is a three digit serial number, XX.XX and YY.YY are two digit numbers including up to two decimal digits. It returns a string containing the answer in format SSS-ZZ.ZZ where SSS is the serial number of that input string, and ZZ.ZZ is the average of XX.XX and YY.YY. All numbers are rounded off to two decimal places

class Problem1
    def average(num1, num2)
        return (num1 + num2) / 2
    end

    def serial_average(inp)
        nums = inp.split("-")
        avg = average(nums[1].to_f, nums[2].to_f)
        if avg < 10
            avg = "0" + avg.to_s
        end
        if avg.to_s.length != 5
            avg = avg.to_s + "0"
        end
        return "#{nums[0]}-#{avg}"
    end
end

prob = Problem1.new

puts prob.serial_average("002-10.00-10.00")