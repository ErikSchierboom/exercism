module PhoneNumber
  def self.clean(phone_number)
    @digits = phone_number.scan(/\d/)
    @digits.unshift('1') unless @digits.size == 11
    @digits[1..].join('') if valid?
  end

  private

  def self.valid?
    correct_number_of_digits? && country_code_valid? && area_code_valid? && exchange_code_valid?
  end

  def self.correct_number_of_digits?
    @digits.size == 11
  end

  def self.country_code_valid?
    @digits[0] == '1'
  end

  def self.area_code_valid?
    @digits[1] != '0' && @digits[1] != '1'
  end

  def self.exchange_code_valid?
    @digits[4] != '0' && @digits[4] != '1'
  end
end
