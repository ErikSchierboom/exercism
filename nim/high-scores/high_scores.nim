import algorithm

proc latest*(scores: seq[int]): int =
  scores[^1]

proc personalBest*(scores: seq[int]): int =
  scores.max

proc personalTopThree*(scores: seq[int]): seq[int] =
  scores.sorted.reversed[0 ..< 3.min(scores.len)]
