# For this challenge, your task is to complete the functions using ruby syntax. Assume the array to be arr = [9, 5, 1, 2, 3, 4, 0, -1]

class Problem2
    def element_at(arr, index) # return the element of 'arr' at position 'index' 
        if index < 0
            return "Index cannot be less than 0"
        end
        if index >= arr.length
            return "Index cannot be greater than array length"
        end
        return arr[index]
    end

    def inclusive_range(arr, start_pos, end_pos) # return the elements of 'arr' between position 'start_pos' and 'end_pos'
        if start_pos < 0
            return "Starting index cannot be less than 0"
        end
        if end_pos >= arr.length
            return "End position cannot be greater than or equal to array length"
        end
        if start_pos > end_pos
            return "Start position cannot be greater than end position"
        end
        return arr[start_pos..end_pos]
    end

    def non_inclusive_range(arr, start_pos, end_pos) # return the elements of 'arr' inclusive position 'start_pos' and 'end_pos' exclusive
        if start_pos < 0
            return "Starting index cannot be less than 0"
        end
        if end_pos >= arr.length
            return "End position cannot be greater than or equal to array length"
        end
        if start_pos >= end_pos
            return "Start position cannot be greater than end position"
        end
        return arr[start_pos...end_pos]
    end

    def start_and_length(arr, start_pos, length) # return 'length' elements of 'arr' from position 'start_pos'
        if start_pos < 0
            return "Starting index cannot be less than 0"
        end
        if start_pos > arr.length
            return "Starting index cannot be greater than array length"
        end
        if length < 0
            return "Length cannot be less than 0"
        end
        if length == 0
            return []
        end
        if (start_pos + length) >= arr.length
            return "End position out of bound"
        end
        return arr[start_pos..start_pos+length-1]
    end
end

arr = [9, 5, 1, 2, 3, 4, 0, -1]
prob = Problem2.new
puts "Element at 7: #{prob.element_at(arr, 7)}"
puts "Elements between 0 and 7 (inclusive): #{prob.inclusive_range(arr, 0, 7)}"
puts "Elements between 0 and 7 (exclusive): #{prob.non_inclusive_range(arr, 0, 7)}"
puts "2 elements from 0: #{prob.start_and_length(arr, 0, 2)}"