module PrimeFactors
  def self.factors(value : Int64) : Array(Int32)
    factor = 2
    factors = [] of Int32

    while value > 1
      while value % factor != 0
        factor += factor == 2 ? 1 : 2
      end

      value //= factor
      factors << factor
    end

    factors
  end
end
