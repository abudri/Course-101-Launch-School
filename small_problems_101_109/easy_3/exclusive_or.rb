def xor?(arg1, arg2)
  if arg1 && !arg2
    true
  elsif arg2 && !arg1
    true
  else
    false
  end 
end
