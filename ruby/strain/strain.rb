module Enumerable
  def keep = each_with_object([]) { |elem, acc| acc << elem if yield(elem) }
  def discard = keep { |elem| !yield(elem) }
end