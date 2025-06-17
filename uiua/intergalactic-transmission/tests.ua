~ "intergalactic-transmission.ua" ~ DecodeMessage TransmitSequence

# empty message
Message  ← []
Expected ← []
⍤⤙≍ Expected TransmitSequence Message

# 0x00 is transmitted as 0x0000
Message  ← [0]
Expected ← [0 0]
⍤⤙≍ Expected TransmitSequence Message

# 0x02 is transmitted as 0x0300
Message  ← [2]
Expected ← [3 0]
⍤⤙≍ Expected TransmitSequence Message

# 0x06 is transmitted as 0x0600
Message  ← [6]
Expected ← [6 0]
⍤⤙≍ Expected TransmitSequence Message

# 0x05 is transmitted as 0x0581
Message  ← [5]
Expected ← [5 129]
⍤⤙≍ Expected TransmitSequence Message

# 0x29 is transmitted as 0x2881
Message  ← [41]
Expected ← [40 129]
⍤⤙≍ Expected TransmitSequence Message

# 0xc001c0de is transmitted as 0xc000711be1
Message  ← [192 1 192 222]
Expected ← [192 0 113 27 225]
⍤⤙≍ Expected TransmitSequence Message

# six byte message
Message  ← [71 114 101 97 116 33]
Expected ← [71 184 153 172 23 160 132]
⍤⤙≍ Expected TransmitSequence Message

# seven byte message
Message  ← [71 114 101 97 116 49 33]
Expected ← [71 184 153 172 23 160 197 66]
⍤⤙≍ Expected TransmitSequence Message

# eight byte message
Message  ← [192 1 19 55 192 222 33 33]
Expected ← [192 0 68 102 125 6 120 66 33 129]
⍤⤙≍ Expected TransmitSequence Message

# twenty byte message
Message  ← [69 120 101 114 99 105 115 109 32 105 115 32 97 119 101 115 111 109 101 33]
Expected ← [68 189 24 175 39 27 165 231 108 144 27 46 51 3 132 238 101 184 219 237 215 40 132]
⍤⤙≍ Expected TransmitSequence Message

# empty message
Message  ← []
Expected ← []
⍤⤙≍ Expected DecodeMessage Message

# zero message
Message  ← [0 0]
Expected ← [0]
⍤⤙≍ Expected DecodeMessage Message

# 0x0300 is decoded to 0x02
Message  ← [3 0]
Expected ← [2]
⍤⤙≍ Expected DecodeMessage Message

# 0x0581 is decoded to 0x05
Message  ← [5 129]
Expected ← [5]
⍤⤙≍ Expected DecodeMessage Message

# 0x2881 is decoded to 0x29
Message  ← [40 129]
Expected ← [41]
⍤⤙≍ Expected DecodeMessage Message

# first byte has wrong parity
Message ← [7 0]
⍤⤙≍ "wrong parity" ⍣(DecodeMessage Message)

# second byte has wrong parity
Message ← [3 104]
⍤⤙≍ "wrong parity" ⍣(DecodeMessage Message)

# 0xcf4b00 is decoded to 0xce94
Message  ← [207 75 0]
Expected ← [206 148]
⍤⤙≍ Expected DecodeMessage Message

# 0xe2566500 is decoded to 0xe2ad90
Message  ← [226 86 101 0]
Expected ← [226 173 144]
⍤⤙≍ Expected DecodeMessage Message

# six byte message
Message  ← [71 184 153 172 23 160 132]
Expected ← [71 114 101 97 116 33]
⍤⤙≍ Expected DecodeMessage Message

# seven byte message
Message  ← [71 184 153 172 23 160 197 66]
Expected ← [71 114 101 97 116 49 33]
⍤⤙≍ Expected DecodeMessage Message

# last byte has wrong parity
Message ← [71 184 153 172 23 160 197 67]
⍤⤙≍ "wrong parity" ⍣(DecodeMessage Message)

# eight byte message
Message  ← [192 0 68 102 125 6 120 66 33 129]
Expected ← [192 1 19 55 192 222 33 33]
⍤⤙≍ Expected DecodeMessage Message

# twenty byte message
Message  ← [68 189 24 175 39 27 165 231 108 144 27 46 51 3 132 238 101 184 219 237 215 40 132]
Expected ← [69 120 101 114 99 105 115 109 32 105 115 32 97 119 101 115 111 109 101 33]
⍤⤙≍ Expected DecodeMessage Message

# wrong parity on 16th byte
Message ← [68 189 24 175 39 27 165 231 108 144 27 46 51 3 132 239 101 184 219 237 215 40 132]
⍤⤙≍ "wrong parity" ⍣(DecodeMessage Message)
