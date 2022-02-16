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

p rec_exp2(7,7)