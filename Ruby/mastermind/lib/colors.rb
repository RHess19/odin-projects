require 'colorize'

# Handles returning guesses colored properly
module Colors
  def Colors.make_colored(input)
    # Use colorize to take in an array of characters and valid colors and return an array of the same length, except each item is now colorized
    colored_array = []
    input.each do |item|
      case item
      when 'p'
        colored_array.push(item.colorize(:magenta))
      when 'o'
        colored_array.push(item.colorize(:light_red))
      when 'g'
        colored_array.push(item.colorize(:green))
      when 'r'
        colored_array.push(item.colorize(:red))
      when 'b'
        colored_array.push(item.colorize(:blue))
      when 'y'
        colored_array.push(item.colorize(:yellow))
      end
    end

    return colored_array
  end
end