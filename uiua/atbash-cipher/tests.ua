~ "atbash-cipher.ua" ~ Decode Encode

# encode -> encode yes
⍤⤙≍ "bvh" Encode "yes"

# encode -> encode no
⍤⤙≍ "ml" Encode "no"

# encode -> encode OMG
⍤⤙≍ "lnt" Encode "OMG"

# encode -> encode spaces
⍤⤙≍ "lnt" Encode "O M G"

# encode -> encode mindblowingly
⍤⤙≍ "nrmwy oldrm tob" Encode "mindblowingly"

# encode -> encode numbers
⍤⤙≍ "gvhgr mt123 gvhgr mt" Encode "Testing,1 2 3, testing."

# encode -> encode deep thought
⍤⤙≍ "gifgs rhurx grlm" Encode "Truth is fiction." # 

# encode -> encode all the letters
⍤⤙≍ "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt" Encode "The quick brown fox jumps over the lazy dog."

# decode -> decode exercism
⍤⤙≍ "exercism" Decode "vcvix rhn"

# decode -> decode a sentence
⍤⤙≍ "anobstacleisoftenasteppingstone" Decode "zmlyh gzxov rhlug vmzhg vkkrm thglm v"

# decode -> decode numbers
⍤⤙≍ "testing123testing" Decode "gvhgr mt123 gvhgr mt"

# decode -> decode all the letters
⍤⤙≍ "thequickbrownfoxjumpsoverthelazydog" Decode "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"

# decode -> decode with too many spaces
⍤⤙≍ "exercism" Decode "vc vix    r hn"

# decode -> decode with no spaces
⍤⤙≍ "anobstacleisoftenasteppingstone" Decode "zmlyhgzxovrhlugvmzhgvkkrmthglmv"
