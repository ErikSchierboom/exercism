~ "strain.ua" ~ Discard! Keep!

# keep on empty list returns empty list
⍤⤙≍ [] Keep!(<0) []

# keeps everything
⍤⤙≍ [1 3 5] Keep!(<0) [1 3 5]

# keeps nothing
⍤⤙≍ [] Keep!(>0) [1 3 5]

# keeps first and last
⍤⤙≍ [1 3] Keep!(=0◿2) [1 2 3]

# keeps neither first nor last
⍤⤙≍ [2] Keep!(=1◿2)[1 2 3]

# discard ⟜empty list returns empty list?
⍤⤙≍ [] Discard!(<0)[]

# discards everything?
⍤⤙≍ [] Discard!(<0)[1 3 5]

# discards nothing?
⍤⤙≍ [1 3 5] Discard!(>0)[1 3 5]

# discards first and last?
⍤⤙≍ [2] Discard!(=0◿2)[1 2 3]

# discards neither first nor last?
⍤⤙≍ [1 3] Discard!(=1◿2)[1 2 3]
