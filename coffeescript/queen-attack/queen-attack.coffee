class QueenAttack
  constructor: ({ @row, @column }) ->
    throw new Error('row not positive') if @row < 0
    throw new Error('row not on board') if @row > 7
    throw new Error('column not positive') if @column < 0
    throw new Error('column not on board') if @column > 7

  canAttack: (otherQueen) ->
    @row == otherQueen.row ||
    @column == otherQueen.column ||
    Math.abs(@row - otherQueen.row) == Math.abs(@column - otherQueen.column)

module.exports = QueenAttack
