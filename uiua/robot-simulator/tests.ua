~ "robot-simulator.ua" ~ Create Move

# at origin facing north
⍤⤙≍ {0 0 "north"} Create 0 0 "north"

# at negative position facing south
⍤⤙≍ {¯1 ¯1 "south"} Create ¯1 ¯1 "south"

# changes north to east
⍤⤙≍ {0 0 "east"} Move {0 0 "north"} "R"

# changes east to south
⍤⤙≍ {0 0 "south"} Move {0 0 "east"} "R"

# changes south to west
⍤⤙≍ {0 0 "west"} Move {0 0 "south"} "R"

# changes west to north
⍤⤙≍ {0 0 "north"} Move {0 0 "west"} "R"

# changes north to west
⍤⤙≍ {0 0 "west"} Move {0 0 "north"} "L"

# changes west to south
⍤⤙≍ {0 0 "south"} Move {0 0 "west"} "L"

# changes south to east
⍤⤙≍ {0 0 "east"} Move {0 0 "south"} "L"

# changes east to north
⍤⤙≍ {0 0 "north"} Move {0 0 "east"} "L"

# facing north increments Y
⍤⤙≍ {0 1 "north"} Move {0 0 "north"} "A"

# facing south decrements Y
⍤⤙≍ {0 ¯1 "south"} Move {0 0 "south"} "A"

# facing east increments X
⍤⤙≍ {1 0 "east"} Move {0 0 "east"} "A"

# facing west decrements X
⍤⤙≍ {¯1 0 "west"} Move {0 0 "west"} "A"

# moving east and north from README
⍤⤙≍ {9 4 "west"} Move {7 3 "north"} "RAALAL"

# moving west and north
⍤⤙≍ {¯4 1 "west"} Move {0 0 "north"} "LAAARALA"

# moving west and south
⍤⤙≍ {¯3 ¯8 "south"} Move {2 ¯7 "east"} "RRAAAAALA"

# moving east and north
⍤⤙≍ {11 5 "north"} Move {8 4 "south"} "LAAARRRALLLL"
