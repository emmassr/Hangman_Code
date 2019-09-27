class WordConverter
  def convert(selected_word_from_list)
    selected_word_from_list.gsub(/./, '_')

  end
end
