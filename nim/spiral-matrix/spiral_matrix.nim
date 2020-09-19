proc spiral*(size: static[int]): array[size, array[size, int]] =
  var rowOffset = 0
  var columnOffset = 0

  var totalNumbers = size * size
  var currentNumber = 1

  while currentNumber <= totalNumbers:
    for topColumn in columnOffset ..< size - columnOffset:
      result[rowOffset][topColumn] = currentNumber
      currentNumber.inc
    
    for rightRow in rowOffset + 1 ..< size - rowOffset:
      result[rightRow][size - columnOffset - 1] = currentNumber
      currentNumber.inc

    for bottomColumn in countdown(size - columnOffset - 2, columnOffset):
      result[size - rowOffset - 1][ bottomColumn] = currentNumber
      currentNumber.inc
    
    for leftRow in countDown(size - rowOffset - 2, rowOffset + 1):
      result[leftRow][columnOffset] = currentNumber
      currentNumber.inc

    rowOffset.inc
    columnOffset.inc
