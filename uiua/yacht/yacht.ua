Single         ← /+×⊸=
LittleStraight ← ⨬(0|30)≍1_2_3_4_5 ⍆
BigStraight    ← ⨬(0|30)≍2_3_4_5_6 ⍆
Yacht          ← ⨬(0|50)=1⧻◴
Choice         ← /+
FourOfAKind    ← ⨬(0|×4)⊸=⊃(⊡1|⊣)
FullHouse      ← ⨬(0|/+)∈ [0_0_0_1_1 0_0_1_1_1] ⊛⍆.

Score ← ⍣(
  Single 1 ⍤.≍"ones"
| Single 2 ⍤.≍"twos"
| Single 3 ⍤.≍"threes"
| Single 4 ⍤.≍"fours"
| Single 5 ⍤.≍"fives"
| Single 6 ⍤.≍"sixes"
| FullHouse ⍤.≍"full house"
| FourOfAKind ⍤.≍"four of a kind"
| LittleStraight ⍤.≍"little straight"
| BigStraight ⍤.≍"big straight"
| Yacht ⍤.≍"yacht"
| Choice ⍤.≍"choice"
) :
