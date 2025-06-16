class Board
  attr_accessor :answer, :hints, :valid_colors, :winner, :round

  require_relative 'colors'

  def initialize(player)
    @round = 1
    @player = player
    @valid_colors = ['p', 'o', 'g', 'r', 'b', 'y'] # not pre-colored using colorize
    @answer = ['r', 'g', 'r', 'r'] # not pre-colored using colorize
    @hints = [] # holds arrays of all previous hints generated. sub-arrays contain either "red" or "white" which is later converted to red or white 'O's in #display_board
    @winner = false
    @played = false # used only to prevent the game instructions from displaying again in the case the player enters an invalid guess on the first round

    self.display_instructions
  end

  # INPUTS:
  #   Array with length 4 containing a player's guess
  # RETURNS:
  #   None
  def process_guess(player_guess)
    @played = true

    if !validate_guess(player_guess) # player's guess either isn't exactly 4 characters long or contains invalid characters
      @player.guesses.pop
      puts "Please enter a valid guess that is 4 characters long and includes only valid characters: #{'p'.colorize(:magenta)} #{'o'.colorize(:light_red)} #{'g'.colorize(:green)} #{'r'.colorize(:red)} #{'b'.colorize(:blue)} #{'y'.colorize(:yellow)}\n\n"
    else
      if !winner?(player_guess)
        @hints.push(generate_hints(player_guess))
        self.randomize_hints
        @round += 1
      end
    end
  end

  # INPUTS:
  #   None
  # RETURNS:
  #   None
  # Writes the all past guesses and hints to the screen
  def display_board
    if @round != 1 # so that this code doesn't have to run when nothing has happened yet
      puts "############# GAME BOARD #############\n"

      puts "## GUESS ## | ## HINT ##\n________________________"

      # For a number of times equal to the number of rounds played, add a colored version of the player's guesses and hints to an output string formatted to look like a game board
      index = 0
      (@round-1).times do
        output = "  "

        # Add each letter of the guess to the output string
        @player.guesses[index].each do |letter|
          output += Colors.make_colored([letter])[0]
          output += " "
        end

        output += "  |  "

        # Add each hint letter to the output
        # Conver from words ("red", "white") to hints ("O" (red), "O" (white))
        @hints[index].each do |hint|
          if hint == "red"
            output += 'O'.colorize(:red)
            output += " "
          else
            output += 'O'.colorize(:white)
            output += " "
          end
        end

        puts output

        index += 1
      end

      puts "\n\n"
    end
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
    player_guess.each.with_index do |item, index|
      if player_guess[index] == @answer[index]
        hints.push("red")
      elsif player_guess[index] != @answer[index] && @answer.include?(player_guess[index])
        hints.push("white")
      end
    end

    return hints
  end

  # INPUTS
  #   None
  # RETURNS:
  #   None
  # Randomize the order of all items in @hints
  def randomize_hints
    @hints = @hints.shuffle
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

  # INPUTS:
  #   None
  # RETURNS:
  #   None
  # Displays the game instructions
  def display_instructions
    puts "###########################\n# MASTERMIND INSTRUCTIONS #\n###########################\n\n\n"

    puts "In Mastermind, the objective is to guess your opponent's secret color combination. Their secret code will be 4 colors long (order matters!) and may contains the following colors:"
    puts "#{'Purple'.colorize(:magenta)}, #{'Orange'.colorize(:light_red)}, #{'Green'.colorize(:green)}, #{'Red'.colorize(:red)}, #{'Blue'.colorize(:blue)}, #{'Yellow'.colorize(:yellow)}\n\n"

    puts "Each round, make a guess as to what the secret code is by typing four characters representing the colors (and order of colors) that you think may be the secret code. Use the first letter of the color to guess that color. Example:"
    puts "pgrr"
    puts "The above guess signifies that you believe the secret code may be Purple, Green, Red, Red.\n\n"

    puts "After each round, you will receive hints based on your guess. The hint may contain up to 4 characters (up to one for each color in your guess)."
    puts "The four hint characters can be either a red #{'O'.colorize(:red)} or a white #{'O'.colorize(:white)}."
    puts "A red #{'O'.colorize(:red)} means one of your guessed colors is both contained in the answer AND is placed in the right location. A white #{'O'.colorize(:white)} means one of your guesses is contained in the answer BUT in the wrong location."
    puts "NOTE: The order of the hints does NOT correspond to the order of the colors you guessed. So, a red #{'O'.colorize(:red)} in the third hint spot does NOT mean your third color guessed is correct.\n\n"

    puts "You have 12 rounds to guess the secret code. Good luck!\n\n"
  end
end