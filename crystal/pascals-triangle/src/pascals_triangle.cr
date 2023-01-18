module PascalsTriangle
  def self.rows(count)
    1.upto(count).map { |n| row(n) }.to_a
  end

  def self.row(index)
    1.upto(index - 1).each_with_object([1]) do |j, elements|
      elements << elements.last * (index - j) // j
    end
  end
end
