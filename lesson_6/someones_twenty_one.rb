CARD_VALUE = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5,
  '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  '10' => 10, 'J' => 10, 'Q' => 10,
  'K' => 10, 'A' => 11
}

def display_welcome_message
  system('clear') || system('cls')
  puts ""
  puts "♠ ♥ ♦ ♣ Welcome to 'Twenty-One'! ♠ ♥ ♦ ♣"
  puts ""
  puts "'Twenty-One' is like Blackjack, but we "\
       "won't be doing splits or double down."
  puts ""
  prompt "Press 'enter' to deal the cards!"
  gets
end

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_tally
  { player: 0, dealer: 0, ties: 0 }
end

def initialize_deck
  values = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  suits = %w[♠ ♥ ♦ ♣]
  values.product(suits).shuffle
end

def deal_hands!(deck)
  player_hand = []
  dealer_hand = []
  2.times do
    player_hand << deck.pop
    dealer_hand << deck.pop
  end
  { player: player_hand, dealer: dealer_hand }
end

def display_both_hands(hands, player_has_gone = false)
  system('clear') || system('cls')
  puts ""
  player_has_gone ? display_hand(hands, :dealer) : display_secret_card(hands)
  puts ""
  puts ""
  display_hand(hands, :player)
  puts ""
  puts ""
end

def display_secret_card(hands)
  print "Dealer has:  "
  print "#{hands[:dealer][0][0]}(#{hands[:dealer][0][1]})"
  print " & ??? = ???"
end

def display_hand(hands, current_player)
  values = hands[current_player].map { |card| "#{card[0]}(#{card[1]})" }
  print "#{current_player.capitalize} has:  "
  print "#{joinor(values, ', ', '&')} = "
  print calculate_hand(hands, current_player).to_s
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def calculate_hand(hands, current_player)
  sum = 0
  aces = 0
  hands[current_player].each do |card|
    sum += CARD_VALUE[card[0]]
    aces += 1 if card[0] == 'A'
  end
  aces.times do
    sum -= 10 if sum > 21
  end
  sum
end

def determine_player_choice
  choice = ''
  loop do
    prompt "Hit or stay? Enter 'h' or 's'."
    choice = gets.chomp.downcase
    break if choice == 'h' || choice == 's'
    prompt "Invalid choice."
  end
  choice
end

def hit!(deck, hands, current_player)
  hands[current_player] << deck.pop
end

def bust?(hands, current_player)
  calculate_hand(hands, current_player) > 21
end

def stay?(choice)
  choice == 's'
end

def dealer_turn(deck, hands)
  dealer_sum = calculate_hand(hands, :dealer)
  player_sum = calculate_hand(hands, :player)
  if dealer_sum < player_sum
    until dealer_sum >= 17 || dealer_sum > player_sum
      hit!(deck, hands, :dealer)
      dealer_sum = calculate_hand(hands, :dealer)
      player_sum = calculate_hand(hands, :player)
    end
  end
end

def display_winner(hands)
  puts ""
  player_sum = calculate_hand(hands, :player)
  dealer_sum = calculate_hand(hands, :dealer)
  case player_sum <=> dealer_sum
  when 1 then puts "You win!"
  when 0 then puts "It's a push!"
  else        puts "The dealer wins!"
  end
  puts ""
end

def update_tally!(hands, tally)
  if bust?(hands, :player)
    tally[:dealer] += 1
  elsif bust?(hands, :dealer)
    tally[:player] += 1
  else
    compare_hands(hands, tally)
  end
end

def compare_hands(hands, tally)
  player_sum = calculate_hand(hands, :player)
  dealer_sum = calculate_hand(hands, :dealer)
  case player_sum <=> dealer_sum
  when 1  then tally[:player] += 1
  when -1 then tally[:dealer] += 1
  else         tally[:ties]   += 1
  end
end

def display_tally(tally)
  puts "Rounds won..."
  puts "========================"
  puts "Dealer: #{tally[:dealer]}"
  puts "Player: #{tally[:player]}"
  puts "Ties: #{tally[:ties]}"
  puts "========================"
end

def play_again?
  answer = ''
  loop do
    puts ""
    prompt "Play again? Press 'y' or 'n'."
    answer = gets.chomp.downcase
    break if answer == 'y' || answer == 'n'
    prompt "Invalid choice."
  end
  answer == 'y'
end

def display_goodbye_message
  puts ""
  puts "Thanks for playing Twenty-One! ♠ ♥ ♦ ♣"
  puts ""
end

display_welcome_message

tally = initialize_tally

loop do
  deck = initialize_deck
  hands = deal_hands!(deck)

  loop do
    display_both_hands(hands)
    choice = determine_player_choice
    hit!(deck, hands, :player) if choice == 'h'
    display_both_hands(hands)
    break if bust?(hands, :player) || stay?(choice)
  end

  if bust?(hands, :player)
    puts "You bust! Too bad!"
  else
    puts "You chose to stay!"
    current_player = :dealer
    player_has_gone = true
  end

  if current_player == :dealer
    dealer_turn(deck, hands)
    if bust?(hands, :dealer)
      display_both_hands(hands, player_has_gone)
      puts "Dealer Busts! You win!"
    else
      display_both_hands(hands, player_has_gone)
      display_winner(hands)
    end
  end

  update_tally!(hands, tally)
  display_tally(tally)
  break unless play_again?
end

display_goodbye_message