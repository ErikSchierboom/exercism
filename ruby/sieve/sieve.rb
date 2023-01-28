class Sieve
  def initialize(max) = @max = max

  def primes
    sieve = Array.new(@max + 1, true)

    (2..@max).each do |number|
      next unless sieve[number]

      (number * 2..@max).step(number).each { |multiple| sieve[multiple] = false }
    end

    sieve.each_with_index.filter_map { |is_prime, i| i if is_prime && i > 1 }
  end
end