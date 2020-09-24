import sequtils

type
  ResistorColor* = enum
    Black, Brown, Red, Orange, Yellow,
    Green, Blue, Violet, Grey, White

proc colorCode*(color: ResistorColor): int = color.ord

proc colors*(): seq[ResistorColor] = toSeq(ResistorColor.items)
