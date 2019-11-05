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


  def test_it_can_calculate_new_indexes
    encryption = Encryption.new
    assert_equal [8, 6, 14, 15, 15], encryption.update_letter_indexes("hello", [1, 2, 3, 4])
  end

end
