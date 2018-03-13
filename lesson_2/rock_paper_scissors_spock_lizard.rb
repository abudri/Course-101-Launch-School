
VALID_CHOICES = %w(rock paper scissors spock lizard)
VALID_INPUTS = %w(r p s sp l)
# VALID_INPUTS so user can just type a letter or two for input

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  # below covers all win scenarios for game, first player, second player
  (first == 'rock' && second == 'scissors') ||
  (first == 'paper' && second == 'rock') ||
  (first == 'scissors' && second == 'paper') ||
  (first == 'rock' && second == 'lizard') ||
  (first == 'lizard' && second == 'spock') ||
  (first == 'spock' && second == 'scissors') ||
  (first == 'scissors' && second == 'lizard') ||
  (first == 'lizard' && second == 'paper') ||
  (first == 'paper' && second == 'spock') ||
  (first == 'spock' && second == 'rock')
end

# below method invokes above 'win?' method
def display_result(player, computer)
  # now calculate for who wins
  if win?(player, computer) # pass in player(you) as first player
    # and this executes if you won
    prompt('You won!')
  elsif win?(computer, player) # pass in computer as first player
    # and this executes if computer won
    prompt('Computer won!')
  else
    prompt('Its a tie!')
  end
end

# ----------------------

loop do # main execution loop
  choice = '' # so we can use it outside the do/end block below
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("Type the FIRST letter of your choice. For Spock, type 'sp'")
    # prompt("Choose one: Rock, Paper, Scissors")
    # we use the .join on VALID_CHOICES to give a string separated by commas
    # that way if we need to add more values, can just add to VALID_CHOICES
    choice = gets.chomp.downcase

    if VALID_INPUTS.include?(choice)
      case choice
      when 'r'
        choice = 'rock'
      when 'p'
        choice = 'paper'
      when 's'
        choice = 'scissors'
      when 'sp'
        choice = 'spock'
      when 'l'
        choice = 'lizard'
      end
      break
    else
      prompt("That's not a valid choice.") # goes to top of loop here
    end
  end

  computer_choice = VALID_CHOICES.sample
  puts("You chose #{choice}, and computer chose #{computer_choice}")
  display_result(choice, computer_choice) # method at top of program

  player_wins = ''
  computer_wins = ''

  if player_wins == 5
    puts 'You are the final winner by reaching 5 wins first, congrats!'
    break
  elsif computer_wins == 5
    puts 'The computer is the final winner by reaching 5 wins first!'
    break
  end

  break if player_wins == 5 || computer_wins == 5

  prompt("Play again? Enter 'y' to play, or any other key to Exit")
  answer = gets.chomp.downcase
  break unless answer == 'y'
end
