~ "simple-cipher.ua" ~ Decode Encode RandomKey

# Substitution cipher - Can encode
⍤⤙≍ "abcdefghij" Encode "abcdefghij" "aaaaaaaaaa"

# Substitution cipher - Can decode
⍤⤙≍ "aaaaaaaaaa" Decode "abcdefghij" "abcdefghij"

# Substitution cipher - Is reversible. I.e., if you apply decode in a encoded result, you must see the same plaintext encode parameter as a result of the decode method
Key ← "abcdefghij"
⍤⤙≍ "abcdefghij" Decode Key Encode "abcdefghij" Key

# Substitution cipher - Can double shift encode
⍤⤙≍ "qayaeaagaciai" Encode "iamapandabear" "iamapandabear"

# Substitution cipher - Can wrap on encode
⍤⤙≍ "zabcdefghi" Encode "abcdefghij" "zzzzzzzzzz"

# Substitution cipher - Can wrap on decode
⍤⤙≍ "zzzzzzzzzz" Decode "abcdefghij" "zabcdefghi"

# Substitution cipher - Can encode messages longer than the key
⍤⤙≍ "iboaqcnecbfcr" Encode "abc" "iamapandabear"

# Substitution cipher - Can decode messages longer than the key
⍤⤙≍ "iamapandabear" Decode "abc" "iboaqcnecbfcr"

# Random key cipher - Can encode
Key ← RandomKey()
⍤⤙≍ ↙ 10 Key Encode Key "aaaaaaaaaa"

# Random key cipher - Can decode
Key ← RandomKey()
⍤⤙≍ "aaaaaaaaaa" Decode ⟜(↙10) Key

# Random key cipher - Is reversible. I.e., if you apply decode in a encoded result, you must see the same plaintext encode parameter as a result of the decode method
Key ← RandomKey()
⍤⤙≍ "abcdefghij" Decode Key Encode Key "abcdefghij"

# Random key cipher - Key is made only of lowercase letters
⍤⤙≍ 1 ±⧻♭ regex "^[a-z]{100,}$" RandomKey()
