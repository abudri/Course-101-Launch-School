def swapcase(str)
  
  new_string =
  
  str.split('').map do |char|
    if ('a'..'z').include?(char)
      char.upcase
    elsif ('A'..'Z').include?(char)
      char.downcase
    else
      char 
    end
  end
  
  new_string.join
end
