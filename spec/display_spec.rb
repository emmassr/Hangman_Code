require "display"
require "word_converter"

describe Display do
  # it "welcomes user to the game" do # Testing input/output
  #   input = StringIO.new
  #   output = StringIO.new
  #   display = Display.new(input, output)
  #   display.welcome_user #for testing the output we need to call the method we want to test before we set the expectation (below)
  #   expect(output.string.chomp).to eq("Welcome") # this is standard output testing by adding .string after output. The .chomp is to get rid of the \n that shows up when running the test
  # end

  it "gets input from the user" do
    input = StringIO.new("Hello")
    display = Display.new(input)
    expect(display.get_user_input).to eq("Hello")
  end
  it "presents message to the user" do
    input = StringIO.new
    output = StringIO.new
    display = Display.new(input, output)
    message = "Welcome"
    display.present(message)
    expect(output.string).to eq("Welcome\n")
  end
  it "prompts the user again if inputs invalid letter  " do
    input = StringIO.new("2\na")
    output = StringIO.new
    display = Display.new(input, output)
    display.get_valid_letter
    expect(output.string).to eq("Please enter a letter:\nPlease enter a letter:\n")

  end


end
