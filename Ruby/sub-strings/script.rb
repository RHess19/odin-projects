print "String to search: "
input_string = gets.chomp.split(" ")

print "Valid words separated by spaces: "
valid_words = gets.chomp.split(" ")


def substrings(input_string, valid_words)
    # for each word in valid_words, iterate over every word in the input_string
    # if all or part of input_word == the word from valid_words:
    #   create a new hash entry and increment to 1, or increment the existing value in the hash
    valid_words.reduce(Hash.new(0)) do |result, word|
        input_string.each do |input_word|
            if input_word.include?(word)
                # check how many times "word" appears - if more than 1, increment by the number of times "word" appears in the current input_word being examined
                if input_word.scan("#{word}").length == 1
                    result[word] += 1
                elsif input_word.scan("#{word}").length > 1
                    result[word] += input_word.scan("#{word}").length
                end
            end
        end
        result
    end
end


matched_words = substrings(input_string, valid_words)
p matched_words