import algorithm, bitops

type
  Action* = enum
    Wink, DoubleBlink, CloseEyes, Jump

const lookup = block:
  func toCommands(handshake: int): seq[Action] =
    if handshake.testBit(0): result.add(Wink)
    if handshake.testBit(1): result.add(DoubleBlink)
    if handshake.testBit(2): result.add(CloseEyes)
    if handshake.testBit(3): result.add(Jump)
    if handshake.testBit(4): result.reverse

  func genLookup(): array[32, seq[Action]] =
    for i in result.low..result.high:
      result[i] = i.toCommands()

  genLookup()

func commands*(handshake: int): seq[Action] =
  lookup[handshake mod lookup.len]
