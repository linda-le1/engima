class Decryption
    attr_reader :alphabet,
                :message

  def initialize(message)
    @alphabet = ("a".."z").to_a << " "
    @shifts = []
    @message_to_be_decrypted = []
    @message = message
  end

  def find_letter_starting_point(letter)
    @alphabet.find_index(letter)
  end

  def get_message_indexes(message)
    new_message = message.split("")
    new_message.map do |letter|
      @message_to_be_decrypted << find_letter_starting_point(letter)
    end
    @message_to_be_decrypted
  end

  def get_key_pairs(key)
    key = key.to_s
    key.rjust(5, "0")
    key.chars.each_cons(2).map(&:join)
  end

  def calculate_offset_from_date(date)
    date = date.to_i
    squared_total = (date ** 2)
    squared_total.to_s[-4..-1]
  end

  def set_shifts(get_key_pairs, calculate_offset_from_date)
    @shifts << get_key_pairs[0].to_i + calculate_offset_from_date[0].to_i
    @shifts << get_key_pairs[1].to_i + calculate_offset_from_date[1].to_i
    @shifts << get_key_pairs[2].to_i + calculate_offset_from_date[2].to_i
    @shifts << get_key_pairs[3].to_i + calculate_offset_from_date[3].to_i
  end

  def decrypt_message
    new_message = []
    @message_to_be_decrypted.map do |letter_index|
      new_message << ((letter_index - @shifts.first).abs)%27
         @shifts.rotate!
    end
    new_decrypted = []
    new_message.map do |value|
      new_decrypted << @alphabet[value]
    end
    new_decrypted.join
  end
end
