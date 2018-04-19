# https://launchschool.com/exercises/577016f3

# study of inject helped:
# https://blog.udemy.com/ruby-inject/
#  basically the argument for #Enumerable#inject is the ([]), an empty array
# within the block that empty array is called 'new_arr' and from there you will add to it, and it is the returned array

def reverse(arr)
  index = 0 
  arr.inject([]) do |new_arr, element|
    new_arr << arr[index -= 1]
  end
end 


