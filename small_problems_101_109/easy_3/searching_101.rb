
def searching_101
  nums_array = []
  
  puts "==> Enter the 1st number:"
  nums_array << gets.to_i
  puts "==> Enter the 2nd number:"
  nums_array << gets.to_i
  puts "==> Enter the 3rd number:"
  nums_array << gets.to_i
  puts "==> Enter the 4th number:"
  nums_array << gets.to_i
  puts "==> Enter the 5th number:"
  nums_array << gets.to_i
  puts "==> Enter the last number:"
  nums_array << gets.to_i
  
  if nums_array.first(5).include?(nums_array.last)
    puts "The number #{nums_array.last} appears in #{nums_array.first(5)}."
  else
    puts "The number #{nums_array.last} does not appear in #{nums_array.first(5)}."
  end
end

