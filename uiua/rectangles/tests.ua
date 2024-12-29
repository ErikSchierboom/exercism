~ "rectangles.ua" ~ Rectangles

# No rectangles
Grid ← $  
⍤⤙≍ 0 Rectangles Grid

# One rectangle
Grid ← $ +-+
       $ | |
       $ +-+
⍤⤙≍ 1 Rectangles Grid

# Two rectangles without shared parts
Grid ← $   +-+
       $   | |
       $ +-+-+
       $ | |  
       $ +-+  
⍤⤙≍ 2 Rectangles Grid

# Five rectangles with shared parts
Grid ← $   +-+
       $   | |
       $ +-+-+
       $ | | |
       $ +-+-+
⍤⤙≍ 5 Rectangles Grid

# Rectangle of height 1 is counted
Grid ← $ +--+
       $ +--+
⍤⤙≍ 1 Rectangles Grid

# Rectangle of width 1 is counted
Grid ← $ ++
       $ ||
       $ ++
⍤⤙≍ 1 Rectangles Grid

# 1x1 square is counted
Grid ← $ ++
       $ ++
⍤⤙≍ 1 Rectangles Grid

# Only complete rectangles are counted
Grid ← $   +-+
       $     |
       $ +-+-+
       $ | | -
       $ +-+-+
⍤⤙≍ 1 Rectangles Grid

# Rectangles can be of different sizes
Grid ← $ +------+----+
       $ |      |    |
       $ +---+--+    |
       $ |   |       |
       $ +---+-------+
⍤⤙≍ 3 Rectangles Grid

# Corner is required for a rectangle to be complete
Grid ← $ +------+----+
       $ |      |    |
       $ +------+    |
       $ |   |       |
       $ +---+-------+
⍤⤙≍ 2 Rectangles Grid

# Large input with many rectangles
Grid ← $ +---+--+----+
       $ |   +--+----+
       $ +---+--+    |
       $ |   +--+----+
       $ +---+--+--+-+
       $ +---+--+--+-+
       $ +------+  | |
       $           +-+
⍤⤙≍ 60 Rectangles Grid

# Rectangles must have four sides
Grid ← $ +-+ +-+
       $ | | | |
       $ +-+-+-+
       $   | |  
       $ +-+-+-+
       $ | | | |
       $ +-+ +-+
⍤⤙≍ 5 Rectangles Grid
