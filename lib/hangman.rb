require_relative "word_converter"
require_relative "random_word_selector"
require_relative "word_file_reader"
require_relative "display"

MAX_NUMBER_OF_ATTEMPTS = 8

class Hangman

  def initialize(display)
    @display = display
  end

  def play_game
    # display = Display.new
    @display.welcome_user#welcomes user to the game
    word_file_reader = WordFileReader.new#choose word from the computer list
    words = word_file_reader.read_file(File.expand_path("words.txt"))
    random_word_selector = RandomWordSelector.new
    selected_word_from_list = random_word_selector.select_word_from(words)
    word_guessed_by_user = WordConverter.new.convert(selected_word_from_list)
    guess_word(MAX_NUMBER_OF_ATTEMPTS, selected_word_from_list, word_guessed_by_user)

  end

  def check_word(guessed_letter, selected_word_from_list)
    test = selected_word_from_list.downcase.include?(guessed_letter.downcase)
    # print "This is a test" + test.to_s + "this is a word" + word.to_s + "this is a letter" + letter.to_s
    return test
  end

  def is_complete?(word_guessed_by_user)
    !word_guessed_by_user.include?("_")
  end

  def guess_word(attempts_remaining, selected_word_from_list, word_guessed_by_user)
    until attempts_remaining == 0 || is_complete?(word_guessed_by_user)
      @display.present_guessed_word(word_guessed_by_user)#Blank word shown ( Need to create word with blanks)
      @display.displays_hangman(attempts_remaining)
      guessed_letter = @display.get_valid_letter#ask user to input letter
      if check_word(guessed_letter, selected_word_from_list)
        attempts_remaining = attempts_remaining
        word_guessed_by_user = show_letter(selected_word_from_list, word_guessed_by_user, guessed_letter)
        #update the word
      else
        attempts_remaining -= 1
        @display.displays_incorrect_message
        @display.displays_number_of_attempts(attempts_remaining) #test this message
      end
    end
    show_win_or_continue_playing_message(word_guessed_by_user, attempts_remaining, selected_word_from_list)
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

  def show_win_or_continue_playing_message(word_guessed_by_user, attempts_remaining, selected_word_from_list                                                                         )
    if is_complete?(word_guessed_by_user)
      @display.displays_winning_message(word_guessed_by_user)
    else
      @display.displays_hangman(attempts_remaining)
      @display.displays_losing_message(selected_word_from_list)
    end # you win or lose here
  end

end
