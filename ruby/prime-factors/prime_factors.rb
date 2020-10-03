module PrimeFactors
  def self.of(number)
    factor = 2
    factors = []

    while number > 1
      factor += factor == 2 ? 1 : 2 while number % factor != 0
      number /= factor
      factors << factor
    end

    factors
  end
end
