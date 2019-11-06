require_relative 'test_helper'
require './lib/key_generator'
require './lib/encryption'

class EncryptionTest < Minitest::Test

  def test_it_exists
    encryption = Encryption.new
    assert_instance_of Encryption, encryption
  end

  def test_it_initializes
    encryption = Encryption.new
    assert_equal 27, encryption.alphabet.count
  end

  def test_it_can_find_letter_indexes
    encryption = Encryption.new
    assert_equal 0, encryption.find_letter_starting_point("a")
    assert_equal 10, encryption.find_letter_starting_point("k")
    assert_equal 26, encryption.find_letter_starting_point(" ")
  end

  def test_it_can_split_message_into_indexes
    encryption = Encryption.new
    assert_equal [7, 4, 11, 11, 14], encryption.get_message_in_indexes("hello")
  end

  def test_it_applies_shifts_correctly_to_indexes
    encryption = Encryption.new
    key_generator = KeyGenerator.new(11111, 61119)
    assert_equal [20, 16, 1, 23, 0], encryption.apply_shifts_to_message_in_indexes("hello", key_generator)
  end

  def test_it_encrypts_into_new_letters
    encryption = Encryption.new
    key_generator = KeyGenerator.new(11111, 61119)
    key_generator.generate_random_key
    key_generator.calculate_offset_from_date
    key_generator.set_shifts
    encryption.get_message_in_indexes("hello")
    assert_equal "uqbxa", encryption.encryption("hello", key_generator)
  end
end
