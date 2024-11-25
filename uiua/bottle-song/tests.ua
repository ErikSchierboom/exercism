~ "bottle-song.ua" ~ Recite

# First generic verse
Expected ← {
  "Ten green bottles hanging on the wall,"
  "Ten green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be nine green bottles hanging on the wall."
}
⍤⤙≍ Expected Recite 10 1

# Last generic verse
Expected ← {
  "Three green bottles hanging on the wall,"
  "Three green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be two green bottles hanging on the wall."
}
⍤⤙≍ Expected Recite 3 1

# Verse with 2 bottles
Expected ← {
  "Two green bottles hanging on the wall,"
  "Two green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be one green bottle hanging on the wall."
}
⍤⤙≍ Expected Recite 2 1

# Verse with 1 bottle
Expected ← {
  "One green bottle hanging on the wall,"
  "One green bottle hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be no green bottles hanging on the wall."
}
⍤⤙≍ Expected Recite 1 1

# First two verses
Expected ← {
  "Ten green bottles hanging on the wall,"
  "Ten green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be nine green bottles hanging on the wall."
  ""
  "Nine green bottles hanging on the wall,"
  "Nine green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be eight green bottles hanging on the wall."
}
⍤⤙≍ Expected Recite 10 2

# Last three verses
Expected ← {
  "Three green bottles hanging on the wall,"
  "Three green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be two green bottles hanging on the wall."
  ""
  "Two green bottles hanging on the wall,"
  "Two green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be one green bottle hanging on the wall."
  ""
  "One green bottle hanging on the wall,"
  "One green bottle hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be no green bottles hanging on the wall."
}
⍤⤙≍ Expected Recite 3 3

# All verses
Expected ← {
  "Ten green bottles hanging on the wall,"
  "Ten green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be nine green bottles hanging on the wall."
  ""
  "Nine green bottles hanging on the wall,"
  "Nine green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be eight green bottles hanging on the wall."
  ""
  "Eight green bottles hanging on the wall,"
  "Eight green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be seven green bottles hanging on the wall."
  ""
  "Seven green bottles hanging on the wall,"
  "Seven green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be six green bottles hanging on the wall."
  ""
  "Six green bottles hanging on the wall,"
  "Six green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be five green bottles hanging on the wall."
  ""
  "Five green bottles hanging on the wall,"
  "Five green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be four green bottles hanging on the wall."
  ""
  "Four green bottles hanging on the wall,"
  "Four green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be three green bottles hanging on the wall."
  ""
  "Three green bottles hanging on the wall,"
  "Three green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be two green bottles hanging on the wall."
  ""
  "Two green bottles hanging on the wall,"
  "Two green bottles hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be one green bottle hanging on the wall."
  ""
  "One green bottle hanging on the wall,"
  "One green bottle hanging on the wall,"
  "And if one green bottle should accidentally fall,"
  "There'll be no green bottles hanging on the wall."
}
⍤⤙≍ Expected Recite 10 10
