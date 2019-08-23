require 'hangman'
describe RandomWordSelector do
  it "chooses word from single element array randomly" do
    words = ["AH"]
    random_word_selector = RandomWordSelector.new()
    expect(random_word_selector.select_word_from(words)).to eq("ah") # fails if "AH" is in the () instead
  end

  it "chooses word from multiple element array randomly" do
    words = ["hello", "there"]
    random_word_selector = RandomWordSelector.new()
    result = random_word_selector.select_word_from(words)
    expect([result].length).to eq(1)
    expect(words.include?(result)).to eq(true)
  end

end

describe Hangman do
  it "is valid if letter is in the word" do
    guessed_letter = "a"
    selected_word_from_list = "Apple"
    hangman = Hangman.new()
    expect(hangman.check_word(guessed_letter, selected_word_from_list)).to eq(true)
  end

  it "is invalid if letter is not in the word" do
    guessed_letter = "z"
    selected_word_from_list = "apple"
    hangman = Hangman.new()
    expect(hangman.check_word(guessed_letter, selected_word_from_list)).to eq(false)
  end

  it "is valid if the word is complete" do
    word_guessed_by_user = "banana"
    hangman = Hangman.new()
    expect(hangman.is_complete?(word_guessed_by_user)).to eq(true)
  end

  it "is invalid if the word is not complete" do
    word_guessed_by_user = "b_nan_"
    hangman = Hangman.new()
    expect(hangman.is_complete?(word_guessed_by_user)).to eq(false)
  end

  it "gives user only one more attempt when guess is wrong " do
    input = StringIO.new("z")
    output = StringIO.new
    display = Display.new(input, output)
    guessed_letter = "z"
    hangman = Hangman.new()
    attempts_remaining = 1
    selected_word_from_list = "apple"
    word_guessed_by_user = "app_e"
    expect(hangman.guess_word(attempts_remaining, selected_word_from_list, word_guessed_by_user, display)).to eq(0)
  end

  it "given correct letter 'a', it updates letter in computer word 'apple'" do
    selected_word_from_list = "apple"
    word_guessed_by_user = "_____"
    correct_letter = "a"
    hangman = Hangman.new()
    expect(hangman.show_letter(selected_word_from_list, word_guessed_by_user, correct_letter)).to eq("a____")
  end

  it "given correct letter 'e', it updates letter in word 'apple'" do
    selected_word_from_list = "apple"
    word_guessed_by_user = "a____"
    correct_letter = "e"
    hangman = Hangman.new()
    expect(hangman.show_letter(selected_word_from_list, word_guessed_by_user, correct_letter)).to eq("a___e")
  end

  it "given correct letter 'p', it updates letter in word 'apple'" do
    selected_word_from_list = "apple"
    word_guessed_by_user = "a____"
    correct_letter = "p"
    hangman = Hangman.new()
    expect(hangman.show_letter(selected_word_from_list, word_guessed_by_user, correct_letter)).to eq("app__")
  end

  it "given correct letter 'a', it updates letter in word 'banana'" do
    selected_word_from_list = "banana"
    word_guessed_by_user = "b_____"
    correct_letter = "a"
    hangman = Hangman.new()
    expect(hangman.show_letter(selected_word_from_list, word_guessed_by_user, correct_letter)).to eq("ba_a_a")
  end
end

describe WordFileReader do
  it "returns list of words" do
    word_file_reader = WordFileReader.new()
    result = word_file_reader.read_file(File.expand_path("test_words.txt")) # needed to generate an absolute file path for the text file
    expect(result).to eq(["Apple", "Banana", "Mango", "Melon", "Pineapple"])
  end

  it "returns list of words" do
    word_file_reader = WordFileReader.new()
    result = word_file_reader.read_file(File.expand_path("test_words.txt"))
    expect(result).not_to eq(["Apple","Mango", "Melon", "Pineapple"])
    end
end

describe Validator do
  it "checks if a valid character is a letter" do
    validator = Validator.new()
    user_input = "a"
    expect(validator.is_letter?(user_input)).to eq(true)
  end

  it "checks if an invalid character is a letter" do
    validator = Validator.new()
    user_input = "%"
    expect(validator.is_letter?(user_input)).to eq(false)
  end

  it "checks if a valid character is a letter when its uppercase" do
    validator = Validator.new()
    user_input = "A"
    expect(validator.is_letter?(user_input)).to eq(true)
  end
end
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

  it "displays incorect message" do
    input = StringIO.new
    output = StringIO.new
    display = Display.new(input, output)
    display.displays_incorrect_message
    expect(output.string.chomp).to eq("Incorrect entry, please enter another letter")


  end

end

describe GuessedWord do
  it "converts computer word to word with blank spaces" do
    word_guessed_by_user = GuessedWord.new
    expect(word_guessed_by_user.convert("Mango")).to eq("_____")
  end

end
