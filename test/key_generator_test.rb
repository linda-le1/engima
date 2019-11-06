require_relative 'test_helper'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def setup
    @key_generator = KeyGenerator.new(12345)
  end

  def test_it_exists
    assert_instance_of KeyGenerator, @key_generator
  end

  def test_it_initializes
    assert_equal 51119, @key_generator.date
  end

  def test_it_generates_key
    assert_equal 4, @key_generator.generate_random_key.length
  end

  def test_it_has_an_offset
    assert_equal 4, @key_generator.calculate_offset_from_date.length
  end

  def test_it_can_calculate_shifts
    assert_equal 4, @key_generator.set_shifts.count
  end
end
