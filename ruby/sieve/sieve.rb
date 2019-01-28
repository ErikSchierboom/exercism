class Sieve
  def initialize(max)
    @max = max
  end

  def primes
    is_prime = Array.new(@max + 1, true)
    primes = []

    (2..@max).each do |number|
      next unless is_prime[number]

      (number * 2..@max).step(number).each do |multiple|
        is_prime[multiple] = false
      end

      primes << number
    end
  end
end