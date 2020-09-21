import strformat

iterator wordPairs(words: seq[string]): (string, string) =
  for i in 0 ..< words.len - 1:
    yield(words[i], words[i + 1])

proc recite*(words: seq[string]): string =
  if words.len == 0:
    return

  for first, second in words.wordPairs:
    result.add(&"For want of a {first} the {second} was lost.\n")

  result.add(&"And all for the want of a {words[0]}.")
