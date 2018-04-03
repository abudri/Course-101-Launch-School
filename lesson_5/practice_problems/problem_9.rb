=begin

Practice Problem 9
Given this data structure, return a new array of the same structure
 but with the sub arrays being ordered (alphabetically or numerically 
 as appropriate) in descending order.

=end 

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |array| #takes each inner array, passes to local varible 'array'
  array.sort do |a, b| #compares each string or number to each other
    b <=> a #instead of a <=> b for normal ascending sort, this causes descending sort
  end
end

# working code example of descending order for strings
#['b', 'c', 'a'].sort do |a, b|
#  b <=> a
#end
# resource:
# https://launchschool.com/lessons/c53f2250/assignments/2831d0e1

