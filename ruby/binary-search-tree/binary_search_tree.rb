class Bst
  attr_reader :data, :left, :right 

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(new_data)
    if new_data <= @data
      left.nil? ? @left = Bst.new(new_data) : left.insert(new_data)
    else
      right.nil? ? @right = Bst.new(new_data) : right.insert(new_data)
    end
  end

  def each
    iterator = Enumerator.new do |y|
      left.each { |l| y << l } if left
      y << data
      right.each { |r| y << r } if right
    end

    return iterator unless block_given?

    iterator.each { |value| yield value }
  end
end
