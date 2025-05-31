require_relative 'board'

board = Board.new

while !board.winner?

    # display instructions - press button corresponding to the board location
    # 1 2 3
    # 4 5 6
    # 7 8 9

    # display the current board state
    # display the current player
    # display the current move options to the player

    # pass the current move to the board.process_move()

    # if option is valid, process the choice and check for a winner
    # flip the current player
    # allow the loop to begin again

end