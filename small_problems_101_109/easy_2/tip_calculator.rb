def tip_calculator
  
  puts "Enter the bill amount:"
  bill = gets.to_f.round(2)
  
  puts "What is your tip rate?:"
  tip_rate = (gets.to_f/100).round(2)
  
  tip = tip_rate * bill
  
  puts "The tip is $#{tip}"
  puts "The total is $#{bill + tip}."
end

=begin



Tip calculator
Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

Example:

What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
=end