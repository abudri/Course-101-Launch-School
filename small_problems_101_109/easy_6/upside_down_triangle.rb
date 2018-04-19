def upside_down_triangle(n)
  i = n
  spaces = 0
  n.times do 
    puts '*'*i + ' '*spaces
    i -= 1 
    spaces += 1
  end 
end
