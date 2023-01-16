module CollatzConjecture
  def self.steps(n)
    raise ArgumentError.new unless n > 0

    count = 0

    until n == 1
      n = n.even? ? n // 2 : n * 3 + 1
      count += 1
    end

    count
  end
end
