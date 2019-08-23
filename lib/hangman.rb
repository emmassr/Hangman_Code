class Hangman
  def play_game
    display = Display.new
    display.welcome_user#welcomes user to the game
    word_file_reader = WordFileReader.new#choose word from the computer list
    words = word_file_reader.read_file(File.expand_path("test_words.txt"))
    random_word_selector = RandomWordSelector.new
    selected_word_from_list = random_word_selector.select_word_from(words)
    print selected_word_from_list
    word_guessed_by_user = GuessedWord.new.convert(selected_word_from_list)
    display = Display.new
    guess_word(8, selected_word_from_list, word_guessed_by_user, display)

  end

  def check_word(guessed_letter, selected_word_from_list)
    test = selected_word_from_list.downcase.include?(guessed_letter.downcase)
    # print "This is a test" + test.to_s + "this is a word" + word.to_s + "this is a letter" + letter.to_s
    return test
  end

  def is_complete?(word_guessed_by_user)
    !word_guessed_by_user.include?("_")
  end

  def guess_word(attempts_remaining, selected_word_from_list, word_guessed_by_user, display)
    until attempts_remaining == 0
      # || is_complete?(word_converted)
      display.present_guessed_word(word_guessed_by_user)#Blank word shown ( Need to create word with blanks)
      guessed_letter = display.input_letter#ask user to input letter
      if check_word(guessed_letter, selected_word_from_list)
        attempts_remaining = attempts_remaining
        word_guessed_by_user = show_letter(selected_word_from_list, word_guessed_by_user, guessed_letter)
        #update the word
        # print "this is working"
      else
        attempts_remaining -= 1
        display.displays_incorrect_message
      end
    end
    attempts_remaining
  end
    #compare guess_word and check_word and update
  def show_letter(selected_word_from_list, word_guessed_by_user, correct_letter)
    chars = selected_word_from_list.split('') #splits each letter of the word
    chars.each_with_index { |character, index|
      if character == correct_letter
        word_guessed_by_user.slice!(index)
        word_guessed_by_user.insert(index, correct_letter)
      end
    }
    word_guessed_by_user
  end

end

class GuessedWord
  def convert(selected_word_from_list)
    selected_word_from_list.gsub(/./, '_')

  end
end

class RandomWordSelector

  def select_word_from(words)
    words.sample().downcase #sample is used for arrays
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
    @output.puts "Please enter a letter:"
    @input.gets.chomp

  end

  def welcome_user
    @output.puts "Welcome"
  end

  def present_guessed_word(word_guessed_by_user)
    @output.puts "Please guess the following word: #{word_guessed_by_user}"

  end

  def displays_incorrect_message
    @output.puts "Incorrect entry, please enter another letter"
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
# hangman = Hangman.new
# hangman.play_game
