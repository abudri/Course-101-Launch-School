def multiply_all_pairs(arr1, arr2)

  product_arr = []
  i = 0 
  
  while i < arr1.size
    arr2.each do |num|
      product_arr << num * arr1[i]
    end
    i += 1
  end 
  
  product_arr.sort
end 
