Permutations  ← ⧅≠∞
Colors        ← Permutations {"Red" "Green" "Ivory" "Yellow" "Blue"}
Nationalities ← Permutations {"Englishman" "Spaniard" "Ukrainian" "Japanese" "Norwegian"}
Drinks        ← Permutations {"Coffee" "Tea" "Milk" "OrangeJuice" "Water"}
Hobbies       ← Permutations {"Dancing" "Painting" "Reading" "Football" "Chess"}
Pets          ← Permutations {"Dog" "Snails" "Fox" "Horse" "Zebra"}

Solution ← (
  Colors
  ▽⊸≡(/↥⌕ {"Ivory" "Green"}) # 6
  ▽⊸≡(=1˜⊗□"Blue")           # 15

  Nationalities
  ▽⊸≡(=0˜⊗□"Norwegian") # 10
  /⊂⊞⊟
  ▽⊸≡(=⊃(˜⊗□"Englishman"⊡0|˜⊗□"Red"⊡1)) # 2

  Drinks
  ▽⊸≡(=2˜⊗□"Milk") # 9
  /⊂⊞⊂
  ▽⊸≡(=⊃(˜⊗□"Green"⊡2|˜⊗□"Coffee"⊡0))  # 4
  ▽⊸≡(=⊃(˜⊗□"Ukrainian"⊡1|˜⊗□"Tea"⊡0)) # 5

  Hobbies
  /⊂⊞⊂
  ▽⊸≡(=⊃(˜⊗□"Yellow"⊡3|˜⊗□"Painting"⊡0))      # 8
  ▽⊸≡(=⊃(˜⊗□"OrangeJuice"⊡1|˜⊗□"Football"⊡0)) # 13
  ▽⊸≡(=⊃(˜⊗□"Japanese"⊡2|˜⊗□"Chess"⊡0))       # 14

  Pets
  /⊂⊞⊂
  ▽⊸≡(=⊃(˜⊗□"Spaniard"⊡3|˜⊗□"Dog"⊡0))      # 3
  ▽⊸≡(=1⌵-⊃(˜⊗□"Painting"⊡1|˜⊗□"Horse"⊡0)) # 12
  ▽⊸≡(=⊃(˜⊗□"Dancing"⊡1|˜⊗□"Snails"⊡0))    # 7
  ▽⊸≡(=1⌵-⊃(˜⊗□"Reading"⊡1|˜⊗□"Fox"⊡0))    # 11

  ⊢
)

DrinksWater ← °□⊡⊂3⊸(˜⊗□"Water"⊡2) Solution
OwnsZebra   ← °□⊡⊂3⊸(˜⊗□"Zebra"⊡0) Solution
