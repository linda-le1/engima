require './lib/key_generator'
class Decryption
    attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def find_letter_starting_point(letter)
    @alphabet.find_index(letter)
  end

  def get_message_in_indexes(message)
    new_message = message.split("")
    message_to_be_decrypted = []
    new_message.map do |letter|
      message_to_be_decrypted << find_letter_starting_point(letter)
    end
    message_to_be_decrypted
  end

  def get_reverse_indexed_message(message, key_generator)
    message_to_be_decrypted = get_message_in_indexes(message)
    new_message = []
    message_to_be_decrypted.map do |letter_index|
      new_message << (letter_index - key_generator.set_shifts.first)%27
         key_generator.set_shifts.rotate!
    end
    new_message
  end

  def decryption(message, key_generator)
    to_decrypt = get_reverse_indexed_message(message, key_generator)
    fully_decrypted_message = []
    to_decrypt.map do |value|
      fully_decrypted_message << @alphabet[value]
    end
    fully_decrypted_message.join
  end
end
