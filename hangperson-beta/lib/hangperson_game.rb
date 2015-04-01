class HangpersonGame
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.
  #
  attr_accessor :guesses, :letters_remaining, :valid, :word, :wrong_guesses

  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @letters_remaining = ('a'..'z').to_a # all the letters not guessed.
  end

  # Get a word from remote "random word" service
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end


  # validate the guess and then evaluate the letter guessed.
  def guess(letter)
    if valid_guess(letter)
      valid = true
    else
      valid = false
      fail ArgumentError
    end

    # if user has already guessed letter, no need to check and duplicate value
    return false if already_guessed?(letter)

    remove_letter_guessed(letter)

    # check if the guess is correct or incorrect
    check_guess(letter) if valid
  end

  # guess all the letters in the string
  def guess_several_letters(letters)
    letters.each { |letter| guess(letter) }
  end

  def check_win_or_lose
    return :lose if number_of_wrong_guesses >= 7
    return :win unless word_with_guesses.include?('-')
    :play
  end

  # build the word showing only the correctly guessed letters
  def word_with_guesses
    result = ''

    word.split('').each do |letter|
      if letters_remaining.include?(letter)
        result << '-'
      else
        result << letter
      end
    end

    result
  end

  private

  # check if a letter has already been guessed
  def already_guessed?(letter)
    (guesses + wrong_guesses).include?(letter)
  end

  # Check the guess if it is in the word and add to appropriate list
  def check_guess(letter)
    if word.include?(letter)
      guesses << letter
    else
      wrong_guesses << letter
    end
  end

  def number_of_wrong_guesses
    wrong_guesses.length
  end

  def remove_letter_guessed(letter)
    letters_remaining.delete(letter)
  end

  def valid_guess(letter)
    letter =~ /^[a-z]$/i
  end
end
