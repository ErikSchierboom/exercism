module CollatzConjecture
  def self.steps(number, count = 0)
    raise ArgumentError, "Number must be > 0" unless number > 0

    return count if number == 1

    steps(number.even? ? number / 2 : number * 3 + 1, count + 1)
  end
end
