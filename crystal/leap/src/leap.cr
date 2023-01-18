module Year
  def self.leap?(year)
    (year % 4).zero? && (year % 100).positive? || (year % 400).zero?
  end
end
