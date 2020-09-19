import algorithm, bitops, sugar, tables

const EncodedAction = {
  0: (commands: var seq[string]) => commands.add("wink"),
  1: (commands: var seq[string]) => commands.add("double blink"),
  2: (commands: var seq[string]) => commands.add("close your eyes"),
  3: (commands: var seq[string]) => commands.add("jump"),
  4: (commands: var seq[string]) => commands.reverse
}.toTable

proc commands*(handshake: int): seq[string] =
  for bit, action in EncodedAction:
    if testBit(handshake, bit):
      action(result)
