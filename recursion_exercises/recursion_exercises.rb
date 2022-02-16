#-----Range------

def rec_range(start, end_point)
  return [] if end_point == start
  #return [end_point] if start == end_point
  [start] + rec_range(start+1, end_point)
end

def iter_range(start, end_point)
  new_arr = []
  (start...end_point).each {|i| new_arr << i}
  new_arr
end

#-----Exponentiation------
def rec_exp1(b, n)
  return 1 if n == 0
  b * rec_exp1(b, n-1)
end

def rec_exp2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n % 2 == 0
    even_ans = rec_exp2(b, n/2)
    return  even_ans * even_ans
  else
    odd_ans = rec_exp2(b, (n-1)/2)
    return b * (odd_ans * odd_ans)
  end
end

#------Deep dup-----
class Array
  def deep_dup
    return self.dup if self.length == 1 && !self[0].is_a?(Array)
    new_arr = Array.new()
    self.each do |data|
      if data.is_a?(Array)
        new_arr << data.deep_dup
      else
        new_arr << data
      end
    end
    new_arr
  end
end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
# p "Original Robot Parts Ids"
# robot_parts.each {|arr| p arr.object_id}

# robot_parts_copy = robot_parts.deep_dup

# p "Copied Robot parts ids"
# robot_parts_copy.each {|arr| p arr.object_id}

# p robot_parts.deep_dup
#a = [1, [2], [3, [4]]]
# a = [[[[[["string"]]]]]]

# puts "Original a ids"
# a.each {|arr| p arr.object_id}

# puts "New a ids"
# b = a.deep_dup
# b.each {|arr| p arr.object_id}
# p b


#------Fibonacci----------
def fibonacci(n)
  return [1] if n == 0
  return [1,1] if n == 1

  previous = fibonacci(n-1)
  last = previous[-1]
  second_last = previous[-2]
  previous << (last+second_last)
end

# p fibonacci(0)
# p fibonacci(1)
# p fibonacci(2)
# p fibonacci(3)
# p fibonacci(4)
# p fibonacci(5)
# p fibonacci(6)

#------Binary Search----------
def bsearch(array, target)
  return nil if !array.include?(target)
  return 0 if array.length == 1

  mid = array.length / 2
  if array[mid] == target 
    mid
  elsif array[mid] < target 
    mid + 1 + bsearch(array[mid+1..-1], target)
  else
    bsearch(array[0...mid], target)
  end
    
end


p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
