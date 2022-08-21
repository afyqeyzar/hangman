module SaveGame
	def save_game
    Dir.mkdir 'save_file' unless Dir.exist? 'save_file'
    @filename = "#{random_name}_game.yaml"
    File.open("output/#{@filename}", 'w') { |file| file.write save_to_yaml }
    puts @filename
	end

	def save_to_yaml
    YAML.dump(
      'word' => @word,
      'available_letters' => @available_letters,
      'solved_letters' => @solved_letters,
      'incorrect_letters' => @incorrected_guesses
    )
  end
end