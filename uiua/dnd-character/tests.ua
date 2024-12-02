~ "dnd-character.ua" ~ Ability Character Charisma Constitution Dexterity Hitpoints Intelligence Modifier Modifier Strength Wisdom

# ability modifier for score 3 is -4
⍤⤙= ¯4 Modifier 3

# ability modifier for score 4 is -3
⍤⤙= ¯3 Modifier 4

# ability modifier for score 5 is -3
⍤⤙= ¯3 Modifier 5

# ability modifier for score 6 is -2
⍤⤙= ¯2 Modifier 6

# ability modifier for score 7 is -2
⍤⤙= ¯2 Modifier 7

# ability modifier for score 8 is -1
⍤⤙= ¯1 Modifier 8

# ability modifier for score 9 is -1
⍤⤙= ¯1 Modifier 9

# ability modifier for score 10 is 0
⍤⤙= 0 Modifier 10

# ability modifier for score 11 is 0
⍤⤙= 0 Modifier 11

# ability modifier for score 12 is +1
⍤⤙= 1 Modifier 12

# ability modifier for score 13 is +1
⍤⤙= 1 Modifier 13

# ability modifier for score 14 is +2
⍤⤙= 2 Modifier 14

# ability modifier for score 15 is +2
⍤⤙= 2 Modifier 15

# ability modifier for score 16 is +3
⍤⤙= 3 Modifier 16

# ability modifier for score 17 is +3
⍤⤙= 3 Modifier 17

# ability modifier for score 18 is +4
⍤⤙= 4 Modifier 18

# random ability is within range
⍤⤙×≥3:⊸≤18 Ability

# random character is valid
SomeCharacter ← Character
⍤⤙×≥3:⊸≤18 Strength SomeCharacter
⍤⤙×≥3:⊸≤18 Dexterity SomeCharacter
⍤⤙×≥3:⊸≤18 Constitution SomeCharacter
⍤⤙×≥3:⊸≤18 Intelligence SomeCharacter
⍤⤙×≥3:⊸≤18 Wisdom SomeCharacter
⍤⤙×≥3:⊸≤18 Charisma SomeCharacter
⍤⤙×≥3:⊸≤18 Strength SomeCharacter
⍤⤙= +10 Modifier Constitution ⟜Hitpoints SomeCharacter

# Expected values were changed to cover all character abilities"
AnotherCharacter ← Character
⍤⤙= Strength ⟜Strength AnotherCharacter
⍤⤙= Dexterity ⟜Dexterity AnotherCharacter
⍤⤙= Constitution ⟜Constitution AnotherCharacter
⍤⤙= Intelligence ⟜Intelligence AnotherCharacter
⍤⤙= Wisdom ⟜Wisdom AnotherCharacter
⍤⤙= Charisma ⟜Charisma AnotherCharacter
⍤⤙= Strength ⟜Strength AnotherCharacter

# Additional tests to check for some randomness

# Check if Ability is returning valid results, 100 times
⍤⤙=1/= ×≥3:⊸≤18 ⍥(⊂Ability) 100 []

# Check if Ability is returning at least 2 different values when called 100 times
⍤⤙>1⧻◴⍥(⊂Ability) 100 []

# Check if Character is returning at least 2 different Characters when called 100 times
⍤⤙>1⧻◴⍥(⊂Character) 100 []
