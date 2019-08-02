class Hangman
def play_game
display = Display.new
display.welcome_user#welcomes user to the game
#choose word from the computer list
#Blank word shown
#ask user to input letter
#check user input against the computer word
#

end
  def check_word(letter, word)
    word.include?(letter)
  end

  def is_complete?(word)
    !word.include?("_")
  end

  def guess_word(attempts_remaining, word, letter)
    while attempts_remaining > 0 do
      check_word(letter, word) # check if true dont remove attempts
      if check_word(letter, word)
        attempts_remaining = attempts_remaining
      else
        attempts_remaining -= 1
      end
    end
    attempts_remaining
  end
    #compare guess_word and check_word and update
  def show_letter(computer_word, guessed_word, correct_letter)
    chars = computer_word.split('')
    hello = chars.each_with_index { |character, index|
    if character == correct_letter
        guessed_word.slice!(index)
        guessed_word.insert(index, correct_letter)
    end
  }
  guessed_word
  end

end


class RandomWordSelector

  def select_word(words)
    words.sample() #sample is used for arrays
  end

end

class WordFileReader #created this classs to use a text file with a list of words for the game, text file named word.txt in Hangman folder
  def read_file(path_to_file)
    file = File.open(path_to_file)# this opens the text file
    file_data = file.readlines.map(&:chomp)#the readlines.map command goes through each word in the list and puts it in an array and the chomp removes the feature of a new line start and places the words next to each other in an array eg: ["word1, "word2"]
    file.close # closes file
    file_data  # returns all the words which in is now in the array
  end
end

class Display

  def initialize(input=$stdin, output=$stdout)
    @input = input
    @output = output
  end

  def input_letter
    puts "Please enter a letter:"
    @input.gets.chomp
  end

  def welcome_user
    @output.puts "Welcome"
  end
end

class Validator
  def is_letter?(user_input)
    if user_input.match(/[A-Za-z]/)
      true
    else
      false
    end
  end
end
