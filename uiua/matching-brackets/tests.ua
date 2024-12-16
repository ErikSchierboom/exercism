~ "matching-brackets.ua" ~ IsPaired

# paired square brackets
⍤⤙≍ 1 IsPaired "[]"

# empty string
⍤⤙≍ 1 IsPaired ""

# unpaired brackets
⍤⤙≍ 0 IsPaired "[["

# wrong ordered brackets
⍤⤙≍ 0 IsPaired "}{"

# wrong closing bracket
⍤⤙≍ 0 IsPaired "{]"

# paired with whitespace
⍤⤙≍ 1 IsPaired "{ }"

# partially paired brackets
⍤⤙≍ 0 IsPaired "{[])"

# simple nested brackets
⍤⤙≍ 1 IsPaired "{[]}"

# several paired brackets
⍤⤙≍ 1 IsPaired "{}[]"

# paired and nested brackets
⍤⤙≍ 1 IsPaired "([{}({}[])])"

# unopened closing brackets
⍤⤙≍ 0 IsPaired "{[)][]}"

# unpaired and nested brackets
⍤⤙≍ 0 IsPaired "([{])"

# paired and wrong nested brackets
⍤⤙≍ 0 IsPaired "[({]})"

# paired and wrong nested brackets but innermost are correct
⍤⤙≍ 0 IsPaired "[({}])"

# paired and incomplete brackets
⍤⤙≍ 0 IsPaired "{}["

# too many closing brackets
⍤⤙≍ 0 IsPaired "[]]"

# early unexpected brackets
⍤⤙≍ 0 IsPaired ")()"

# early mismatched brackets
⍤⤙≍ 0 IsPaired "{)()"

# math expression
⍤⤙≍ 1 IsPaired "(((185 + 223.85) * 15) - 543)/2"

# complex latex expression
⍤⤙≍ 1 IsPaired "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"
