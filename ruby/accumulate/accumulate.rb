module Enumerable
  def accumulate
    return to_enum unless block_given?

    to_enum.each_with_object([]) do |elem, acc|
      acc << yield(elem)
    end
  end
end