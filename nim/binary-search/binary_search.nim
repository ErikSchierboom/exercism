proc binarySearch*(a: openArray[int], val: int): int =
  var left = a.low
  var right = a.high

  while left <= right:
    let middle = (left + right) div 2
    if a[middle] < val:
      left = middle + 1
    elif a[middle] > val:
      right = middle - 1
    else:
      return middle

  -1
