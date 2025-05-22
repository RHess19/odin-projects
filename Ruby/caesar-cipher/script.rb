# Caesar Cipher
# User enters a string of text and a shift factor, then returns the encoded string

print "Text to encode: "
user_string = gets.chomp

print "Shift factor: "
shift_factor = gets.chomp.to_i

user_string = user_string.split("")

encoded_string = user_string.map do |char|
  char = char.ord # convert all characters to their ASCII codes
  if char >= 65 && char <= 90 # uppercase ASCII
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

encoded_string = encoded_string.join("")

puts encoded_string