require 'hangman'
describe RandomWordSelector do
  it "chooses word from single element array randomly" do
    words = ["AH"]
    random_word_selector = RandomWordSelector.new()
    expect(random_word_selector.select_word(words)).to eq("AH")
  end

  it "chooses word from multiple element array randomly" do
    words = ["hello", "there"]
    random_word_selector = RandomWordSelector.new()
    result = random_word_selector.select_word(words)
    expect([result].length).to eq(1)
    expect(words.include?(result)).to eq(true)
  end

end

describe Hangman do
  it "is valid if letter is in the word" do
    letter = "a"
    word = "apple"
    hangman = Hangman.new()
    expect(hangman.check_word(letter, word)).to eq(true)
  end

  it "is invalid if letter is not in the word" do
    letter = "z"
    word = "apple"
    hangman = Hangman.new()
    expect(hangman.check_word(letter, word)).to eq(false)
  end

  it "is valid if the word is complete" do
    word = "banana"
    hangman = Hangman.new()
    expect(hangman.is_complete?(word)).to eq(true)
  end

  it "is invalid if the word is not complete" do
    word = "b_nan_"
    hangman = Hangman.new()

    expect(hangman.is_complete?(word)).to eq(false)
  end

  it "gives user only one more attempt when guess is wrong " do
    letter = "z"
    word = "apple"
    hangman = Hangman.new()
    attempts_remaining = 1
    expect(hangman.guess_word(attempts_remaining, word, letter)).to eq(0)
  end

  it "given correct letter 'a', it updates letter in computer word 'apple'" do
    computer_word = "apple"
    guessed_word = "_____"
    correct_letter = "a"
    hangman = Hangman.new()
    expect(hangman.show_letter(computer_word, guessed_word, correct_letter)).to eq("a____")
  end

  it "given correct letter 'e', it updates letter in word 'apple'" do
    computer_word = "apple"
    guessed_word = "a____"
    correct_letter = "e"
    hangman = Hangman.new()
    expect(hangman.show_letter(computer_word, guessed_word, correct_letter)).to eq("a___e")
  end

  it "given correct letter 'p', it updates letter in word 'apple'" do
    computer_word = "apple"
    guessed_word = "a____"
    correct_letter = "p"
    hangman = Hangman.new()
    expect(hangman.show_letter(computer_word, guessed_word, correct_letter)).to eq("app__")
  end

  it "given correct letter 'a', it updates letter in word 'banana'" do
    computer_word = "banana"
    guessed_word = "b_____"
    correct_letter = "a"
    hangman = Hangman.new()
    expect(hangman.show_letter(computer_word, guessed_word, correct_letter)).to eq("ba_a_a")
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
