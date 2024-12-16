~ "phone-number.ua" ~ Clean

# Cleans the number
⍤⤙≍ "2234567890" Clean "(223) 456-7890"

# Cleans numbers with dots
⍤⤙≍ "2234567890" Clean "223.456.7890"

# Cleans numbers with multiple spaces
⍤⤙≍ "2234567890" Clean "223 456   7890   "

# Invalid when 9 digits
⍤⤙≍ "invalid length" ⍣(Clean "123456789")

# Invalid when 11 digits does not start with a 1
⍤⤙≍ "invalid country code" ⍣(Clean "22234567890")

# Valid when 11 digits and starting with 1
⍤⤙≍ "2234567890" Clean "12234567890"

# Valid when 11 digits and starting with 1 even with punctuation
⍤⤙≍ "2234567890" Clean "+1 (223) 456-7890"

# Invalid when more than 11 digits
⍤⤙≍ "invalid length" ⍣(Clean "321234567890")

# Invalid with letters
⍤⤙≍ "invalid character" ⍣(Clean "523-abc-7890")

# Invalid with punctuations
⍤⤙≍ "invalid character" ⍣(Clean "523-@:!-7890")

# Invalid if area code starts with 0
⍤⤙≍ "invalid area code" ⍣(Clean "(023) 456-7890")

# Invalid if area code starts with 1
⍤⤙≍ "invalid area code" ⍣(Clean "(123) 456-7890")

# Invalid if exchange code starts with 0
⍤⤙≍ "invalid exchange code" ⍣(Clean "(223) 056-7890")

# Invalid if exchange code starts with 1
⍤⤙≍ "invalid exchange code" ⍣(Clean "(223) 156-7890")

# Invalid if area code starts with 0 on valid 11-digit number
⍤⤙≍ "invalid area code" ⍣(Clean "1 (023) 456-7890")

# Invalid if area code starts with 1 on valid 11-digit number
⍤⤙≍ "invalid area code" ⍣(Clean "1 (123) 456-7890")

# Invalid if exchange code starts with 0 on valid 11-digit number
⍤⤙≍ "invalid exchange code" ⍣(Clean "1 (223) 056-7890")

# Invalid if exchange code starts with 1 on valid 11-digit number
⍤⤙≍ "invalid exchange code" ⍣(Clean "1 (223) 156-7890")
