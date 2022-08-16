words = File.read('google-10000-english-no-swears.txt').split

def four_letter_words(words)
	new_words = words.map{|word| word unless word.length < 4}.uniq
	new_words.delete_at(0)
	new_words
end
p four_letter_words(words)