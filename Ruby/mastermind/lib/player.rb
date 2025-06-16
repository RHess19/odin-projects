class Player
  attr_reader :guesses

  require_relative 'colors'

  def initialize
    @guesses = [] # Nested array of all previous guesses
  end

  # INPUTS:
  #   Array with lenght 4 containing the player's guess
  def submit_guess(player_guess)
    @guesses.push(player_guess)
  end
end