module CollatzConjecture
  def self.steps(number)
    raise ArgumentError, "Number must be > 0" unless number > 0

    count = 0

    until number == 1 do
      number = number.even? ? number / 2 : number * 3 + 1
      count += 1
    end

    count
  end
end
