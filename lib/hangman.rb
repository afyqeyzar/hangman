words = File.read('google-10000-english-no-swears.txt').split

def four_letter_words(words)
    words.map do |word|
        if word.length < 4
            next
        else
            word
        end
    end
end

p four_letter_words(words)