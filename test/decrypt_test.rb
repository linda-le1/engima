require_relative 'test_helper'
require './lib/key_generator'
require './lib/decrypt'

class DecryptionTest < Minitest::Test

  def test_it_exists
    decryption = Decryption.new
    assert_instance_of Decryption, decryption
  end

  def test_it_decrypts
    decryption = Decryption.new
    key_generator = KeyGenerator.new(11111, 61119)
    decryption.get_message_in_indexes("uryya")
    key_generator.set_shifts
    assert_equal "hello", decryption.decryption("uryya", key_generator)
  end

end
