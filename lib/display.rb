require_relative "validator"
class Display

  def initialize(input=$stdin, output=$stdout)
    @input = input
    @output = output
  end

  def get_valid_letter
    ask_for_letter
    letter = input_letter
    validator = Validator.new
    until validator.is_letter?(letter)
      ask_for_letter
      letter = input_letter
    end
    letter
  end

  def input_letter
    @input.gets.chomp
  end

  def ask_for_letter
    @output.puts "Please enter a letter:"
  end

  def welcome_user
    @output.puts "Welcome"
  end

  def present_guessed_word(word_guessed_by_user)
    @output.puts "Please guess the following word: #{word_guessed_by_user}"
  end

  def displays_incorrect_message
    @output.puts "Incorrect entry."
  end

  def displays_winning_message(word_guessed_by_user)
    @output.puts "You win! The correct word was #{word_guessed_by_user}"
  end

  def displays_losing_message(selected_word_from_list)
    @output.puts "You lose! The correct word is #{selected_word_from_list}"
  end

  def displays_number_of_attempts(attempts_remaining)
    @output.puts "You have #{attempts_remaining} attempts remaining" #test this message
  end

  HANGMAN_IMAGES = {
    7 =>
    "_______
    |
    |
    |
    |
    |_______",
  6 =>
   "_______
   |       |
   |
   |
   |
   |_______",
   5 =>
   "_______
   |       |
   |       O
   |
   |
   |_______",
   4 =>
   " _______
    |       |
    |       O
    |       |
    |
    |_______",
   3 =>
   "_______
   |       |
   |       O
   |      /|
   |
   |_______",
   2 =>
   "_______
   |       |
   |       O
   |      /|\\
   |
   |_______",
   1 =>
   "_______
   |       |
   |       O
   |      /|\\
   |       /
   |_______",
   0 =>
   "_______
   |       |
   |       O
   |      /|\\
   |       /\\
   |_______"
 }
 def displays_hangman(attempts_remaining)
   if attempts_remaining < 8
     @output.puts HANGMAN_IMAGES[attempts_remaining]
   else
      @output.puts ""
    end
  end
end
