class Transpose

  def self.transpose(*args)
    new(*args).transpose
  end

  def transpose
    columns.join("\n")
  end

  private

  attr_reader :rows

  def initialize(input)
    @rows = input.split("\n")
  end

  def padded_rows
    rows.each_with_index.flat_map(&method(:pad_row))
  end

  def pad_row(row, index)
    row.ljust(padding_length(index))
  end

  def padding_length(index)
    rows
      .drop(index + 1)
      .map(&:size)
      .max
      .to_i
  end

  def columns
    padded_rows
      .map(&:size)
      .max
      .to_i
      .times
      .map(&method(:column))
  end

  def column(column)
    padded_rows.map { |row| row[column] }.join
  end
end