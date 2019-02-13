module Enumerable
  def keep
    each_with_object([]) do |elem, acc|
      acc << elem if yield(elem)
    end
  end

  def discard
    keep { |elem| !yield(elem) }
  end
end