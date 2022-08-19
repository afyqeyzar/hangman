words = File.read('google-10000-english-no-swears.txt').split

class GetWord
	def initialize(words)
		@words = words
	end

	def four_letter_words
		@new_words = @words.map{|word| word unless word.length < 4}.uniq
		@new_words.delete_at(0)
		@new_words
	end

	def get_random_word
		self.four_letter_words
		@length = @new_words.length
		@selected_word = @new_words[rand(0..@length)]
	end

	def selected_word
		self.get_random_word
		puts @selected_word
		@display_word = Array.new(@selected_word.length,"_")
		#p @display_word
	end

	def display
		puts @display_word.join("")
	end
end

game = GetWord.new(words)
#game.get_random_word
game.selected_word
game.display