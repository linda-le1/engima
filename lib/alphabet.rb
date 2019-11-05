class Alphabet
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def find_letter_starting_point(letter)
    @alphabet.find_index(letter)
  end

end
