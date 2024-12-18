~ "clock.ua" ~ Clock

# On the hour
Clock₁ ← Clock~New 8 0
⍤⤙≍ "08:00" Clock~Display Clock₁

# Past the hour
Clock₁ ← Clock~New 11 9
⍤⤙≍ "11:09" Clock~Display Clock₁

# Midnight is zero hours
Clock₁ ← Clock~New 24 0
⍤⤙≍ "00:00" Clock~Display Clock₁

# Hour rolls over
Clock₁ ← Clock~New 25 0
⍤⤙≍ "01:00" Clock~Display Clock₁

# Hour rolls over continuously
Clock₁ ← Clock~New 100 0
⍤⤙≍ "04:00" Clock~Display Clock₁

# Sixty minutes is next hour
Clock₁ ← Clock~New 1 60
⍤⤙≍ "02:00" Clock~Display Clock₁

# Minutes roll over
Clock₁ ← Clock~New 0 160
⍤⤙≍ "02:40" Clock~Display Clock₁

# Minutes roll over continuously
Clock₁ ← Clock~New 0 1723
⍤⤙≍ "04:43" Clock~Display Clock₁

# Hour and minutes roll over
Clock₁ ← Clock~New 25 160
⍤⤙≍ "03:40" Clock~Display Clock₁

# Hour and minutes roll over continuously
Clock₁ ← Clock~New 201 3001
⍤⤙≍ "11:01" Clock~Display Clock₁

# Hour and minutes roll over to exactly midnight
Clock₁ ← Clock~New 72 8640
⍤⤙≍ "00:00" Clock~Display Clock₁

# Negative hour
Clock₁ ← Clock~New ¯1 15
⍤⤙≍ "23:15" Clock~Display Clock₁

# Negative hour rolls over
Clock₁ ← Clock~New ¯25 0
⍤⤙≍ "23:00" Clock~Display Clock₁

# Negative hour rolls over continuously
Clock₁ ← Clock~New ¯91 0
⍤⤙≍ "05:00" Clock~Display Clock₁

# Negative minutes
Clock₁ ← Clock~New 1 ¯40
⍤⤙≍ "00:20" Clock~Display Clock₁

# Negative minutes roll over
Clock₁ ← Clock~New 1 ¯160
⍤⤙≍ "22:20" Clock~Display Clock₁

# Negative minutes roll over continuously
Clock₁ ← Clock~New 1 ¯4820
⍤⤙≍ "16:40" Clock~Display Clock₁

# Negative sixty minutes is previous hour
Clock₁ ← Clock~New 2 ¯60
⍤⤙≍ "01:00" Clock~Display Clock₁

# Negative hour and minutes both roll over
Clock₁ ← Clock~New ¯25 ¯160
⍤⤙≍ "20:20" Clock~Display Clock₁

# Negative hour and minutes both roll over continuously
Clock₁ ← Clock~New ¯121 ¯5810
⍤⤙≍ "22:10" Clock~Display Clock₁

# Add minutes
Clock₁ ← Clock~New 10 0
⍤⤙≍ "10:03" Clock~Display Clock~Add 3 Clock₁

# Add no minutes
Clock₁ ← Clock~New 6 41
⍤⤙≍ "06:41" Clock~Display Clock~Add 0 Clock₁

# Add to next hour
Clock₁ ← Clock~New 0 45
⍤⤙≍ "01:25" Clock~Display Clock~Add 40 Clock₁

# Add more than one hour
Clock₁ ← Clock~New 10 0
⍤⤙≍ "11:01" Clock~Display Clock~Add 61 Clock₁

# Add more than two hours with carry
Clock₁ ← Clock~New 0 45
⍤⤙≍ "03:25" Clock~Display Clock~Add 160 Clock₁

# Add across midnight
Clock₁ ← Clock~New 23 59
⍤⤙≍ "00:01" Clock~Display Clock~Add 2 Clock₁

# Add more than one day (1500 min = 25 hrs)
Clock₁ ← Clock~New 5 32
⍤⤙≍ "06:32" Clock~Display Clock~Add 1500 Clock₁

# Add more than two days
Clock₁ ← Clock~New 1 1
⍤⤙≍ "11:21" Clock~Display Clock~Add 3500 Clock₁

# Subtract minutes
Clock₁ ← Clock~New 10 3
⍤⤙≍ "10:00" Clock~Display Clock~Sub 3 Clock₁

