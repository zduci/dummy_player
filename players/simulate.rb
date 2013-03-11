require_relative 'player'
answer = "anemal"
blanks = "______"

p = Player.new

guesses = []
10.times do

  lg = p.take_turn(blanks, guesses)
  guesses << lg
  answer.split(//).each_with_index do |char, i|
    if char == lg
      blanks[i] = lg
    end
  end

  puts "Guess " + lg
  puts guesses
  puts blanks
end
