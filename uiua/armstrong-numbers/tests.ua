~ "armstrong-numbers.ua" ~ IsArmstrongNumber

# Zero is an Armstrong number
⍤⤙≍ 1 IsArmstrongNumber 0

# Single digit numbers are Armstrong numbers
⍤⤙≍ 1 IsArmstrongNumber 5

# There are no 2 digit Armstrong Numbers
⍤⤙≍ 0 IsArmstrongNumber 10

# Three digit number that is not an Armstrong number
⍤⤙≍ 0 IsArmstrongNumber 100

# Three digit number that is an Armstrong number
⍤⤙≍ 1 IsArmstrongNumber 153

# Four digit number that is an Armstrong number
⍤⤙≍ 1 IsArmstrongNumber 9474

# Four digit number that is not an Armstrong number
⍤⤙≍ 0 IsArmstrongNumber 9475

# Seven digit number that is not an Armstrong number
⍤⤙≍ 0 IsArmstrongNumber 9926314

# Seven digit number that is an Armstrong number
⍤⤙≍ 1 IsArmstrongNumber 9926315
