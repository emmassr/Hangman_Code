class Validator
  def is_letter?(user_input)
    if user_input.match(/[A-Za-z]/)
      true
    else
      false
    end
  end
end
