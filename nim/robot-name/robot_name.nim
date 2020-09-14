import random, sets

randomize()

type
  Robot* = object
    name*: string

const NumberOfLetters = 2
const NumberOfDigits = 3

const Letters = 'A'..'Z'
const Digits = '0'..'9'

var usedNames = initHashSet[string]()

proc newName: string =
  for x in 0 ..< NumberOfLetters:
    result.add(rand(Letters))
  for x in 0 ..< NumberOfDigits:
    result.add(rand(Digits))

proc randomName: string =
  while true:
    result = newName()

    if result notin usedNames:
      usedNames.incl(result)
      break

proc makeRobot*: Robot =
  result.name = randomName()

proc reset*(robot: var Robot): void =
  robot.name = randomName()
