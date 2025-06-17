require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/colors'

def select_mode
  print("Enter C to play against the computer. Enter P to choose the secret colors and have the computer try to guess the answer: ")
  mode = gets.chomp!

  if mode != 'C' && mode != 'P'
    select_mode()
  end

  ############# PLAYER V COMPUTER ###########
  if mode == 'C'
    player = Player.new
    board = Board.new(player)
    board.mode = 'C'
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

  ########## COMPUTER V PLAYER #############
  elsif mode == 'P'

    computer = Player.new
    board = Board.new(computer)
    board.mode = 'P'
    computer_input = ""

    # Get a secret color from the player
      puts "Please enter a secret code that is 4 characters long and includes only valid characters: #{'p'.colorize(:magenta)} #{'o'.colorize(:light_red)} #{'g'.colorize(:green)} #{'r'.colorize(:red)} #{'b'.colorize(:blue)} #{'y'.colorize(:yellow)}\n"
      print("Secret Code: ")

      secret_code = gets.chomp!.split("")
      board.validate_secret(secret_code)

    # main game loop for 12 rounds
    while board.round < 13 && board.winner != true

      board.display_board

      # Get player guess
      puts "Round #{board.round}"
      computer_input = board.generate_answer
      board.process_guess(computer_input)
    end

    # END GAME

    board.display_board
    # Rounds expired
    if board.winner != true
      puts "Out of rounds. Computer loses, you win! The correct answer is "
      board.answer.each do |letter|
        print Colors.make_colored([letter])[0]
      end

      print "\n\n"
    else
      # Winner
      print "Computer wins! The correct color combination is "

      board.answer.each do |letter|
        print Colors.make_colored([letter])[0]
      end

      print "\n\n"
    end
  end
end

select_mode