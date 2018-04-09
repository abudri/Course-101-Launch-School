def oddities(arr)
  new_arr = []
  arr.each_with_index do |element, index|
    new_arr << element if index.even?
  end 
  new_arr
end

