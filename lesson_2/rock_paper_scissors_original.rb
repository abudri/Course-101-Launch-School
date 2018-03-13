# https://launchschool.com/lessons/a0f3cd44/assignments/9e75343c
=begin 

Walk-through: Rock Paper Scissors
In this assignment, we'll build a Rock Paper Scissors game. The game flow should go like this:

the user makes a choice
the computer makes a choice
the winner is displayed

we play against the computer, computer makes a choice as do you
=end


VALID_CHOICES = ['rock', 'paper', 'scissors']
# constant, needed as a valid choice

def prompt(message)
  Kernel.puts("=> #{message}")
end


loop do # main execution loop

choice = '' # so we can use it outside the do/end block below
loop do
prompt("Choose one: #{VALID_CHOICES.join(', ')}") 
# prompt("Choose one: Rock, Paper, Scissors")
# we use the .join on VALID_CHOICES to give a string separated by commas
# that way if we need to add more values, can just add to VALID_CHOICES
choice = Kernel.gets().chomp()

  if VALID_CHOICES.include?(choice)
    break
  else
    prompt("That's not a valid choice.") #goes to top of loop here
  end
end

computer_choice = VALID_CHOICES.sample
# use .sample to get random element from an array, held in constant VALID_CHOICES

Kernel.puts("You chose #{choice}, and computer chose #{computer_choice}")

#now calculate for who wins
if (choice == 'rock' && computer_choice == 'scissors') ||
  (choice == 'paper' && computer_choice == 'rock')  ||
  (choice == 'scissors' && computer_choice == 'paper')
  prompt("You won!")
elsif (choice == 'rock' && computer_choice == 'paper') ||
    (choice == 'scissors' && computer_choice == 'rock') ||
    (choice == 'paper' && computer_choice == 'scissors')
  prompt("Computer won!")
else 
  prompt("Its a tie!")
end

prompt("Do you want to play again?")
answer = Kernel.gets().chomp()
break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing the game!")




