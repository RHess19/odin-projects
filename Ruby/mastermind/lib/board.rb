class Board
  attr_accessor :answer, :hints, :valid_colors, :winner

  require_relative 'colors'

  def initialize(player)
    @player = player
    @valid_colors = Colors.make_colored(['p', 'o', 'g', 'r', 'b', 'y'])
    @answer = self.generate_answer # will be colored since #generate_answer used the colored version of @valid_colors
    @hints = [] # holds arrays of all previous hints generated
    @winner = false
  end

  # INPUTS:
  #   Array with length 4 containing a player's guess
  # RETURNS:
  #   None
  def process_guess(player_guess)
    # #validate_guess on player.guesses.pop[0]. if guess is NOT valid, pop 1 from player.guesses
    if !validate_guess(player_guess)
      @player.guesses.pop
    else
      if !winner?(player_guess)
        @hints.push(generate_hints(player_guess))
        self.randomize_hints
      end
    end
  end

  # INPUTS:
  #   None
  # RETURNS:
  #   None
  # Writes the all past guesses and hints to the screen
  def display_board
    # use Colors module
  end



  private

  # INPUTS:
  #   Array with length 4 containing a player's guess
  # RETURNS:
  #   true if guess is valid, false otherwise
  # Check that the player's guess only includes @valid_colors and only contains 4 characters
  def validate_guess(player_guess)
    player_guess.each do |guess|
      if !@valid_colors.include?(guess)
        return false
      end
    end

    if player_guess.length != 4
      return false
    end

    return true
  end

  # INPUTS:
  #   Array with length 4 containing a player's guess
  # RETURNS:
  #   None
  # Takes in an array of guessed colors, sets @winner to true or false based on whether or not player_guess == @answer
  def winner?(player_guess)
    if player_guess == @answer
      @winner = true
      return true
    end

    return false
  end

  # INPUTS:
  #   Array with length 4 containing a player's guess
  # RETURNS:
  #   Array with length <= 4 containing hints based on @answer
  # Takes in a guess, returns hints based on @answer
  def generate_hints(player_guess)
    hints = []
    # For each item in the player's guess, if player_guess[i] is equal to @answer[i], push a red O in hints
    # If player_guess[i] is NOT equal to @answer[i] BUT player_guess[i] exists elsewhere in @answer[i], push a white O in hints
    # return hints
  end

  # INPUTS
  #   None
  # RETURNS:
  #   None
  # Randomize the order of all items in @hints
  def randomize_hints
    
  end

  # INPUTS:
  #   None
  # RETURNS:
  #   Array with length 4 containing a random hidden answer
  def generate_answer
    answer = []
    4.times do
      answer.push(@valid_colors[rand(4)])
    end

    return answer
  end
end