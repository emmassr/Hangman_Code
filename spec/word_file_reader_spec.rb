require "word_file_reader"

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
