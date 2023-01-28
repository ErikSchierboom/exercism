class Deque
  def initialize = @elements = []

  def push(value) = @elements.push(value)
  def pop = @elements.pop
  def unshift(value) = @elements.unshift(value)
  def shift = @elements.shift
end