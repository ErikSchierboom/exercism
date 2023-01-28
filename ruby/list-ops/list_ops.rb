module ListOps
  def self.arrays(input)
    count = 0
    input.each { count += 1 }
    count
  end

  def self.reverser(input)
    reversed = []
    input.each { |element| reversed.unshift(element) }
    reversed
  end

  def self.concatter(input1, input2)
    concatted = []
    input1.each { |element| concatted << element }
    input2.each { |element| concatted << element }
    concatted
  end

  def self.mapper(input)
    mapped = []
    input.each { |element| mapped << yield(element) }
    mapped
  end

  def self.filterer(input)
    filtered = []
    input.each { |element| filtered << element if yield(element) }
    filtered
  end

  def self.sum_reducer(input)
    sum = 0
    input.each { |element| sum += element }
    sum
  end

  def self.factorial_reducer(input)
    factorial = 1
    input.each { |element| factorial *= element }
    factorial
  end
end