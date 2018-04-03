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

def joinor(array, delimiter = ', ', word = 'or')
  case array.size 
  when 0 then ''
  when 1 then array.join(' #{word} ')
  else
    array[-1] = "#{word} #{array.last}"
    array.join(delimiter)
  end
end  
# from https://launchschool.com/lessons/de05b300/assignments/874188bb

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), ',', 'or')}):"
    square = gets.chomp.to_i
    # above if user puts 1, modify the value of key 1 in board hash
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice."
  end
  brd[square] = PLAYER_MARKER # keys are integers so .to_i on line above
end

def computer_places_piece!(brd)
  square = nil

  # offense first, looks for open squares, TTT Bonus Features, 5a
  WINNING_LINES.each do |line|
    square = computer_defense(line, brd, COMPUTER_MARKER)
      break if square
  end 

  # defense second
  if !square
    WINNING_LINES.each do |line|
      square = computer_defense(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # Assignment: TTT Bonus Features, 5b
  if !square
    if empty_squares(brd).include?(5)
      5
    end
  end

  if !square
    square = empty_squares(brd).sample # returns an integer
  end

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

def computer_defense(line, board, marker)
  if board.values_at(*line).count(marker) == 2 # marker, as in, be it X or O
    board.select{ |k,v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end
# Assignment: TTT Bonus Features, 3, Computer AI Defense
# -----------------------------
# The computer currently picks a square at random. That's not very interesting. Let's make 
# the computer defensive minded, so that if there's an immediate threat, then it will defend 
# the 3rd square. We'll consider an "immediate threat" to be 2 squares marked by the opponent
# in a row. If there's no immediate threat, then it will just pick a random square.

# go through the hash, and find if any of the 'lines' sub-arrays have .count equal to 2
# if so, computer plays in the unfilled array of that sub-array

player_wins = 0
computer_wins = 0
match_count = 1

loop do # main loop.  Basically looping the whole game here down below,
  # and at end of this asking if player wants to play again

  board = initialize_board
  loop do
    display_board(board) # do this because can possibly break after
    # player goes, & before computer goes, so need to display board again
    sleep(1.5) # gives player time to see clear board before Computer places piece
    computer_places_piece!(board) # TTT Bonus Features, 5c, Computer goes first
    display_board(board)
    break if someone_won?(board) || board_full?(board) # -1:51 in video 3 or 4
    player_places_piece!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    if detect_winner(board) == 'Player'
      player_wins += 1
    elsif detect_winner(board) == 'Computer'
      computer_wins += 1
    else
      prompt "It's a tie!"
    end
  end

  prompt "Player wins 5 games!" if player_wins == 5
  prompt "Computer wins 5 games!" if computer_wins == 5
  prompt "Play again (y or n)?"

  answer = ''
  loop do  # Assignment: TTT Bonus Features, 2, Keep Score
    answer = gets.chomp.downcase
    if answer.start_with?('y') && (player_wins == 5 || computer_wins == 5)
      player_wins = 0
      computer_wins = 0
      break
    elsif answer.start_with?('y')
      break
    elsif answer.start_with?('n')
      break
    else 
      prompt "Please type y or n"
    end
  end
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe, Good Bye!"

# Assignment: TTT Bonus Features, 2, Keep Score
# -------------------------
# we want to tally the score of wins for computer, and player
# until player or computer reaches 5 games, we want to keep letting the player play
# if the computer reaches 5 we want to give a chance to start over
# if the player reaches 5 we want a chance to start over
# can otherwise break from the game

# check player_wins and computer wins, prompt if either is 5
# prompt user if they want to play again
# store that in ANSWER variable
# if yes and player or computer wins equals 5, then reset player_wins and computer_wins to 0
# else break from the main loop and exit program,t hanking them for playing.
