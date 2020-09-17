import math

type
  ResistorColor* = enum
    Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White

proc value(colors: openArray[ResistorColor]): int =
  (colors[0].ord * 10 + colors[1].ord) * (10 ^ colors[2].ord)

proc label*(colors: openArray[ResistorColor]): (int, string) =
  let val = value(colors)
  if val >= 1000:
    (val div 1000, "kiloohms")
  else:
    (val, "ohms")
