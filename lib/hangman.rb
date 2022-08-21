require "./lib/save_game.rb"
require "yaml"

words = File.read('google-10000-english-no-swears.txt').split


class GetWord
	include SaveGame
	attr_reader :words, :incorrected_guesses, :selected_word_index

	def initialize(words, selected_word_index = rand(0..8810), incorrected_guesses = [], display_word = [])
		@words = words
		@incorrected_guesses = incorrected_guesses
		@selected_word_index = selected_word_index
		@display_word = display_word 
	end

	def four_letter_words
		@new_words = @words.map{|word| word unless word.length < 4}.uniq
		@new_words.delete_at(0)
		@new_words
	end

	def get_random_word
		self.four_letter_words
		@length = @new_words.length
		@selected_word = @new_words[@selected_word_index]
		#p @length
	end

	def selected_word
		self.get_random_word
		puts @selected_word
		@display_word = Array.new(@selected_word.length,"_")
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
			puts ""
			self.display
		else
			#puts"incorrect"
			@incorrected_guesses << @guessed_letter
			puts ""
			self.display
		end
	end

	def play_game
		self.selected_word
		self.display
		while @display_word.include?("_")
			self.compare_guess
			if @incorrected_guesses.length > 6
				break
			end
		end
		puts "thank you for playing"
	end
end



game = GetWord.new(words)
game.play_game