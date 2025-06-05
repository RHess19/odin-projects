# Board class

# Members:
#   @@instances - make sure only one instance can be created
#   @answer - array representing the right answer. attr_accessor
#   @hints - nested array of all previous hints. Each element has up to four elements: the up to four hints provided. attr_accessor
#   @valid_colors - array of allowed colors


# Methods:

# #check_guess - takes in an array of guessed colors, returns true or false for whether it's right or not
# #generate_hints - takes in a guess, returns clues based on @answer
# #display_guess_result - displays current guess and its associated clues
# #generate_answer - create a random @answer
# #validate_guess - check that the player's guess only includes @valid_clors and they guess the right number of colors
# #randomize_hints - after #generate_hints, randomize their order in the array