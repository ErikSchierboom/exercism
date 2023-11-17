class PascalsTriangle
  rows: (num) ->
    return [] if num == 0

    this.row n for n in [1..num]

  row: (n) ->
    values = [1]
    x = 1;

    for j in [1...n]
      x = x * (n - j) / j
      values.push(x)

    values

module.exports = PascalsTriangle
