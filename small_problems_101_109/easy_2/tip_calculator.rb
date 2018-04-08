def tip_calculator
  
  puts "Enter the bill amount:"
  bill = gets.to_f.round(2)
  
  puts "What is your tip rate?:"
  tip_rate = (gets.to_f/100).round(2)
  
  tip = tip_rate * bill
  
  puts "The tip is $#{tip}"
  puts "The total is $#{bill + tip}."
end
