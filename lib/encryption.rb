require './lib/key_generator'

class Encryption
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
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

  def apply_shifts_to_message_in_indexes(message, key_generator)
    updated_message = get_message_in_indexes(message)
    shifted_message = []
    updated_message.map do |letter_index|
      shifted_message << (letter_index + key_generator.set_shifts.first)%27
         key_generator.set_shifts.rotate!
    end
    shifted_message
  end

  def encryption(message, key_generator)
    message_to_be_encrypted = apply_shifts_to_message_in_indexes(message, key_generator)
    encrypted_message = []
    message_to_be_encrypted.map do |value|
      encrypted_message << @alphabet[value]
    end
    encrypted_message.join
  end
end
