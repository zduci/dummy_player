#require 'my_helper'
class Player
  COMMON = ["e", "t", "a", "o"]

  def initialize
    @words = Hash.new
    text = File.open('en.txt').read
    text.gsub!(/\r\n?/, "\n")
    text.each_line do |line|
      unless line.count("'") > 0
        word = line.split(" ").first
        if @words[word.size]
          @words[word.size] << word
        else
          @words[word.size] = [word]
        end
      end
    end
  end

  def name
    "Radu"
  end

  def take_turn_future(state, guesses)
    turn = which_turn(guesses)
    if turn < COMMON.size + 1
      COMMON[turn - 1]
    else
      look_up(state, guesses)
    end
  end

  def which_turn(guesses)
    guesses.size + 1
  end

  def look_up(state, guesses)
    maybe = @words[state.size]
    maybe.each do |m|
      guesses.each do |g|
        unless m.include?(g)
          return m
        end
      end
    end

  end
end
