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
round = 1
winner = false
while round < 13 && board.winner != true
  # show instructions
  if round == 1
    puts "##############\n# MASTERMIND #\n##############\n"

    puts "Each round, guess the secret color order by entering four characters from the valid colors: #{'p'.colorize(:magenta)} #{'o'.colorize(:light_red)} #{'g'.colorize(:green)} #{'r'.colorize(:red)} #{'b'.colorize(:blue)} #{'y'.colorize(:yellow)}"
    puts "After each guess, you will receive up to 4 hints. A white hint indicates one of your guesses is correct, but in the wrong location. A red hint indicates one of your guesses is correct AND in the right location."
    puts "Enter guesses in the format 'cccc' where each 'c' is one of the valid colors. Hints are displayed in a random order."
    puts "You have 12 rounds to guess the correct color combination."
  end

  puts "GAME BOARD"
  board.display_board

  # Get player guess
  puts "Round #{round}"
  print("Guess: ")
  player_input = gets.chomp.split("")
  player.submit_guess(player_input)
  board.process_guess(player_input)
         

  round += 1
end

# END GAME

# Rounds expired
if board.winner != true
  puts "Out of rounds. You lose!"
end

# Winner
puts "You win! The correct color combination is #{p board.answer}."