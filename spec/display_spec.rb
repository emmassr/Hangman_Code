require "display"
require "word_converter"

describe Display do
  it "welcomes user to the game" do # Testing input/output
    input = StringIO.new
    output = StringIO.new
    display = Display.new(input, output)
    display.welcome_user #for testing the output we need to call the method we want to test before we set the expectation (below)
    expect(output.string.chomp).to eq("Welcome") # this is standard output testing by adding .string after output. The .chomp is to get rid of the \n that shows up when running the test
  end

  it "receives an input letter" do
    input = StringIO.new("a")
    output = StringIO.new
    display = Display.new(input, output)
    expect(display.input_letter).to eq("a")  #for testing input, it is done simultaneously with the expectation
  end

  it " displays the guessed word" do
    input = StringIO.new
    output = StringIO.new
    display = Display.new(input, output)
    display.present_guessed_word("Mango")
    expect(output.string.chomp).to eq("Please guess the following word: Mango")
  end

  it "displays incorrect message" do
    input = StringIO.new
    output = StringIO.new
    display = Display.new(input, output)
    display.displays_incorrect_message
    expect(output.string.chomp).to eq("Incorrect entry.")


  end

  it "displays winning message " do
    input = StringIO.new
    output = StringIO.new
    display = Display.new(input, output)
    word_guessed_by_user = WordConverter.new
    display.displays_winning_message(word_guessed_by_user)
    expect(output.string.chomp).to eq("You win! The correct word was #{word_guessed_by_user}")
  end

  it "displays losing message " do
    input = StringIO.new
    output = StringIO.new
    display = Display.new(input, output)
    selected_word_from_list = WordConverter.new
    display.displays_losing_message(selected_word_from_list)
    expect(output.string.chomp).to eq("You lose! The correct word is #{selected_word_from_list}")
  end

  it "gets valid input from user" do
    input = StringIO.new("2\n1\na")
    output = StringIO.new
    display = Display.new(input, output)

    expect(display.get_valid_letter).to eq("a")

  end
end
