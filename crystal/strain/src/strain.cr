module Enumerable(T)
  def keep
    each_with_object([] of T) { |elem, acc| acc << elem if yield elem }
  end

  def discard
    keep { |elem| !yield elem }
  end
end
