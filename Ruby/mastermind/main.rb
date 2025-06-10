require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/colors'

# create computer and player objects
player = Player.new

# create a board object
board = Board.new(player)

player_input = ""

# main game loop for 12 rounds
while board.round < 13 && board.winner != true
  board.display_board

  # Get player guess
  puts "Round #{board.round}"
  print("Guess: ")
  player_input = gets.chomp.split("")
  board.process_guess(player_input)
end

# END GAME

board.display_board
# Rounds expired
if board.winner != true
  puts "Out of rounds. You lose! The correct answer is "
  board.answer.each do |letter|
    print Colors.make_colored([letter])[0]
  end

  print "\n\n"
else
  # Winner
  print "You win! The correct color combination is "

  board.answer.each do |letter|
    print Colors.make_colored([letter])[0]
  end

  print "\n\n"
end