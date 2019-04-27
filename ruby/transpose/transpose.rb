class Transpose
  PADDING_CHAR = "\u0080".freeze
  private_constant :PADDING_CHAR

  def self.transpose(*args)
    new(*args).transpose
  end

  def initialize(input)
    @rows = input.split("\n")
  end

  def transpose
    transposed_array
      .map(&method(:normalize_col))
      .join("\n")
  end

  private

  attr_reader :rows

  def transposed_array
    rows.map(&method(:pad_row))
        .map(&:chars)
        .transpose
  end

  def pad_row(row)
    row.ljust(max_row_length, PADDING_CHAR)
  end

  def max_row_length
    rows.map(&:size).max
  end

  def normalize_col(col)
    col.join
       .gsub(/#{PADDING_CHAR}+$/, '')
       .tr(PADDING_CHAR, ' ')
  end
end