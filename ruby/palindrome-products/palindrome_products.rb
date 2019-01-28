class Palindrome
  attr_reader :value, :factors

  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end

class Palindromes
  attr_reader :largest, :smallest

  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def generate
    @smallest = palindrome(@max_factor**2 + 1, :<=, :<)
    @largest = palindrome(@min_factor**2 + 1, :>=, :>)
  end

  private

  def palindrome(initial, is_candidate, should_clear)
    palindrome_product = initial
    palindrome_factors = []

    pairs(@max_factor, @min_factor).each do |(x, y)|
      product = x * y

      next unless product.public_send(is_candidate, palindrome_product)
      next unless palindrome?(product)

      palindrome_factors.clear if product.public_send(should_clear, palindrome_product)
      palindrome_factors << [x, y]
      palindrome_product = product
    end

    Palindrome.new(palindrome_product, palindrome_factors)
  end

  def palindrome?(num)
    n = num
    rev = 0

    while num > 0
      dig = num % 10
      rev = rev * 10 + dig
      num /= 10
    end

    n == rev
  end

  def pairs(max_factor, min_factor)
    Enumerator.new do |yielder|
      (min_factor..max_factor.succ).each do |x|
        (x..max_factor.succ).each do |y|
          yielder << [x, y]
        end
      end
    end
  end
end