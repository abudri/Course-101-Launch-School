def triangle(n)
  i = n
  size = 1
  n.times do 
    puts ' '*(i - 1) + '*'*size
    i -= 1 
    size += 1
  end 
end
