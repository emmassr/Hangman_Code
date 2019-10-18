require "message"
describe Message do
  it "returns message to display asking user to enter letter" do
    message = Message.new
    expect(message.ask_for_letter).to eq("Please enter a letter:")
  end

  it "returns message to display welcoming user" do
    message = Message.new
    expect(message.welcome_user()).to eq("Welcome")
  end

  it "returns message to display instructing the user to guess the word" do
    message = Message.new
    word_guessed_by_user = "a___e"
    expect(message.present_guessed_word(word_guessed_by_user)).to eq("Please guess the following word: #{word_guessed_by_user}")
  end

  it "returns message to display informing user of an incorrect entry" do
    message = Message.new
    expect(message.displays_incorrect_message).to eq("Incorrect entry.")
  end

  it "returns message to display when user wins and the complete correct word " do
    message = Message.new
    word_guessed_by_user = "apple"
    expect(message.displays_winning_message(word_guessed_by_user)).to eq("You win! The correct word was #{word_guessed_by_user}")
  end

  it "returns message to display when user loses and the compete word" do
    message = Message.new
    selected_word_from_list = "apple"
    expect(message.displays_losing_message(selected_word_from_list)).to eq("You lose! The correct word is #{selected_word_from_list}")
  end

  it "returns message to display letting user know number of attempts remaining" do
    message = Message.new
    attempts_remaining = 1
    expect(message.displays_number_of_attempts(attempts_remaining)).to eq("You have #{attempts_remaining} attempts remaining")
  end

  it "returns message to display hangman image" do
    message = Message.new
    attempts_remaining = 1
    expect(message.displays_hangman(attempts_remaining)).to eq(
        "_______
   |       |
   |       O
   |      /|\\
   |       /
   |_______")
  end

end
