~ "queen-attack.ua" ~ Queen

# Queen must have positive row
⍤⤙≍ "invalid row" ⍣(Queen~New ¯2 2)

# Queen must have row on board
⍤⤙≍ "invalid row" ⍣(Queen~New 8 4)

# Queen must have positive column
⍤⤙≍ "invalid column" ⍣(Queen~New 2 ¯2)

# Queen must have column on board
⍤⤙≍ "invalid column" ⍣(Queen~New 4 8)

# Row of queen with a valid position
⍤⤙≍ 2 Queen~Row Queen~New 2 3

# Column of queen with a valid position
⍤⤙≍ 3 Queen~Column Queen~New 2 3

# Cannot attack
WhiteQueen ← Queen~New 2 4
BlackQueen ← Queen~New 6 6
⍤⤙≍ 0 Queen~CanAttack BlackQueen WhiteQueen

# Can attack on same row
WhiteQueen ← Queen~New 2 4
BlackQueen ← Queen~New 2 6
⍤⤙≍ 1 Queen~CanAttack BlackQueen WhiteQueen

# Can attack on same column
WhiteQueen ← Queen~New 4 5
BlackQueen ← Queen~New 2 5
⍤⤙≍ 1 Queen~CanAttack BlackQueen WhiteQueen

# Can attack on first diagonal
WhiteQueen ← Queen~New 2 2
BlackQueen ← Queen~New 0 4
⍤⤙≍ 1 Queen~CanAttack BlackQueen WhiteQueen

# Can attack on second diagonal
WhiteQueen ← Queen~New 2 2
BlackQueen ← Queen~New 3 1
⍤⤙≍ 1 Queen~CanAttack BlackQueen WhiteQueen

# Can attack on third diagonal
WhiteQueen ← Queen~New 2 2
BlackQueen ← Queen~New 1 1
⍤⤙≍ 1 Queen~CanAttack BlackQueen WhiteQueen

# Can attack on fourth diagonal
WhiteQueen ← Queen~New 1 7
BlackQueen ← Queen~New 0 6
⍤⤙≍ 1 Queen~CanAttack BlackQueen WhiteQueen

# Cannot attack if falling diagonals are only the same when reflected across the longest falling diagonal
WhiteQueen ← Queen~New 4 1
BlackQueen ← Queen~New 2 5
⍤⤙≍ 0 Queen~CanAttack BlackQueen WhiteQueen
