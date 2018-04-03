require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # colums
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear' # clears screen for easier viewing of board
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  # above is creating new key-value pair in hash
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
  # above grabs keys that have values of space, ' '
end
# above returns an array of integers that reprsent the empty squares
# this inspects board, but player_pieces_piece changes the board

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{empty_squares(brd).join(',')}):"
    square = gets.chomp.to_i
    # above if user puts 1, modify the value of key 1 in board hash
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice."
  end
  brd[square] = PLAYER_MARKER # keys are integers so .to_i on line above
end

def computer_places_piece!(brd)
  # want a random value out of an array of keys
  square = empty_squares(brd).sample # returns an integer
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty? # returns empty array if no more empty squares
end

def someone_won?(brd)
  !!detect_winner(brd) # !! forces detect_winner(brd) to return boolean
  # if detect returns a string "player", !! will turn string to true, if nil,
  # !! will turn that to false
  # since its a ? method, want to try to return a boolean, true or false
end

def detect_winner(brd) # winning combos here
  WINNING_LINES.each do |line| # each inner array is a line, like [1, 2, 3]
    # if brd[line[0]] == PLAYER_MARKER &&
    #    brd[line[1]] == PLAYER_MARKER &&
    #    brd[line[2]] == PLAYER_MARKER
    #   return 'Player'
    # elsif brd[line[0]] == COMPUTER_MARKER &&
    #      brd[line[1]] == COMPUTER_MARKER &&
    #      brd[line[2]] == COMPUTER_MARKER
    #  return 'Computer'
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      # *line is same as line[0], line[1], line[2], so passing in all elements
      # of line into the values_at method, syntaxtical sugar
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil # represents no one has won yet, someone_won? relies on nil to
  # return whether someone one or not
end

loop do # basically looping the whole game here down below,
  # and at end of this asking if player wants to play again

  board = initialize_board

  loop do
    display_board(board) # do this because can possibly break after
    # player goes, & before computer goes, so need to display board again
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board) # -1:51 in video 3 or 4
    computer_places_piece!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Play again (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe, Good Bye!"

=begin
drawing the board will happen over and over: display the board
2-7 steps are basically a loop
display the board each time the user and computer
make a move --> method display_board
- above moethod needs input, need DATA STRUCTURE, perhaps an array:
  example: ['X', 'O', '', 'X']
  really no wrong data structure, could be array or nested, array
  we are going to do a hash
  {1 = 'X', 2=> 'O', 3=> ' '}, the keys will represent the square
  in the board, and value represents what is displayed, X, O or space
  The hash data structure is what we use to represent board state at
  any time in our application/program
  initial hash value are space, ' '

1. Display the initial empty 3x3 board.
2. Ask the user to mark a square.
3. Computer marks a square.
4. Display the updated board state.
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to #1
10. Good bye!
=end
