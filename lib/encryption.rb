class Encryption
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @shifts = []
    @encrypted = []
  end

  def find_letter_starting_point(letter)
    @alphabet.find_index(letter)
  end

  def get_message_indexes(message)
    new_message = message.split("")
    new_message.map do |letter|
      @encrypted << find_letter_starting_point(letter)
    end
    @encrypted
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

  def encrypt_message
    message = @encrypted
    new_message = []
    message.map do |letter_index|
      new_message << (letter_index + @shifts.first)%27
         @shifts.rotate!
    end
    new_encrypted = []
    new_message.map do |value|
      new_encrypted << @alphabet[value]
    end
    new_encrypted.join
  end
end
