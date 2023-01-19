# 1. Create a hash. 
# 2. Now to this hash, you have to add a key-value pair [543121, 100]. 
# 3. Retain all key-value pairs where keys are Integers ( clue : is_a? Integer ). 
# 4. Delete all key-value pairs where keys are even-valued.

class Problem3
    def create_hash()
        hash = {
            1 => 1,
            2 => 4,
            3 => 9,
            4 => 16,
            "Hello" => "World"
        }
    end

    def add_pair(hash, key, value)
        if hash.has_key? key
            return "Key value already exist"
        end
        hash[key] = value
        return hash
    end

    def retain_integer_keys(hash)
        hash.each_key do |key|
            if !key.is_a? Integer
                hash.delete(key)
            end
        end
        return hash
    end

    def delete_even_keys(hash)
        hash.each_key do |key|
            if key.even?
                hash.delete(key)
            end
        end
    end
end

prob = Problem3.new
hash = prob.create_hash()
puts "Hash: #{hash}"
puts "Adding new pair: #{prob.add_pair(hash, 543121, 100)}"
puts "Retaining integer keys: #{prob.retain_integer_keys(hash)}"
puts "Deleting even keys: #{prob.delete_even_keys(hash)}"