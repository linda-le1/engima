require_relative 'test_helper'
require './lib/alphabet'
require './lib/key_generator'
require './lib/encryption'

class EncryptionTest < Minitest::Test

  def test_it_exists
    encryption = Encryption.new
    assert_instance_of Encryption, encryption
  end

  def test_it_can_split_message_into_indexes
    encryption = Encryption.new
    assert_equal [7, 4, 11, 11, 14], encryption.get_message_in_indexes("hello")
  end

  def test_it_encrypts_into_new_letters
    encryption = Encryption.new
    key_generator = KeyGenerator.new(11111, 61119)
    key_generator.generate_random_key
    key_generator.calculate_offset_from_date
    key_generator.set_shifts
    encryption.get_message_in_indexes("hello")
    assert_equal "uryya", encryption.encryption("hello", 11111, 61119)
  end
end
