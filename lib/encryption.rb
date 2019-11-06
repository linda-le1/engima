require './lib/key_generator'

class Encryption
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @shifts = []
  end

  def find_letter_starting_point(letter)
    @alphabet.find_index(letter)
  end

  def get_message_in_indexes(message)
    message_in_indexes = []
    message = message.to_s.downcase.split("")
    message.map do |letter|
      message_in_indexes << find_letter_starting_point(letter)
    end
    message_in_indexes
  end

  def generate_random_key(key)
    key = rand(99999).to_s
    key.rjust(5, "0")
    key.chars.each_cons(2).map(&:join)
  end

  def calculate_offset_from_date(date)
    date = date.to_i
    squared_total = (date ** 2)
    squared_total.to_s[-4..-1]
  end

  def set_shifts(key, date)
    generate_random_key(key)
    calculate_offset_from_date(date)
    @shifts << generate_random_key[0].to_i + calculate_offset_from_date[0].to_i
    @shifts << generate_random_key[1].to_i + calculate_offset_from_date[1].to_i
    @shifts << generate_random_key[2].to_i + calculate_offset_from_date[2].to_i
    @shifts << generate_random_key[3].to_i + calculate_offset_from_date[3].to_i
  end

  def encryption(message, key = nil, date = nil)
    updated_message = get_message_in_indexes(message)
    shifted_message = []
    encrypted_message = []
    updated_message.map do |letter_index|
      shifted_message << (letter_index + @shifts.first)%27
         @shifts.rotate!
    end
    encrypted_message = []
    shifted_message.map do |value|
      encrypted_message << @alphabet[value]
    end
    encrypted_message.join
  end
end
