
require 'pry'
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  
  loop do 
    if dot_separated_words.size > 5 || dot_separated_words.size < 4
      puts "Please input a 4 component ip address only."
      break
      binding.pry
    end

    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      if is_an_ip_number?(word) == false
        return false
      end 
    end
  end
  return true
end

# NEEDS TO;
# return a false condition

# handling the case that there are more or fewer than 4 
# components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" 
# should be invalid)."
=begin

intake ip address
count to see if greater than 4 or fewer than 4 
  IF so, ask user for valid input


# handles false return
if is_an_ip_number?(word) == false
  return false
end
=end
