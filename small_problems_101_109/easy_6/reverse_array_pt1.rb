# https://launchschool.com/exercises/eec5e591 

def reverse!(arr)
  index = 0 
  arr.count.times do 
    arr.insert(index, arr.pop)
    index += 1 
  end 
end
