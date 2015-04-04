class HangpersonGame
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.
  
  attr_accessor :guesses, :wrong_guesses

  ##
  # Constructor
  #
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  ##
  # Class Methods
  #

  # Get a word from remote "random word" service
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri, {}).body
  end

  ##
  # Instance Methods
  #

  # validate the guess and then evaluate the letter guessed.
  def guess(letter)
    if valid_guess?(letter)
      valid = true
    else
      valid = false
      fail ArgumentError
    end

    # if user has already guessed letter, no need to check and duplicate value
    return false if already_guessed?(letter)

    # check if the guess is correct or incorrect
    check_guess(letter) if valid
  end

  # guess all the letters in the string
  def guess_several_letters(letters)
    letters.each { |letter| guess(letter) }
  end

  # return :lose, :win, :play based on the state of the word and number of guesses.
  def check_win_or_lose
    return :lose if number_of_wrong_guesses >= 7
    return :win unless word_with_guesses.include?('-')
    :play
  end

  # build the word showing only the correctly guessed letters
  def word_with_guesses
    result = ''

    word.split('').each do |letter|
      if guesses.include?(letter)
        result << letter
      else
        result << '-'
      end
    end

    result
  end

  private

  attr_accessor :valid, :word

  # check if a letter has already been guessed
  def already_guessed?(letter)
    (guesses + wrong_guesses).include?(letter)
  end

  # check if the guess is correct or incorrect and append to the appropriate list.
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

  def valid_guess?(letter)
    letter =~ /^[a-z]$/i
  end
end
