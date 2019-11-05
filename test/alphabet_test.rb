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

  def test_it_starts_with_a
    assert_equal "a", @alphabet.alphabet.first
  end

  def test_it_ends_with_the_space
    assert_equal " ", @alphabet.alphabet.last
  end

  def test_it_can_find_letter_index_value
    assert 3, @alphabet.find_letter_starting_point("d")
  end
end
