import Foundation

class Squares {
  let squareOfSum: Int
  let sumOfSquares: Int
  let differenceOfSquares: Int

  init(_ n: Int) {
      squareOfSum = Int(pow(Double(n * (n + 1) / 2), 2))
      sumOfSquares = n * (n + 1) * (2 * n + 1) / 6
      differenceOfSquares = squareOfSum - sumOfSquares
  }  
}
