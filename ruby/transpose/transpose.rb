class Transpose
  def self.transpose(*args)
    new(*args).transpose
  end

  def initialize(input)
    @rows = input.split("\n")
  end

  def transpose
    transposed_array
      .map {|col| remove_trailing_newlines(col).join.tr("\n", ' ') }
      .join("\n")
  end

  private

  attr_reader :rows

  def transposed_array
    rows.map { |row| row.ljust(row_lengths, "\n").chars }
        .transpose
  end

  def row_lengths
    rows.map(&:size).max
  end

  def remove_trailing_newlines(col)
    col.reverse.drop_while { |c| c == "\n" }.reverse
  end
end