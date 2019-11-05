require './test/test_helper'
require './lib/alphabet'

class AlphabetTest < Minitest::Test

  def setup
    @alphabet = Alphabet.new
  end

  def test_it_exists
    assert_instance_of Alphabet, @alphabet
  end

  def test_it_has_27_characters
    assert_equal 27, @alphabet.alphabet.count
  end
end 
