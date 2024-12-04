~ "crypto-square.ua" ~ Ciphertext

# empty plaintext results in an empty ciphertext
⍤⤙≍ "" Ciphertext ""

# normalization results in empty plaintext
⍤⤙≍ "" Ciphertext "... --- ..."

# Lowercase
⍤⤙≍ "a" Ciphertext "A"

# Remove spaces
⍤⤙≍ "b" Ciphertext "  b "

# Remove punctuation
⍤⤙≍ "1" Ciphertext "@1,%!"

# 9 character plaintext results in 3 chunks of 3 characters
⍤⤙≍ "tsf hiu isn" Ciphertext "This is fun!"

# 8 character plaintext results in 3 chunks, the last one with a trailing space
⍤⤙≍ "clu hlt io " Ciphertext "Chill out."

# 54 character plaintext results in 7 chunks, the last two with trailing spaces
⍤⤙≍ "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau " Ciphertext "If man was meant to stay on the ground, god would have given us roots."
