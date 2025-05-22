# Caesar Cipher
# User enters a string of text and a shift factor, then returns the encoded string

print "Text to encode: "
input_string = gets.chomp

print "Shift factor: "
shift_factor = gets.chomp.to_i
if shift_factor > 26
  shift_factor = shift_factor - 26 # Reduce the shift factor to be within 26 if the value entered is over 26
end


def caesar_cipher(input_string, shift_factor)
  input_string = input_string
  shift_factor = shift_factor
  final_cipher = []

  words = input_string.split(" ")
  num_spaces = words.length # Number of words in the submitted sentence - 1 gives the number of spaces that will need to be inserted back later

  words.each_index do |index|
    encoded_word = words[index].split("").map do |char|
      char = char.ord # convert char to ASCII code

      if char >= 65 && char <= 90
        if char + shift_factor > 90
          char = ((char + shift_factor) - 90) + 64 # If resulting char is outside normal text range, loop back to the beginning of the alphabet
          char = char.chr # Convert back to text character
        else
          char = char + shift_factor
          char = char.chr
        end
      elsif char >= 97 && char <= 122 # lowercase ASCII
        if char + shift_factor > 122
          char = ((char + shift_factor) - 122) + 96
          char = char.chr
        else
          char = char + shift_factor
          char = char.chr
        end
      end
    end

    joined_encoded_word = encoded_word.join("")
    final_cipher.push(joined_encoded_word)

    if index != words.length - 1 # if NOT on the last word, push a space before processing the next word
      final_cipher.push(" ")
    end
  end

  final_cipher.each { |item| print item }
  print "\n"

end


caesar_cipher(input_string, shift_factor)