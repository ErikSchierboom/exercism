import algorithm

proc latest*(scores: seq[int]): int =
  scores[^1]

proc personalBest*(scores: seq[int]): int =
  scores.sorted[^1]

proc personalTopThree*(scores: seq[int]): seq[int] =
  scores.sorted[^3.min(scores.len)..scores.high].reversed
