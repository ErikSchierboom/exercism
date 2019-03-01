class Transpose

  def self.transpose(*args)
    new(*args).transpose
  end

  def transpose
    rows = input.split("\n")
    row_lengths = rows.map(&:size)
    number_of_columns = row_lengths.max.to_i
    transposed = Array.new(number_of_columns, '')

    rows.each_with_index do |row, row_index|
      row.each_char.each_with_index do |col, col_index|
        transposed[col_index] += col
      end

      remainder_rows_max_length = row_lengths.drop(row_index + 1).max.to_i
      row_lengths[row_index].upto(remainder_rows_max_length - 1).each do |k|
        transposed[k] += ' '
      end
    end

    transposed.join("\n")
  end

  private

  attr_reader :input

  def initialize(input)
    @input = input
  end
end