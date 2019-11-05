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
    assert_equal [7, 4, 11, 11, 14], encryption.get_message_indexes("hello")
  end

  def test_it_shifts
    encryption = Encryption.new
    assert_equal [12, 14, 16, 18], encryption.set_shifts(["10", "11", "12", "13"], ["2", "3", "4", "5"])
  end

  def test_it_encrypts_into_new_letters
    encryption = Encryption.new
    message = "hello"
    encryption.get_message_indexes("hello")
    encryption.set_shifts(["2", "1", "1", "1"], ["2", "3", "4", "5"])

    assert_equal "liqrs", encryption.update_letter_indexes
  end
end
