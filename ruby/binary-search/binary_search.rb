class BinarySearch
  attr_reader :list

  def initialize(list)
    raise ArgumentError, 'List must be sorted' unless list.sorted?

    @list = list
  end

  def middle
    list.size / 2
  end

  def search_for(value)
    left_index = 0
    right_index = list.size - 1

    while left_index < right_index
      middle_index = (left_index + right_index) / 2
      middle_value_comparison = list[middle_index] <=> value

      return middle_index if middle_value_comparison.zero?

      left_index = middle_index + 1 if middle_value_comparison < 0
      right_index = middle_index - 1 if middle_value_comparison > 0
    end

    raise 'Could not find value in list'
  end
end

module Enumerable
  def sorted?
    each_cons(2).all? { |a, b| a <= b }
  end
end