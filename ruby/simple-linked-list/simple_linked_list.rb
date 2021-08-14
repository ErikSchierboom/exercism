class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum)
    @datum = datum
  end
end

class SimpleLinkedList
  def initialize(values = [])
    values.each do |value|
      push(Element.new(value))
    end
  end

  def push(element)
    element.next = root
    @root = element
    self
  end

  def pop
    root&.tap do |old_root|
      @root = old_root&.next
    end
  end

  def to_a
    elements.map(&:datum)
  end

  def reverse!
    elements.tap do 
      @root = nil
    end.reduce(self) do |list, element| 
      list.push(element)
    end
  end

  private
  attr_reader :root

  def elements
    elems = []
    current = root

    until current.nil? do
      elems << current
      current = current.next
    end

    elems
  end
end