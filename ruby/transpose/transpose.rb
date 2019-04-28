class Transpose
  def self.transpose(*args)
    new(*args).transpose
  end

  def initialize(input)
    @rows = input.lines(chomp: true)
  end

  def transpose
    transposed_array
      .map(&method(:unpad))
      .join("\n")
  end

  private

  attr_reader :rows

  def transposed_array
    rows.map(&method(:pad))
        .map(&:chars)
        .transpose
  end

  def max_row_length
    rows.map(&:length).max
  end

  def pad(row)
    row.ljust(max_row_length, PADDING_CHAR)
  end

  def unpad(col)
    col.join
       .gsub(TRAILING_PADDING_CHARS, '')
       .tr(PADDING_CHAR, ' ')
  end

  PADDING_CHAR = "\u0080".freeze
  TRAILING_PADDING_CHARS = /#{PADDING_CHAR}+$/.freeze

  private_constant :PADDING_CHAR, :TRAILING_PADDING_CHARS
end