Permutations ← ⧅≠⊸◇⧻

Colors        ← Permutations {"Red" "Green" "Ivory" "Yellow" "Blue"}
Nationalities ← Permutations {"Englishman" "Spaniard" "Ukrainian" "Japanese" "Norwegian"}
Pets          ← Permutations {"Dog" "Snails" "Fox" "Horse" "Zebra"}
Drinks        ← Permutations {"Coffee" "Tea" "Milk" "OrangeJuice" "Water"}
Hobbies       ← Permutations {"Dancing" "Painting" "Reading" "Football" "Chess"}

ValidColors ← /↥⌕ {"Ivory" "Green"}
ValidNationalities ← ↧↧⊃(
  =□"Norwegian"⊢⊢
| =⊃(⊗□"Englishman"⊡0|⊗□"Red"⊡1)
| =1⌵-⊃(⊗□"Norwegian"⊡0|⊗□"Blue"⊡1)
)
ValidPets ← =⊃(⊗□"Spaniard"⊡1|⊗□"Dog"⊡0)
ValidDrinks ← ↧↧⊃(
  =□"Milk"⊡2⊢
| =⊃(⊗□"Green"⊡3|⊗□"Coffee"⊡0)
| =⊃(⊗□"Ukrainian"⊡2|⊗□"Tea"⊡0)
)
ValidHobbies ← ↧↧↧↧↧⊃(
  =⊃(⊗□"Dancing"⊡0|⊗□"Snails"⊡2)
| =⊃(⊗□"Painting"⊡0|⊗□"Yellow"⊡4)
| =1⌵-⊃(⊗□"Reading"⊡0|⊗□"Fox"⊡2)
| =1⌵-⊃(⊗□"Painting"⊡0|⊗□"Horse"⊡2)
| =⊃(⊗□"Football"⊡0|⊗□"OrangeJuice"⊡1)
| =⊃(⊗□"Chess"⊡0|⊗□"Japanese"⊡3)
)

Solution ← (
  ▽⊸≡ValidColors Colors
  ▽⊸≡ValidNationalities /⊂⊞⊟ Nationalities
  ▽⊸≡ValidPets /⊂⊞⊂ Pets
  ▽⊸≡ValidDrinks /⊂⊞⊂ Drinks
  ▽⊸≡ValidHobbies /⊂⊞⊂ Hobbies
  ⊢
)

DrinksWater ← °□⊡⊃(⊗□"Water"⊡1|°□⊡3) Solution
OwnsZebra   ← °□⊡⊃(⊗□"Zebra"⊡2|°□⊡3) Solution
