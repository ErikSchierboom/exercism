class Queen
  attr_reader :row, :col

  def initialize(row, col)
      raise ArgumentError, 'Invalid row' unless row.between?(MIN_ROW, MAX_ROW)
      raise ArgumentError, 'Invalid col' unless col.between?(MIN_COL, MAX_COL)

      @row = row
      @col = col
  end

  MIN_ROW = 0
  MAX_ROW = 7
  MIN_COL = 0
  MAX_COL = 7
  private_constant :MIN_ROW, :MAX_ROW, :MIN_COL, :MAX_COL
end

class Queens
  def initialize(white: [0, 0], black: [0, 0])
    @white = Queen.new(white[0], white[1])
    @black = Queen.new(black[0], black[1])
  end

  def attack?
    same_row? || same_col? || same_diagonal?
  end

  private

  attr_reader :white, :black

  def same_row?
    white.row == black.row
  end

  def same_col?
    white.col == black.col
  end

  def same_diagonal?
    (white.row - black.row).abs == (white.col - black.col).abs
  end
end