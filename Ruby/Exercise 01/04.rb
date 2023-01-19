# Complete the skip_sports method that takes a sports array and a skip integer and returns an array of all elements except first skip numbers

class Problem4
    def skip_sports(sports, skip)
        if skip < 0
            return "Skip cannot be less than 0"
        end
        if skip >= sports.length
            return "Skip cannot be greater than or equal to array length"
        end
        hash = {}
        for index in skip...sports.length
            hash[index] = sports[index]
        end
        return hash
    end
end

prob = Problem4.new()
sports = ["Cricket", "TT", "Football", "Hockey"]
puts prob.skip_sports(sports, 2)