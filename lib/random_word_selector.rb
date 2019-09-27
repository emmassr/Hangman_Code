class RandomWordSelector

  def select_word_from(words)
    words.sample().downcase #sample is used for arrays
  end

end
