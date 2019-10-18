require 'hangman'

describe Hangman do

  before(:each) do
    input = StringIO.new("z")
    @output = StringIO.new
    display = Display.new(input, @output)
    message = Message.new 
    @hangman = Hangman.new(display, message)
  end


  it "is valid if letter is in the word" do
    guessed_letter = "a"
    selected_word_from_list = "Apple"
    # hangman = Hangman.new(display)
    expect(@hangman.check_word(guessed_letter, selected_word_from_list)).to eq(true)
  end

  it "is invalid if letter is not in the word" do
    guessed_letter = "z"
    selected_word_from_list = "apple"
    # hangman = Hangman.new()
    expect(@hangman.check_word(guessed_letter, selected_word_from_list)).to eq(false)
  end

  it "is valid if the word is complete" do
    word_guessed_by_user = "banana"
    # hangman = Hangman.new()
    expect(@hangman.is_complete?(word_guessed_by_user)).to eq(true)
  end

  it "is invalid if the word is not complete" do
    word_guessed_by_user = "b_nan_"
    # hangman = Hangman.new()
    expect(@hangman.is_complete?(word_guessed_by_user)).to eq(false)
  end

  it "gives user only one more attempt when guess is wrong " do
    guessed_letter = "z"
    attempts_remaining = 1
    selected_word_from_list = "apple"
    word_guessed_by_user = "app_e"

    @hangman.guess_word(attempts_remaining, selected_word_from_list, word_guessed_by_user)

    expect(@output.string).to include("You have 0 attempts remaining")
  end
# write new test for guess_word method to return message of number of attempts remaining , check for the outout of guess that contains attempts_remaining
  it "given correct letter 'a', it updates letter in computer word 'apple'" do
    selected_word_from_list = "apple"
    word_guessed_by_user = "_____"
    correct_letter = "a"
    # hangman = Hangman.new()
    expect(@hangman.show_letter(selected_word_from_list, word_guessed_by_user, correct_letter)).to eq("a____")
  end

  it "given correct letter 'e', it updates letter in word 'apple'" do
    selected_word_from_list = "apple"
    word_guessed_by_user = "a____"
    correct_letter = "e"
    # hangman = Hangman.new()
    expect(@hangman.show_letter(selected_word_from_list, word_guessed_by_user, correct_letter)).to eq("a___e")
  end

  it "given correct letter 'p', it updates letter in word 'apple'" do
    selected_word_from_list = "apple"
    word_guessed_by_user = "a____"
    correct_letter = "p"
    # hangman = Hangman.new()
    expect(@hangman.show_letter(selected_word_from_list, word_guessed_by_user, correct_letter)).to eq("app__")
  end

  it "given correct letter 'a', it updates letter in word 'banana'" do
    selected_word_from_list = "banana"
    word_guessed_by_user = "b_____"
    correct_letter = "a"
    # hangman = Hangman.new()
    expect(@hangman.show_letter(selected_word_from_list, word_guessed_by_user, correct_letter)).to eq("ba_a_a")
  end
end
