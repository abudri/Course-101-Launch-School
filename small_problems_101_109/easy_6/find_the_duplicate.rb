# https://launchschool.com/exercises/fc74794d

def find_dup(arr)
  arr.each do |element|
    return element if arr.count(element) == 2 
  end 
end


=begin 

Find the Duplicate
Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

Examples:

find_dup([1, 5, 3, 1]) == 1
Understand the problem: given

Set up your test cases: given

Describe your inputs, outputs, and data structures:
Inputs: arr, with one duplicate value
Outputs: the value in the array that is a duplicate
Data structure(s): array

Describe your algorithm: it appears we can just iterate through each element of the array, and if arr.count(element) == 2 then return element.

Begin coding

=end 
