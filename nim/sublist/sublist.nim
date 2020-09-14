type
  ListComparison* = enum
    Unequal, Equal, Sublist, Superlist

iterator sublists(list: openArray[int], len: int): seq[int] =
  for i in 0..list.len - len:
    yield list[i..i + len - 1]

proc isSublistOf(listA: openArray[int], listB: openArray[int]): bool =
  for sublistB in listB.sublists(listA.len):
    if sublistB == listA:
      return true

proc sublist*(listA: openArray[int], listB: openArray[int]): ListComparison =
  if listA == listB: Equal
  elif listA.isSublistOf(listB): Sublist
  elif listB.isSublistOf(listA): Superlist
  else: Unequal
