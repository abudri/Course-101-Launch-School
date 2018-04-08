def stringy(integer)
  arr = Array.new(integer)
  arr.each_with_index do |element, index|
    arr[index] = '1' if index.even?
    arr[index] = '0' if index.odd?
  end
  p arr.join
end



=begin
Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

Examples:

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

Understand the problem: given

Set up your test cases: given

Describe your inputs, outputs, and data structures
Inputs: positive integer
Outputs: string, containing alternating string '1's and '0's, starting with '1'

Data structure(s): integer, array, back to strings

Describe your algorithm: intake the integer, create a new array with that many indexes.  use each_with_index, for each even index(0 is even, so at index 0) append '1', and for each odd index append 0.  Array#join and then puts the string

Begin coding

=end