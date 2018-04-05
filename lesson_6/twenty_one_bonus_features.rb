require 'pry'
# 101, Lesson 6, Assignment: Twenty-One Bonus Features
# https://launchschool.com/lessons/de05b300/assignments/1b9810ab

# 1. was able to do player_total and dealer_total successfully
# 4. trying to keep track of score broke this
#    my regular file twenty_one.rb without bonuses, does appear to work fine

# ------ CONSTANTS --------

SUITS = ['hearts', 'diamonds', 'clubs', 'spades']
CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

# ----- METHODS ---------

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  deck = SUITS.product(CARDS)
  deck.shuffle!
end

def deal_card(deck)
  deck.pop
end

def start_game(deck, player_cards, dealer_cards)
  player_cards << deal_card(deck) << deal_card(deck)
  dealer_cards << deal_card(deck) << deal_card(deck)
end

def player_turn(deck, player_cards)
  player_cards << deal_card(deck)
end

def dealer_turn(deck, dealer_cards)
  dealer_cards << deal_card(deck)
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(total)
  total > 21
end

def display_score(player_cards, player_total, dealer_cards, dealer_total)
  puts ""
  prompt "GAME SUMMARY:"
  prompt "#{player_cards} are your cards"
  prompt "Your Total: #{player_total}"
  prompt "#{dealer_cards} are the dealer's cards"
  prompt "Dealer Total: #{dealer_total}"
end

def determine_winner(player_total, dealer_total, player_wins, dealer_wins)
  return if busted?(player_total) || busted?(dealer_total)
  if player_total > dealer_total
    prompt "You win!" 
    player_wins += 1
  elsif dealer_total > player_total
    prompt "Dealer wins!"
    dealer_wins += 1
  else player_total == dealer_total
    prompt "Its a tie!"
    player_wins += 1
    dealer_wins += 1
  end
end

# ------- MAIN PROGRAM --------

loop do # main loop
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  answer = nil

  player_wins = 0
  dealer_wins = 0 

  start_game(deck, player_cards, dealer_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  prompt "#{player_cards} are your two starting cards| Total: #{player_total}"
  prompt "#{dealer_cards} are dealer's two starting cards | Total: #{dealer_total}"

  loop do # player turn loop
    puts "hit or stay?"
    answer = gets.chomp
    break if answer == 'stay' || busted?(player_total)
    player_turn(deck, player_cards)
    player_total = total(player_cards)
    prompt "#{player_cards} are your cards | Total: #{player_total}}"
    break if busted?(player_total)
  end

  loop do # dealer turn loop
    break if busted?(player_total) || dealer_total >= 17 # dealer stay
    prompt "Now it's the Dealer's turn to hit again...:"
    sleep(1)
    loop do
      dealer_turn(deck, dealer_cards)
      dealer_total = total(dealer_cards)
      break if dealer_total >= 17 || busted?(dealer_total)
      # above is for dealer stay or busted
    end
  end

  display_score(player_cards, player_total, dealer_cards, dealer_total)

  if busted?(player_total)
    # binding.pry
    prompt "You breached 21, busted! Dealer wins!"
    dealer_wins += 1
  end

  if busted?(dealer_total)
    prompt "The Dealer breached 21, busted! You win!"
    player_wins += 1
  end

  sleep(1)
  determine_winner(player_total, dealer_total, player_wins, dealer_wins) 

  if player_wins == 5
    prompt "You are the Grand Winner, Congrats!"
    break
  elsif dealer_wins == 5
    prompt "Dealer is the Grand Winner!"
    break
  end 

  prompt "Would you like to play again?"
  answer = gets.chomp.downcase
  break if answer.start_with?('n')
end

prompt "Thanks for playing Twenty-One!"
