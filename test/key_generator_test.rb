require_relative 'test_helper'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def setup
    @key_generator = KeyGenerator.new
  end

  def test_it_exists
    assert_instance_of KeyGenerator, @key_generator
  end

  def test_it_initializes
    key_generator = KeyGenerator.new(41119)
    assert_equal 41119, key_generator.date
  end

  def test_it_generates_five_digit_random_number
    assert_equal 5, @key_generator.generate_random_key.length
  end

  def test_it_has_an_offset
    assert_equal 4, @key_generator.calculate_offset_from_date.length
  end

end
