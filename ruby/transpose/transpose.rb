class Transpose
  def self.transpose(*args)
    new(*args).transpose
  end

  def initialize(input)
    @input = input
  end

  def transpose
    rows = input.split("\n")
    row_lengths = rows.map(&:size).max

    rows.map { |row| row.chars.values_at(0...row_lengths) }
        .transpose
        .map do |col|
      col
        .take(col.size - col.reverse.take_while(&:nil?).count)
        .map { |c| c.nil? ? ' ' : c }
        .join
    end
        .join("\n")
  end

  private

  attr_reader :input
end