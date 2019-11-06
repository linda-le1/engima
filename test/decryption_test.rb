require_relative 'test_helper'
require './lib/key_generator'
require './lib/decryption'

class DecryptionTest < Minitest::Test

  def test_it_exists
    decryption = Decryption.new
    assert_instance_of Decryption, decryption
  end

  def test_it_initializes
    decryption = Decryption.new
    assert_equal 27, decryption.alphabet.count
  end

  def test_it_can_find_letter_indexes
    decryption = Decryption.new
    assert_equal 3, decryption.find_letter_starting_point("d")
    assert_equal 14, decryption.find_letter_starting_point("o")
    assert_equal 26, decryption.find_letter_starting_point(" ")
  end

  def test_it_decrypts
    decryption = Decryption.new
    key_generator = KeyGenerator.new("02715", "040895")
    decryption.get_message_in_indexes("keder")
    key_generator.set_shifts
    assert_equal "hello", decryption.decryption("keder", key_generator)
  end
end
