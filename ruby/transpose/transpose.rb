module Transpose
  def self.transpose(input)
    columns(padded_lines(input)).join("\n")
  end

  private

  def self.padded_lines(input)
    lines = input.each_line.map(&:chomp)

    lines.each_with_index.flat_map do |line, index|
      pad_length = lines.drop(index + 1).map(&:size).max.to_i
      line.ljust(pad_length)
    end
  end

  def self.columns(lines)
    number_of_columns = lines.map(&:size).max.to_i
    (0...number_of_columns).map { |column| column(lines, column) }
  end

  def self.column(lines, column)
    lines.map { |line| line[column] }.join
  end
end