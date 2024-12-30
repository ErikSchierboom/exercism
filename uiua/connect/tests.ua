~ "connect.ua" ~ Winner

# An empty board has no winner
Board ← $ . . . . .    
        $  . . . . .   
        $   . . . . .  
        $    . . . . . 
        $     . . . . .
⍤⤙≍ "None" Winner Board

# X can win on a 1x1 board
Board ← $ X
⍤⤙≍ "Black" Winner Board

# O can win on a 1x1 board
Board ← $ O
⍤⤙≍ "White" Winner Board

# Only edges does not make a winner
Board ← $ O O O X   
        $  X . . X  
        $   X . . X 
        $    X O O O
⍤⤙≍ "None" Winner Board

# Illegal diagonal does not make a winner
Board ← $ X O . .    
        $  O X X X   
        $   O X O .  
        $    . O X . 
        $     X X O O
⍤⤙≍ "None" Winner Board

# Nobody wins crossing adjacent angles
Board ← $ X . . .    
        $  . X O .   
        $   O . X O  
        $    . O . X 
        $     . . O .
⍤⤙≍ "None" Winner Board

# X wins crossing from left to right
Board ← $ . O . .    
        $  O X X X   
        $   O X O .  
        $    X X O X 
        $     . O X .
⍤⤙≍ "Black" Winner Board

# O wins crossing from top to bottom
Board ← $ . O . .    
        $  O X X X   
        $   O O O .  
        $    X X O X 
        $     . O X .
⍤⤙≍ "White" Winner Board

# X wins using a convoluted path
Board ← $ . X X . .    
        $  X . X . X   
        $   . X . X .  
        $    . X X . . 
        $     O O O O O
⍤⤙≍ "Black" Winner Board

# X wins using a spiral path
Board ← $ O X X X X X X X X        
        $  O X O O O O O O O       
        $   O X O X X X X X O      
        $    O X O X O O O X O     
        $     O X O X X X O X O    
        $      O X O O O X O X O   
        $       O X X X X X O X O  
        $        O O O O O O O X O 
        $         X X X X X X X X O
⍤⤙≍ "Black" Winner Board
