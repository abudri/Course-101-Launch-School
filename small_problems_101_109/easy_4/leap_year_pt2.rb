def leap_year?(year)
  
  if year >= 1752
    if year % 4 == 0 && year % 100 != 0
      true
    elsif year % 4 == 0 && year % 100 == 0 && year % 400 == 0 
      true
    else
      false
    end
  else
    return true if year % 4 == 0
    false
  end 
end 
