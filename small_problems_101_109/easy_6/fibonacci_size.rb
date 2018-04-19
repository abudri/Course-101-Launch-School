# code works, just starts progressively taking really long once input value increases to like 10

# https://www.natashatherobot.com/recursion-factorials-fibonacci-ruby/
# https://medium.com/launch-school/recursive-fibonnaci-method-explained-d82215c5498e

def fibonacci(n)
  if n < 2
    n
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end  

def fibonacci_size(input_length)
  n = 1 # iterator for loop, for 'n' in fibonacci(n) method
  fibonacci_number = 1 # first number in fibonacci sequence
  fibo_collection = [] # array to collect fibo numbers
  
  until fibonacci_number.to_s.size == input_length
    fibo_collection << fibonacci_number
    n += 1 
    fibonacci_number = fibonacci(n)
    # binding.pry
  end 
  
  fibo_collection << fibonacci_number
  
  fibo_collection.index(fibonacci_number) + 1 # since array index starts at 0.  
end  




=begin 

Fibonacci Number Location By Length
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

Examples:

find_fibonacci_index_by_length(2) == 7
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847


Understand the problem: given

Set up your test cases: given

Describe your inputs, outputs, and data structures:
Inputs: number that is the length of the first Fibonacci number that has that length
Outputs: integer
Data structure(s): integers

Describe your algorithm: so you get the length you are seeing as an input.  while the number.digits.size does NOT equal input_length, keep increasing the number and returning the next fibonacci number to check number.digits.size 

  each fibonacci number should be input into an array, and once that length is reached, then return the index of that number in the array]
  
  so first, build a fibonacci code example that puts the resulting sequnces of numbers into an array. 
  return the index of that in the array (may need a + 1)

Begin coding

=end 