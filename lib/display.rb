require_relative "validator"
require_relative "message"
class Display

  def initialize(input=$stdin, output=$stdout)
    @input = input
    @output = output
  end

  def get_user_input
    @input.gets.chomp
  end

  def present(message)
    @output.puts(message)
  end

  def get_valid_letter
    message = Message.new
    present(message.ask_for_letter)
    letter = get_user_input
    validator = Validator.new
    until validator.is_letter?(letter)
      present(message.ask_for_letter)
      letter = get_user_input
    end
    letter
  end
end
