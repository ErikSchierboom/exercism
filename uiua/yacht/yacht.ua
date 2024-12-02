Categories ← {"ones" "twos" "threes" "fours" "fives" "sixes" "full house" "four of a kind" "little straight" "big straight" "yacht" "choice"}

Single         ← /+×⊸=
LittleStraight ← ⨬(0|30)≍1_2_3_4_5 ⍆
BigStraight    ← ⨬(0|30)≍2_3_4_5_6 ⍆
Yacht          ← ⨬(0|50)=1⧻◴
Choice         ← /+
FourOfAKind    ← ⨬(0|×4)⊸=⊃(⊡1|⊣)
FullHouse      ← ⨬(0|/+)∈ [0_0_0_1_1 0_0_1_1_1] ⊛⍆.

Score ← ⨬(
  Single 1
| Single 2
| Single 3
| Single 4
| Single 5
| Single 6
| FullHouse
| FourOfAKind
| LittleStraight
| BigStraight
| Yacht
| Choice
) (⊗ : Categories □) :
