~ "diffie-hellman.ua" ~ GeneratePrivateKey PublicKey Secret

# Private key is greater than 1 and less than p
P ← 7919
⍤⤙≍ 1 /××⊃(≥2|<P) [⍥(GeneratePrivateKey P) 1000]

# Private key is random
P ← 7919
⍤⤙≍ 1 >100 ⧻◴ [⍥(GeneratePrivateKey P) 1000]

# Can calculate public key using private key
P          ← 23
G          ← 5
PrivateKey ← 6
⍤⤙≍ 8 PublicKey P G PrivateKey

# Can calculate public key when given a different private key
P          ← 23
G          ← 5
PrivateKey ← 15
⍤⤙≍ 19 PublicKey P G PrivateKey

# Can calculate secret using other party's public key
P              ← 23
TheirPublicKey ← 19
MyPrivateKey   ← 6
⍤⤙≍ 2 Secret P TheirPublicKey MyPrivateKey

# Key exchange
P               ← 7919
G               ← 1553
AlicePrivateKey ← GeneratePrivateKey P
AlicePublicKey  ← PublicKey P G AlicePrivateKey
BobPrivateKey   ← GeneratePrivateKey P
BobPublicKey    ← PublicKey P G BobPrivateKey
SecretA         ← Secret P BobPublicKey AlicePrivateKey
SecretB         ← Secret P AlicePublicKey BobPrivateKey
⍤⤙≍ SecretB SecretA
