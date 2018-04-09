def greet_user
  
  puts "What is your name?"
  name = gets.chomp
  
  if name.include?('!')
    puts "HELLO #{name.upcase.delete('!')}. WHY ARE WE SCREAMING?"
  else 
    puts "Hello #{name}."
  end
  
end

