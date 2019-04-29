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
      middle_value = list[middle_index]

      case compare(middle_value, value)
      when :smaller
        left_index = middle_index + 1
      when :larger
        right_index = middle_index - 1
      when :equal
        return middle_index
      end
    end

    raise 'Could not find value in list'
  end

  private

  def compare(value1, value2)
    case value1 <=> value2
    when -1
      :smaller
    when 1
      :larger
    else
      :equal
    end
  end
end

module Enumerable
  def sorted?
    each_cons(2).all? { |a, b| a <= b }
  end
end