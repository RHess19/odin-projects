require_relative 'board'

board = Board.new
player_input = ""

while !board.winner?

    # display instructions - press button corresponding to the board location
    # 1 2 3
    # 4 5 6
    # 7 8 9

    puts "Enter a key corresponding to the board location."
    puts "1 2 3\n4 5 6\n7 8 9\n\n"

    # display the current board state
    puts "CURRENT BOARD"
    board.display_board
    puts "\n\n"

    # display the current player
    puts "Player #{board.current_player}'s turn.\n"

    # pass the current move to the board.process_move()
    print "Move: "
    player_input = gets.chomp.to_i
    if !(board.process_move(player_input))
        puts "Please enter a valid move."
    end

    puts "----------------------------\n"

    # allow the loop to begin again

end