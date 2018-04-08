def average(num_array)
  sum = 0
  average = 0
  num_array.each do |num|
    sum = sum + num
  end
  average = sum / num_array.size 
  average
end

=begin
Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers.

Examples:

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
The tests above should print true.

Understand the problem: given

Set up your test cases: given

Describe your inputs, outputs, and data structures
Inputs: array if integers
Outputs: whole integer, the average

Data structure(s): integer, array, back to strings

Describe your algorithm: iterate through each element, and add it to the ongoing sum, return the sum.

Begin coding

=end