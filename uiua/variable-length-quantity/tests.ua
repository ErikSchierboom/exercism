~ "variable-length-quantity.ua" ~ Decode Encode

# Zero
# ⍤⤙≍ [0] Encode [0]

# Arbitrary single byte
⍤⤙≍ [64] Encode [64]

# Largest single byte
⍤⤙≍ [127] Encode [127]

# Smallest double byte
⍤⤙≍ [129 0] Encode [128]

# Arbitrary double byte
⍤⤙≍ [192 0] Encode [8192]

# Largest double byte
⍤⤙≍ [255 127] Encode [16383]

# Smallest triple byte
⍤⤙≍ [129 128 0] Encode [16384]

# Arbitrary triple byte
⍤⤙≍ [192 128 0] Encode [1048576]

# Largest triple byte
⍤⤙≍ [255 255 127] Encode [2097151]

# Smallest quadruple byte
⍤⤙≍ [129 128 128 0] Encode [2097152]

# Arbitrary quadruple byte
⍤⤙≍ [192 128 128 0] Encode [134217728]

# Largest quadruple byte
⍤⤙≍ [255 255 255 127] Encode [268435455]

# Smallest quintuple byte
⍤⤙≍ [129 128 128 128 0] Encode [268435456]

# Arbitrary quintuple byte
⍤⤙≍ [143 248 128 128 0] Encode [4278190080]

# Maximum 32-bit integer input
⍤⤙≍ [143 255 255 255 127] Encode [4294967295]

# Two single-byte values
⍤⤙≍ [64 127] Encode [64 127]

# Two multi-byte values
⍤⤙≍ [129 128 0 200 232 86] Encode [16384 1193046]

# Many multi-byte values
⍤⤙≍ [192 0 200 232 86 255 255 255 127 0 255 127 129 128 0] Encode [8192 1193046 268435455 0 16383 16384]

# One byte
⍤⤙≍ [127] Decode [127]

# Two bytes
⍤⤙≍ [8192] Decode [192 0]

# Three bytes
⍤⤙≍ [2097151] Decode [255 255 127]

# Four bytes
⍤⤙≍ [2097152] Decode [129 128 128 0]

# Maximum 32-bit integer
⍤⤙≍ [4294967295] Decode [143 255 255 255 127]

# Incomplete sequence causes error
⍤⤙≍ "incomplete sequence" ⍣(Decode [255])

# Incomplete sequence causes error, even if value is zero
⍤⤙≍ "incomplete sequence" ⍣(Decode [128])

# Multiple values
⍤⤙≍ [8192 1193046 268435455 0 16383 16384] Decode [192 0 200 232 86 255 255 255 127 0 255 127 129 128 0]
