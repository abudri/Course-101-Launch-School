def interleave(arr1, arr2)
  new_arr = []
  index = 0 
  while index < arr1.size
    new_arr << arr1[index]
    new_arr << arr2[index]
    index +=1 
  end
  new_arr
end 