# Subtract to previous hour
Clock₁ ← Clock~New 10 3
⍤⤙≍ "09:33" Clock~Display Clock~Sub 30 Clock₁

# Subtract more than an hour
Clock₁ ← Clock~New 10 3
⍤⤙≍ "08:53" Clock~Display Clock~Sub 70 Clock₁

# Subtract across midnight
Clock₁ ← Clock~New 0 3
⍤⤙≍ "23:59" Clock~Display Clock~Sub 4 Clock₁

# Subtract more than two hours
Clock₁ ← Clock~New 0 0
⍤⤙≍ "21:20" Clock~Display Clock~Sub 160 Clock₁

# Subtract more than two hours with borrow
Clock₁ ← Clock~New 6 15
⍤⤙≍ "03:35" Clock~Display Clock~Sub 160 Clock₁

# Subtract more than one day (1500 min = 25 hrs)
Clock₁ ← Clock~New 5 32
⍤⤙≍ "04:32" Clock~Display Clock~Sub 1500 Clock₁

# Subtract more than two days
Clock₁ ← Clock~New 2 20
⍤⤙≍ "00:20" Clock~Display Clock~Sub 3000 Clock₁

# Clocks with same time
Clock₁ ← Clock~New 15 37
Clock₂ ← Clock~New 15 37
⍤⤙≍ 1 = Clock₁ Clock₂

# Clocks a minute apart
Clock₁ ← Clock~New 15 36
Clock₂ ← Clock~New 15 37
⍤⤙≍ 0 = Clock₁ Clock₂

# Clocks an hour apart
Clock₁ ← Clock~New 14 37
Clock₂ ← Clock~New 15 37
⍤⤙≍ 0 = Clock₁ Clock₂

# Clocks with hour overflow
Clock₁ ← Clock~New 10 37
Clock₂ ← Clock~New 34 37
⍤⤙≍ 1 = Clock₁ Clock₂

# Clocks with hour overflow by several days
Clock₁ ← Clock~New 3 11
Clock₂ ← Clock~New 99 11
⍤⤙≍ 1 = Clock₁ Clock₂

# Clocks with negative hour
Clock₁ ← Clock~New 22 40
Clock₂ ← Clock~New ¯2 40
⍤⤙≍ 1 = Clock₁ Clock₂

# Clocks with negative hour that wraps
Clock₁ ← Clock~New 17 3
Clock₂ ← Clock~New ¯31 3
⍤⤙≍ 1 = Clock₁ Clock₂

# Clocks with negative hour that wraps multiple times
Clock₁ ← Clock~New 13 49
Clock₂ ← Clock~New ¯83 49
⍤⤙≍ 1 = Clock₁ Clock₂

# Clocks with minute overflow
Clock₁ ← Clock~New 0 1
Clock₂ ← Clock~New 0 1441
⍤⤙≍ 1 = Clock₁ Clock₂

# Clocks with minute overflow by several days
Clock₁ ← Clock~New 2 2
Clock₂ ← Clock~New 2 4322
⍤⤙≍ 1 = Clock₁ Clock₂

# Clocks with negative minute
Clock₁ ← Clock~New 2 40
Clock₂ ← Clock~New 3 ¯20
⍤⤙≍ 1 = Clock₁ Clock₂

# Clocks with negative minute that wraps
Clock₁ ← Clock~New 4 10
Clock₂ ← Clock~New 5 ¯1490
⍤⤙≍ 1 = Clock₁ Clock₂

# Clocks with negative minute that wraps multiple times
Clock₁ ← Clock~New 6 15
Clock₂ ← Clock~New 6 ¯4305
⍤⤙≍ 1 = Clock₁ Clock₂

# Clocks with negative hours and minutes
Clock₁ ← Clock~New 7 32
Clock₂ ← Clock~New ¯12 ¯268
⍤⤙≍ 1 = Clock₁ Clock₂

# Clocks with negative hours and minutes that wrap
Clock₁ ← Clock~New 18 7
Clock₂ ← Clock~New ¯54 ¯11513
⍤⤙≍ 1 = Clock₁ Clock₂

# Full clock and zeroed Clock₁
Clock₁ ← Clock~New 24 0
Clock₂ ← Clock~New 0 0
⍤⤙≍ 1 = Clock₁ Clock₂
