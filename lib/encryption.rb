require './lib/alphabet'

class Encryption
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def find_letter_starting_point(letter)
    @alphabet.find_index(letter)
  end

  def get_message_indexes(message)
    new_message = message.split("")
    new_message.map do |letter|
      find_letter_starting_point(letter)
    end
  end
end
