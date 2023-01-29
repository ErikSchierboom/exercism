module Prime
  def self.nth(number)
    raise ArgumentError if number.zero?

    primes = [2, 3]
    current = 6

    while primes.size < number
      primes << current.pred unless primes.any? { |prime| (current.pred % prime).zero? }
      primes << current.succ unless primes.any? { |prime| (current.succ % prime).zero? }
      current += 6
    end

    primes[number - 1]
  end
end
  