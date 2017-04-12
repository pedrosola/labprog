class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  def initialize (word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end

  attr_accessor :word, :guesses, :wrong_guesses, :world_with_guesses

  def guess (letter)
    res = (letter =~/[A-Za-z]/)
    raise ArgumentError if letter == '' or res == nil
    letter.downcase!
    if not (@guesses.include? (letter) or @wrong_guesses.include? (letter))
      if @word.include? (letter)
        @guesses << letter
        
        return true
      else
        @wrong_guesses << letter
      end
    end
    return false
  end

  def word_with_guesses
    res = ''
    @word.each_char do |l|
      if guesses.include? l
        res << l
      else
        res << '-'
      end
    end
    return res
  end

  def check_win_or_lose
    if @wrong_guesses.length >= 7
      return :lose
    else
      @word.each_char do |x|
        if not guesses.include? x
          return :play
        end
      end
      return :win
    end
  end
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
