require 'pry'

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
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(current_player_hand)
  total(current_player_hand) > 21
end

def display_score(player_cards, dealer_cards)
  puts ""
  prompt "GAME SUMMARY:"
  prompt "#{player_cards} are your cards"
  prompt "Your Total: #{total(player_cards)}"
  prompt "#{dealer_cards} are the dealer's cards"
  prompt "Dealer Total: #{total(dealer_cards)}"
end

def determine_winner(player_cards, dealer_cards)
  return if busted?(player_cards) || busted?(dealer_cards)
  prompt "You win!" if total(player_cards) > total(dealer_cards)
  prompt "Dealer wins!" if total(dealer_cards) > total(player_cards)
  prompt "Its a tie!" if total(player_cards) == total(dealer_cards)
end

# ------- MAIN PROGRAM --------

loop do # main loop
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  answer = nil

  start_game(deck, player_cards, dealer_cards)
  prompt "#{player_cards} are your two starting cards| Total: #{total(player_cards)}"
  prompt "#{dealer_cards} are dealer's two starting cards | Total: #{total(dealer_cards)}"

  loop do # player turn loop
    puts "hit or stay?"
    answer = gets.chomp
    break if answer == 'stay' || busted?(player_cards)
    player_turn(deck, player_cards)
    prompt "#{player_cards} are your cards | Total: #{total(player_cards)}"
    break if busted?(player_cards)
  end

  loop do # dealer turn loop
    break if busted?(player_cards) || total(dealer_cards) >= 17 # dealer stay
    prompt "Now it's the Dealer's turn to hit again...:"
    sleep(1)
    loop do
      dealer_turn(deck, dealer_cards)
      break if total(dealer_cards) >= 17 || busted?(dealer_cards)
      # above is for dealer stay or busted
    end
  end

  display_score(player_cards, dealer_cards)

  if busted?(player_cards)
    prompt "You breached 21, busted! Dealer wins!"
  end

  if busted?(dealer_cards)
    prompt "The Dealer breached 21, busted! You win!"
  end

  sleep(1)
  determine_winner(player_cards, dealer_cards)

  prompt "Would you like to play again?"
  answer = gets.chomp.downcase
  break if answer.start_with?('n')
end

prompt "Thanks for playing Twenty-One!"
