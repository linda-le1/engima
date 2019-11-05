class Encryption
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @shifts = []
  end

  def find_letter_starting_point(letter)
    @alphabet.find_index(letter)
  end

  def get_message_indexes(message)
    new_message = message.split("")
    new_message.map do |letter|
      find_letter_starting_point(letter)
    end
  end

  def generate_random_key
    key = rand(99999).to_s
    key.rjust(5, "0")
    key.chars.each_cons(2).map(&:join)
  end

  def calculate_offset_from_date
    date = date.to_i
    squared_total = (date ** 2)
    squared_total.to_s[-4..-1]
  end

  def set_shifts(generate_random_key, calculate_offset_from_date)
    @shifts << generate_random_key[0].to_i + calculate_offset_from_date[0].to_i
    @shifts << generate_random_key[1].to_i + calculate_offset_from_date[1].to_i
    @shifts << generate_random_key[2].to_i + calculate_offset_from_date[2].to_i
    @shifts << generate_random_key[3].to_i + calculate_offset_from_date[3].to_i
  end

  def update_letter_indexes(message, set_shifts)
    encrypted_message = get_message_indexes(message)
    new_message = []
    encrypted_message.map do |letter_index|
      new_message << (letter_index + set_shifts.first)%27
         set_shifts.rotate!
    end
    new_message
  end

  def encrypt
    update_letter_indexes.map do char

  end

end
