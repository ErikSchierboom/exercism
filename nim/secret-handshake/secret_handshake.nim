import algorithm, bitops

const lookup = block:
  func toCommands(handshake: int): seq[string] =
    if testBit(handshake, 0): result.add("wink")
    if testBit(handshake, 1): result.add("double blink")
    if testBit(handshake, 2): result.add("close your eyes")
    if testBit(handshake, 3): result.add("jump")
    if testBit(handshake, 4): result.reverse

  func genLookup(): array[32, seq[string]] =
    for i in result.low..result.high:
      result[i] = i.toCommands()

  genLookup()

func commands*(handshake: int): seq[string] =
  lookup[handshake mod lookup.len]
