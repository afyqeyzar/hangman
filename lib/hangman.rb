words = File.read('google-10000-english-no-swears.txt').split

class GetWord
	def initialize(words)
		@words = words
		@incorrected_guesses = []
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
		puts "incorect guesses: " + @incorrected_guesses.join("")
	end

	def get_guess
		puts "guess a letter: "
		@guessed_letter = gets.chomp
		if @guessed_letter.length != 1
			puts "please enter only one letter"
			self.get_guess
		end
	end

	def compare_guess
		self.get_guess
		#p @guessed_letter
		if @selected_word.include?(@guessed_letter)
			#puts "corrrect"
			@selected_word.split("").each_with_index {|letter, index| @display_word[index] = @guessed_letter unless letter != @guessed_letter}
			self.display
		else
			#puts"incorrect"
			@incorrected_guesses << @guessed_letter
			self.display
		end
	end
end

game = GetWord.new(words)
#game.get_random_word
game.selected_word
game.display
game.compare_guess