class Board
  attr_accessor :answer, :hints, :valid_colors, :winner

  def initialize
    @answer = generate_answer
    @hints = [] # holds arrays of all previous hints generated
    @valid_colors = ['p', 'o', 'g', 'r', 'b', 'y']
    @winner = false
  end

  # INPUTS:
  #   Array with length 4 containing a player's guess
  # RETURNS:
  #   None
  def process_guess(player_guess)
    # #validate_guess on player.guesses.pop[0]. if guess is NOT valid, pop 1 from player.guesses
    # If NOT #winner?
    # #generate_hints, #push onto @hints
    # #randomize_hints
  end

  # INPUTS:
  #   None
  # RETURNS:
  #   None
  # Writes the all past guesses and hints to the screen
  def display_board
    
  end



  private

  # INPUTS:
  #   Array with length 4 containing a player's guess
  # RETURNS:
  #   true if guess is valid, false otherwise
  # Check that the player's guess only includes @valid_colors and only contains 4 characters
  def validate_guess(player_guess)
    
  end

  # INPUTS:
  #   Array with length 4 containing a player's guess
  # RETURNS:
  #   None
  # Takes in an array of guessed colors, sets @winner to true or false based on whether or not player_guess == @answer
  def winner?(player_guess)
    
  end

  # INPUTS:
  #   Array with length 4 containing a player's guess
  # RETURNS:
  #   Array with length <= 4 containing hints based on @answer
  # Takes in a guess, returns hints based on @answer
  def generate_hints(player_guess)
    
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
    
  end

end