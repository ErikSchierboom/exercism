module Primes
  def self.sieve(limit : Int32) : Array(Int32)
    sieve = Array.new(limit + 1, true)

    (2..limit).each do |number|
      next unless sieve[number]

      (number * 2..limit).step(number).each do |multiple|
        sieve[multiple] = false
      end
    end

    sieve.map_with_index { |is_prime, i| i if is_prime && i > 1 }.compact
  end
end
