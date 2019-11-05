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

end
