require_relative "hangman"

display = Display.new

hangman = Hangman.new(display)
hangman.play_game


# 
# class Person
#
#   def initialize(first_name, second_name)
#     @first_name = first_name
#   end
#
#   def show_name
#     first_name = "himalee"
#     second_name = "tailor"
#     print @first_name + @second_name
#   end
# end
#
# person = Person.new("himalee", "tailor")
