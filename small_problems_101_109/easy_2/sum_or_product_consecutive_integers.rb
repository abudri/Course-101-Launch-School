
def sum_or_product
  
  puts ">> Please enter an integer greater than 0:"
  num = gets.to_i 
  
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp.downcase
  
  if operation == 's'
    sum = 0
    num.downto(1) {|num| sum += num}
    puts "The sum of the integers between 1 and #{num} is #{sum}."
  elsif operation == 'p'
    product = 1
    num.downto(1) {|num| product *= num}
    puts "The product of the integers between 1 and #{num} is #{product}."
  end
  
end 
