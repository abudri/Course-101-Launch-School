def multiply_list(arr1, arr2)

  product_arr = []
  
  i = 0
  while i < arr1.size  # arr2.size is fine too, both same size
    product_arr << arr1[i] * arr2[i]
    i += 1
  end 
  
  product_arr
end 
