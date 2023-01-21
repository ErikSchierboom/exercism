class Node(T)
  include Enumerable(T)
  include Iterable(T)

  property value : Int32, left : Node(T)? = nil, right : Node(T)? = nil

  def initialize(@value : T)
  end

  def insert(insert_value)
    if insert_value <= @value
      left = @left
      left.nil? ? (@left = Node(T).new(insert_value)) : left.insert(insert_value)
    else
      right = @right
      right.nil? ? (@right = Node(T).new(insert_value)) : right.insert(insert_value)
    end
  end

  def search(search_value)
    return self if search_value == @value

    if search_value <= @value
      @left.try &.search(search_value)
    else
      @right.try &.search(search_value)
    end
  end

  def delete(delete_value)
    if delete_value < @value
      @left = @left.try &.delete(delete_value)
      self
    elsif delete_value > @value
      @right = @right.try &.delete(delete_value)
      self
    else
      l, r = left, right
      if !l.nil? && r.nil?
        @value = l.value
        @left = nil
        self
      elsif l.nil? && !r.nil?
        @value = r.value
        @right = nil
        self
      elsif !l.nil? && !r.nil?
        @value = r.each.first
        @right = r.delete(value)
        self
      else
        nil
      end
    end
  end

  def each
    NodeIterator.new(self)
  end

  def each(&block : T ->)
    NodeIterator.new(self).each { |v| yield v }
  end

  private class NodeIterator(T)
    include Iterator(T)

    def initialize(node : Node(T))
      @nodes = [] of Node(T)
      walk(node)
    end

    def next
      return stop if @nodes.empty?

      current = @nodes.pop
      walk(current.right) if current.right
      current.value
    end

    private def walk(current)
      while !current.nil?
        @nodes.push(current)
        current = current.left
      end
    end
  end
end
