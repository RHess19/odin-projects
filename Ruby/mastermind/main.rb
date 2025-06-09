require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/colors'

# create computer and player objects
player = Player.new
computer = Player.new

# create a board object
board = Board.new(player)

player_input = ""

# main game loop for 12 rounds
while board.round < 13 && board.winner != true
  puts "GAME BOARD"
  board.display_board

  # Get player guess
  puts "Round #{board.round}"
  print("Guess: ")
  player_input = gets.chomp.split("")
  player.submit_guess(player_input)
  board.process_guess(player_input)
end

# END GAME

# Rounds expired
if board.winner != true
  puts "Out of rounds. You lose!"
end

# Winner
puts "You win! The correct color combination is #{p board.answer}."