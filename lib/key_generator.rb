class KeyGenerator
  attr_reader :date

  def initialize(date = Time.now.strftime("%d%m%y"))
    @date = date
  end

  def generate_random_key
    key = rand(99999).to_s
    key.rjust(5, "0")
  end

  def calculate_offset_from_date
    date = @date.to_i
    squared_total = (date ** 2)
    squared_total.to_s[-4..-1]
  end
end
