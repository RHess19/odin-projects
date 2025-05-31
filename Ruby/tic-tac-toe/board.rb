class Board
    attr_accessor :current_player
    attr_reader :board

    def initialize
        @current_player = 'X'
        @board = [['', '', ''], ['', '', ''], ['', '', '']]
    end


    # Inputs:
    #   move: Single character, X or O
    # Returns:
    #   True if move is valid, false otherwise
    # Take in a move, check if it is valid, and update the board if it is. If it isn't, return false and do not update the board
    def process_move(move)
        # is_valid_move?
        # if valid, update_board_index
        # otherwise, return false
    end


    # Inputs:
    #   index: [i][j] index of the player's choice
    # Returns:
    #   board
    # Take an index, update that index with current_player
    def update_board_index(index)
    end


    # Inputs:
    #   None
    # Returns:
    #   valid_moves: array of indexes in board that are equal to ''
    def calculate_valid_moves
    end


    # Inputs:
    #   index of the player's move
    # Returns:
    #   True if valid, False otherwise
    # Check if the input index is in calculate_valid_moves
    def is_valid_move?()
    end


    # Inputs:
    #   None
    # Returns:
    #   True if the current board layout indicates a win, False otherwise
    # Check if the current board layout has identical symbols in any legal 3-in-a-row layouts
    def winner?
    end


    # Inputs:
    #   None
    # Returns:
    #   None
    # Parse the current board layout and display it in a readable way
    # 
    # EXAMPLE
    #
    #   X - -
    #   - O -
    #   - X -
    # 
    def display_board
    end
end