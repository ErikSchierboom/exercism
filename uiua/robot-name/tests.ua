~ "robot-name.ua" ~ GenerateName

# Name has correct format
⍤⤙≍ 1 ±⧻♭ regex "^[A-Z]{2}\\d{3}$" GenerateName()

# Name is generated randomly
⍤⤙≍ 25 ⧻◴ [⍥GenerateName] 25
