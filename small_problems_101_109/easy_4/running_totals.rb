def running_total(arr)
  sum = 0
  arr.each_with_object([]) do |num, array|
    array << sum += num
  end
end 

# main solution:
#def running_total(array)
#  sum = 0
#  array.map do |value|
#    sum += value
#  end 
#end
