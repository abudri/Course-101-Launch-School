# https://launchschool.com/lessons/a0f3cd44/assignments/9e75343c
=begin

Walk-through: Rock Paper Scissors
In this assignment, we'll build a Rock Paper Scissors game. The game
flow should go like this:

the user makes a choice
the computer makes a choice
the winner is displayed

we play against the computer, computer makes a choice as do you
=end

VALID_CHOICES = ['rock', 'paper', 'scissors']
# constant, needed as a valid choice

def test_method
  prompt('test message')
end

# test_method
# if we invoked here it errors, perhaps because the 'prompt'
# method was not loaded into memory?

def prompt(message)
  Kernel.puts("=> #{message}")
end

test_method

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') # logic for if first/player won
end

def display_result(player, computer)
  # now calculate for who wins
  if win?(player, computer) # pass in player(you) as first player
    # and this executes if you won
    prompt("You won!")
  elsif win?(computer, player) # pass in computer as first player
    # and this executes if computer won
    prompt("Computer won!")
  else
    prompt("Its a tie!")
  end
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
      prompt("That's not a valid choice.") # goes to top of loop here
    end
  end

  computer_choice = VALID_CHOICES.sample
  # use .sample to get random element from an array, held in
  # constant VALID_CHOICES

  Kernel.puts("You chose #{choice}, and computer chose #{computer_choice}")

  display_result(choice, computer_choice) # from meethod at top of program

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing the game!")

