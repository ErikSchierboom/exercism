module Transpose

  def self.transpose(input)
    columns(padded_lines(input)).join("\n")
  end

  def self.padded_lines(input)
    lines = input.split("\n")
    lines.each_with_index.flat_map do |line, index|
      line.ljust(padding_length(lines, index))
    end
  end

  def self.padding_length(lines, index)
    lines.drop(index + 1).map(&:size).max.to_i
  end

  def self.columns(lines)
    number_of_columns = lines.map(&:size).max.to_i
    (0...number_of_columns).map { |column| column(lines, column) }
  end

  def self.column(lines, column)
    lines.map { |line| line[column] }.join
  end
end