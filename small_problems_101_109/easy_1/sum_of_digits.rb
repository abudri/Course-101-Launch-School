def sum_of_digits(num)
  sum = 0
  num.digits.each do |num|
    sum += num
  end
  sum
end

=begin
Write a method that takes one argument, a positive integer, and returns the sum of its digits.

Examples:

puts sum(123_456_789) 
puts sum(496) == 19
puts sum(123_456_789) == 45
The tests above should print true.

Understand the problem: given

Set up your test cases: given

Describe your inputs, outputs, and data structures
Inputs: integer
Outputs: integer, sum of each individual number in given num
Data structure(s): integer, array

Describe your algorithm: take a number, use Integer#digits to turn into array containing each digit, sum the digits and return sum

Begin coding

=end
