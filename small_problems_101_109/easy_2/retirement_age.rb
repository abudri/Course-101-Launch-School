
def retirement
  
  puts "What is your age?"
  age = gets.to_i
  
  puts "At what age would you like to retire?"
  retire_at = gets.to_i
  
  year = Time.now.year
  
  work_left = retire_at - age
  retirement_year = year + work_left
  
  puts "Its #{year}. You will retire in #{retirement_year}"
  puts "You only have #{work_left} years of work to go!"
  
end
