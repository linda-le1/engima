require_relative 'test_helper'
require './lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def setup
    @key_generator = KeyGenerator.new("02715", "040895")
  end

  def test_it_exists
    assert_instance_of KeyGenerator, @key_generator
  end

  def test_it_initializes
    assert_equal "02715", @key_generator.key
    assert_equal "040895", @key_generator.date
  end

  def test_it_uses_provided_key
    assert_equal ["02", "27", "71", "15"], @key_generator.generate_random_key
    assert_equal 4, @key_generator.generate_random_key.length
  end

  def test_random_key_is_five_digits_long
    key_generator =KeyGenerator.new(key = nil , date = nil)
    assert 5, key_generator.generate_random_key
  end

  def test_date_defaults_to_today
    key_generator = KeyGenerator.new("02715", date = nil)
    assert_equal "2161", key_generator.calculate_offset_from_date
  end

  def test_it_creates_offset_from_dates
    assert_equal "1025", @key_generator.calculate_offset_from_date
    assert_equal 4, @key_generator.calculate_offset_from_date.length
  end

  def test_it_can_calculate_shifts
    assert_equal [3, 27, 73, 20], @key_generator.set_shifts
    assert_equal 4, @key_generator.set_shifts.count
  end
end
