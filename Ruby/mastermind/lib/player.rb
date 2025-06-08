class Player
  attr_reader :guesses

  require_relative 'colors'

  def initialize
    @guesses = [] # Nested array of all previous guesses
  end

  # INPUTS:
  #   Array with lenght 4 containing the player's guess
  def submit_guess(player_guess)
    #push player_guess onto @guesses. Board.validate_guess or Board.process_guess will handle popping the guess from @guesses if it's invalid
    player_guess.map do |item|
      item.downcase
    end

    @guesses.push(player_guess)
  end
end