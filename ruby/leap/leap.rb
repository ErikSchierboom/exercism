module Year
  def self.leap?(year)
    year.remainder(4).zero? && year.remainder(100).positive? || year.remainder(400).zero?
  end
end