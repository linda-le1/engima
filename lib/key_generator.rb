require 'date'
class KeyGenerator
  attr_reader :key,
              :date

  def initialize(key, date)
    @key = key
    @date = date
  end

  def generate_random_key
    if @key.nil?
      @key = rand(99999).to_s
      @key.rjust(5, "0")
    else
      @key = @key.to_s
    end
    @key.chars.each_cons(2).map(&:join)
  end

  def calculate_offset_from_date
    if @date.nil?
      @date = Time.now.strftime("%d%m%y").to_i
    end
    date = @date.to_i
    squared_total = (date ** 2)
    squared_total.to_s[-4..-1]
  end

  def set_shifts
    shifts = []
    shifts << generate_random_key[0].to_i + calculate_offset_from_date[0].to_i
    shifts << generate_random_key[1].to_i + calculate_offset_from_date[1].to_i
    shifts << generate_random_key[2].to_i + calculate_offset_from_date[2].to_i
    shifts << generate_random_key[3].to_i + calculate_offset_from_date[3].to_i
    shifts
  end
end
