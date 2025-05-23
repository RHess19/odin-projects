print "String to search: "
input_string = gets.chomp

print "Valid words separated by spaces: "
valid_words = gets.chomp.split(" ")


def substrings(input_string, valid_words)
    result = {}

    # for each word in valid_words, iterate over every word in the input_string
    # if all or part of input_word == the word from valid_words:
    #   create a new hash entry and increment to 1, or increment the existing value in the hash

    valid_words.each do |word|
        if input_string.scan("#{word}").length != 0
            result[word] = input_string.scan("#{word}").length
        end
    end
    result
end


matched_words = substrings(input_string, valid_words)
p matched_words