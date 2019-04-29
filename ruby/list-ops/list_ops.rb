module ListOps
  def self.arrays(input)
    count = 0

    input.each do
      count += 1
    end

    count
  end

  def self.reverser(input)
    reversed = []

    input.each do |element|
      reversed.unshift(element)
    end

    reversed
  end

  def self.concatter(input1, input2)
    concatted = []

    input1.each do |element|
      concatted << element
    end

    input2.each do |element|
      concatted << element
    end

    concatted
  end

  def self.mapper(input)
    mapped = []

    input.each do |element|
      mapped << yield(element)
    end

    mapped
  end

  def self.filterer(input)
    filtered = []

    input.each do |element|
      filtered << element if yield(element)
    end

    filtered
  end

  def self.sum_reducer(input)
    sum = 0

    input.each do |element|
      sum += element
    end

    sum
  end

  def self.factorial_reducer(input)
    factorial = 1

    input.each do |element|
      factorial *= element
    end

    factorial
  end
end