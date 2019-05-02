class BinarySearchIndex
  attr_reader :left_boundary, :right_boundary

  def initialize(left_boundary, right_boundary)
    @left_boundary = left_boundary
    @right_boundary = right_boundary
  end

  def middle
    (left_boundary + right_boundary) / 2
  end

  def search_left_of_middle!
    @right_boundary = middle - 1
  end

  def search_right_of_middle!
    @left_boundary = middle + 1
  end

  def valid?
    left_boundary < right_boundary
  end
end

class BinarySearch
  attr_reader :list

  def initialize(list)
    raise ArgumentError, 'List must be sorted' unless list.sorted?

    @list = list
    @search_index = BinarySearchIndex.new(0, list.size - 1)
  end

  def middle
    search_index.middle
  end

  def search_for(value)
    search_index = BinarySearchIndex.new(0, list.size - 1)

    while search_index.valid?
      middle_value = list[search_index.middle]

      case compare(middle_value, value)
      when :smaller
        search_index.search_right_of_middle!
      when :larger
        search_index.search_left_of_middle!
      when :equal
        return search_index.middle
      end
    end

    raise 'Could not find value in list'
  end

  private

  attr_reader :search_index

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