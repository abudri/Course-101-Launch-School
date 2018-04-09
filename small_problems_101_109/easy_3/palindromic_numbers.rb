def palindromic_number?(num)
  return true if num.to_s == num.to_s.reverse
  false
end 
