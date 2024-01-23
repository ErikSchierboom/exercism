class QueenAttack {
  construct new() {
    _white = [7, 3]
    _black = [0, 3]
  }

  construct new(pieces) {
    _white = pieces["white"] || [7, 3]
    _black = pieces["black"] || [0, 3]

    if (_white[0] < 0 || _white[0] > 7 || _white[1] < 0 || _white[1] > 7) Fiber.abort("Queen must be placed on the board")
    if (_black[0] < 0 || _black[0] > 7 || _black[1] < 0 || _black[1] > 7) Fiber.abort("Queen must be placed on the board")
    if (_white[0] == _black[0] && _white[1] == _black[1]) Fiber.abort("Queens cannot share the same space")
  }

  white { _white }
  black { _black }

  toString {
    return (0..7).map {|row|
      return (0..7).map {|col|
        if (_white[0] == row && _white[1] == col) return "W"
        if (_black[0] == row && _black[1] == col) return "B"
        return "_"
      }.join(" ")
    }.join("\n")
  }

  canAttack {
    return _white[0] == _black[0] || 
           _white[1] == _black[1] || 
           (_white[0] - _black[0]).abs == (_white[1] - _black[1]).abs
  }
}
