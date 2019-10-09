require "random_word_selector"
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
