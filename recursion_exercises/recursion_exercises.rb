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

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

#------Merge Sort----------
class Array
  def merge_sort
    return self if self.length == 1
    middle = self.length / 2
    merge(self[0...middle].merge_sort, self[middle..-1].merge_sort)
  end

  def merge(arr1, arr2) 
    new_arr = []
    while arr1.length > 0 && arr2.length > 0
      if arr1[0] < arr2[0]
        new_arr << arr1[0]
        arr1.shift
      else
        new_arr << arr2[0]
        arr2.shift
      end
    end

    new_arr += arr1 if arr1.length > 0
    new_arr += arr2 if arr2.length > 0
    new_arr
  end
end

# p [38,27,43,3,9,82,10].merge_sort

#-------Array subsets------
def subsets(array)
  return [[]] if array.length == 0
  previous = subsets(array[0...-1])
  new_arr = previous.dup
  previous.each {|arr| new_arr << arr + [array[-1]]}
  new_arr
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]
# p subsets([1,2,3,4])

#------Permutations--------

def permutations(array)
  return [array] if array.length == 1
  previous = permutations(array[0...-1])
  new_arr = []
  previous.each do |arr| 
    i = 0
    while i <= arr.length
      new_arr << arr[0...i] + [array[-1]] + arr[i..-1]
      i += 1
    end
  end
  new_arr
end

# p permutations([1,2,3])

#--------Make_Change--------
def greedy_make_change(amount, coins = [25,10,5,1])
  new_arr = []
  max_coin = nil
  coins.each do |coin|
    if amount >= coin && max_coin.nil?
      max_coin = coin
    end
  end

  new_arr += [max_coin] + greedy_make_change(amount - max_coin, coins) if max_coin
  new_arr
end

# p greedy_make_change(24, [10,7,1])

def make_change(amount, coins = [25,10,5,1])
  return [] if amount == 0
  new_arr = []
  coins.each_with_index do |coin,i|
    if amount >= coin
      new_arr << ([coin] + make_change(amount - coin, coins[i..-1])).flatten
    end
  end
  new_arr.sort_by! { |array| array.length}[0] 
end

# p make_change(24, [10,7,1])

# -----More Recursion Questions-------

def rec_sum(array)
  return nil if array.length == 0
  return array[0] if array.length == 1
  array.pop + rec_sum(array)
end

# p rec_sum([1,2,3,4])

def rec_contains(array, target)
  return false if array.length == 0
  
  if array[-1] == target 
    return true
  else
    rec_contains(array[0...-1], target)
  end
end

# p rec_contains([1,2,3,4], 2)
# p rec_contains([1,2,3,4], 6)

def rec_num_of_occurrences(array, target)
  return 0 if array.length == 0 
  if array[-1] == target 
    return 1 + rec_num_of_occurrences(array[0...-1], target)
  else
    return 0 + rec_num_of_occurrences(array[0...-1], target)
  end
end

# p rec_num_of_occurrences([1,2,2,2,1,1,2], 2)

def rec_add_to_twelve?(array)
  return false if array.length <= 1
  return array[0] + array[1] == 12 if array.length == 2

  if array[-1] + array[-2] == 12
    return true 
  else
    rec_add_to_twelve?(array[0...-1])
  end
end

def rec_sorted?(array)
  return true if array.length == 1
  if array[-1] < array[-2]
    return false 
  else
    rec_sorted?(array[0...-1])
  end
end

# p rec_sorted?([1,2,3,10,5,6])

def rec_reverse(string)
  return "" if string.length == 0
  new_str = ""
  new_str + string[-1] + rec_reverse(string[0...-1])
end

p rec_reverse("hello world!")

