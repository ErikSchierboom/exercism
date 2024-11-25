~ "flatten-array.ua" ~ Flatten

# empty?
⍤⤙≍ [] Flatten {}

# no nesting?
⍤⤙≍ [0 1 2] Flatten {0 1 2}

# flattens a nested array?
⍤⤙≍ [] Flatten {{{}}}

# flattens array with just integers present?
⍤⤙≍ [1 2 3 4 5 6 7 8] Flatten {1 {2 3 4 5 6 7} 8}

# 5 level nesting?
⍤⤙≍ [0 2 2 3 8 100 4 50 ¯2] Flatten {0 2 {{2 3} 8 100 4 {{{50}}}} ¯2}

# 6 level nesting?
⍤⤙≍ [1 2 3 4 5 6 7 8] Flatten {1 {2 {{3}} {4 {{5}}} 6 7} 8}

# ∞ values are omitted from the final result?
⍤⤙≍ [1 2] Flatten {1 2 ∞}

# consecutive ∞ values at the front of the list are omitted from the final result?
⍤⤙≍ [3] Flatten {∞ ∞ 3}

# consecutive ∞ values in the middle of the list are omitted from the final result?
⍤⤙≍ [1 4] Flatten {1 ∞ ∞ 4}

# 6 level nest list with ∞ values?
⍤⤙≍ [0 2 2 3 8 100 ¯2] Flatten {0 2 {{2 3} 8 {{100}} ∞ {{∞}}} ¯2}

# all values in nested list are ∞?
⍤⤙≍ [] Flatten {∞ {{{∞}}} ∞ ∞ {{∞ ∞} ∞} ∞}
