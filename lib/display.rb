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
   case attempts_remaining
   when attempts_remaining -= 1
     HANGMAN_IMAGES[7]
   when attempts_remaining -= 2
     HANGMAN_IMAGES[6]
   when attempts_remaining -= 3
     HANGMAN_IMAGES[5]
   when attempts_remaining -= 4
     HANGMAN_IMAGES[4]
   when attempts_remaining -= 5
     HANGMAN_IMAGES[3]
   when attempts_remaining -= 6
     HANGMAN_IMAGES[2]
   when attempts_remaining -= 7
     HANGMAN_IMAGES[1]
   when attempts_remaining -= 8
     HANGMAN_IMAGES[0]
   else
      @output.puts ""
    end
  end
end







  #
  # def displays_hangman(attempts_remaining)
  #   case attempts_remaining
  #   when 7
  #     @output.puts "
  #       _______
  #      |
  #      |
  #      |
  #      |
  #      |_______"
  #   when 6
  #     @output.puts "
  #       _______
  #      |       |
  #      |
  #      |
  #      |
  #      |_______"
  #    when 5
  #      @output.puts "
  #        _______
  #       |       |
  #       |       O
  #       |
  #       |
  #       |_______"
  #     when 4
  #       @output.puts "
  #         _______
  #        |       |
  #        |       O
  #        |       |
  #        |
  #        |_______"
  #      when 3
  #     @output.puts "
  #        _______
  #       |       |
  #       |       O
  #       |      /|
  #       |
  #       |_______"
  #     when 2
  #     @output.puts "
  #         _______
  #        |       |
  #        |       O
  #        |      /|\\
  #        |
  #        |_______"
  #      when 1
  #        @output.puts "
  #          _______
  #         |       |
  #         |       O
  #         |      /|\\
  #         |       /
  #         |_______"
  #       when 0
  #       @output.puts "
  #         _______
  #        |       |
  #        |       O
  #        |      /|\\
  #        |       /\\
  #        |_______"
  #
  #      else
  #     @output.puts ""
