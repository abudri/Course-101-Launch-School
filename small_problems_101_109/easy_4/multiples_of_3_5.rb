def multisum(num)
  numbers = []
  sum = 0
  (2..num).each {|i| numbers << i if i % 3 == 0 || i % 5 == 0}
  numbers.each {|num| sum += num}
  sum 
end

# basically, if its evenly divisible by 3, it will be added to array 'numbers'
# that i % 3 == 0, will also catch 15, so no doubles in array 'numbers'
# if its not i % 3 == 0, then i % 5 == 0 will also shuffle such numbers into array 'numbers'
# iterate over the array and add each element to 'sum', which starts at 0.
# we do the range (2..num), because our specifications don't include 1, so no (1..num) 
