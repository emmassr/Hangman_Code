require "word_converter"
describe WordConverter do
  it "converts computer word to word with blank spaces" do
    word_guessed_by_user = WordConverter.new
    expect(word_guessed_by_user.convert("Mango")).to eq("_____")
  end

end
