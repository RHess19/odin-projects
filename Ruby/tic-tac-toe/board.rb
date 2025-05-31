class Board
    attr_accessor :current_player
    attr_reader :board

    def initialize
        @current_player = 'X'
        @board = [['-', '-', '-'], ['-', '-', '-'], ['-', '-', '-']]
    end


    # Inputs:
    #   move: number between 1 - calculate_valid_moves.length, which is the range of possible input values from the command line
    # Returns:
    #   True if move is valid, false otherwise. This return value is not intended to be used for anything - it is simply a value to return for the sake of returning something meaningful
    # Take in a move, check if it is valid, and update @board if it is. If it isn't, return false and do not update the board
    def process_move(move)
        if self.is_valid_move?(move)
            self.update_board_index(self.calculate_valid_moves[move-1][0], self.calculate_valid_moves[move-1][1])
            return true
        else
            return false
        end
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
    #   valid_moves: array of indexes in @board that are equal to '-'. Example: valid_moves = [[1,2], [2,0]]
    def calculate_valid_moves
        valid_moves = board.each_with_index do |item_outer, index_outer|
            item.each_with_index do |item_inner, index_inner|
                valid_moves.push([index_outer, index_inner]) if board[index_outer][index_inner] == '-'
            end
        end
        return valid_moves
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
        board.each do |item|
            item.each do |subitem|
                print subitem + " "
            end
            puts ''
        end
    end
    

    #################### PRIVATE METHODS #######################
    private

    # Inputs:
    #   index_outer: [i] index of the player's move
    #   index_inner: [j] index of the player's move
    # Returns:
    #   board
    # Take an index, update that index with @current_player
    def update_board_index(index_outer, index_inner)
        board[index_outer][index_inner] = current_player
        return board
    end


    # Inputs:
    #   input_number: the command line input from the user
    # Returns:
    #   True if valid, False otherwise
    # Check if the input from the command line for the user's choice is within 1 - calculate_valid_moves.length sine those will be the numbered options at the command line
    def is_valid_move?(input_number)
        (input_number >= 1) && (input_number <= self.calculate_valid_moves)
    end
end