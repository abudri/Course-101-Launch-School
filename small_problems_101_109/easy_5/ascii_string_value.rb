def ascii_value(str)
  sum = 0
  str.each_char {|char| sum += char.ord }
  sum
end 

