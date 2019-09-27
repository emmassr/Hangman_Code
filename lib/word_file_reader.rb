class WordFileReader #created this classs to use a text file with a list of words for the game, text file named word.txt in Hangman folder
  def read_file(path_to_file)
    file = File.open(path_to_file)# this opens the text file
    file_data = file.readlines.map(&:chomp)#the readlines.map command goes through each word in the list and puts it in an array and the chomp removes the feature of a new line start and places the words next to each other in an array eg: ["word1, "word2"]
    file.close # closes file
    file_data  # returns all the words which in is now in the array
  end
end
