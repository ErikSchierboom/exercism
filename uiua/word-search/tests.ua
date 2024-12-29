~ "word-search.ua" ~ Search

# Should accept an initial game grid and a target search word
Grid     ← $ jefblpepre
Words    ← {"clojure"}
Expected ← map Words {[]}
⍤⤙≍ Expected Search Words Grid

# Should locate one word written left to right
Grid     ← $ clojurermt
Words    ← {"clojure"}
Expected ← map Words {[1_1 1_7]}
⍤⤙≍ Expected Search Words Grid

# Should locate the same word written left to right in a different position
Grid     ← $ mtclojurer
Words    ← {"clojure"}
Expected ← map Words {[1_3 1_9]}
⍤⤙≍ Expected Search Words Grid

# Should locate a different left to right word
Grid     ← $ coffeelplx
Words    ← {"coffee"}
Expected ← map {"coffee"} {[1_1 1_6]}
⍤⤙≍ Expected Search Words Grid

# Should locate that different left to right word in a different position
Grid     ← $ xcoffeezlp
Words    ← {"coffee"}
Expected ← map {"coffee"} {[1_2 1_7]}
⍤⤙≍ Expected Search Words Grid

# Should locate a left to right word in two line grid
Grid     ← $ jefblpepre
           $ tclojurerm
Words    ← {"clojure"}
Expected ← map Words {[2_2 2_8]}
⍤⤙≍ Expected Search Words Grid

# Should locate a left to right word in three line grid
Grid     ← $ camdcimgtc
           $ jefblpepre
           $ clojurermt
Words    ← {"clojure"}
Expected ← map Words {[3_1 3_7]}
⍤⤙≍ Expected Search Words Grid

# Should locate a left to right word in ten line grid
Grid     ← $ jefblpepre
           $ camdcimgtc
           $ oivokprjsm
           $ pbwasqroua
           $ rixilelhrs
           $ wolcqlirpc
           $ screeaumgr
           $ alxhpburyi
           $ jalaycalmp
           $ clojurermt
Words    ← {"clojure"}
Expected ← map Words {[10_1 10_7]}
⍤⤙≍ Expected Search Words Grid

# Should locate that left to right word in a different position in a ten line grid
Grid     ← $ jefblpepre
           $ camdcimgtc
           $ oivokprjsm
           $ pbwasqroua
           $ rixilelhrs
           $ wolcqlirpc
           $ screeaumgr
           $ alxhpburyi
           $ clojurermt
           $ jalaycalmp
Words    ← {"clojure"}
Expected ← map Words {[9_1 9_7]}
⍤⤙≍ Expected Search Words Grid

# Should locate a different left to right word in a ten line grid
Grid     ← $ jefblpepre
           $ camdcimgtc
           $ oivokprjsm
           $ pbwasqroua
           $ rixilelhrs
           $ wolcqlirpc
           $ fortranftw
           $ alxhpburyi
           $ clojurermt
           $ jalaycalmp
Words    ← {"fortran"}
Expected ← map Words {[7_1 7_7]}
⍤⤙≍ Expected Search Words Grid

# Should locate multiple words
Grid     ← $ jefblpepre
           $ camdcimgtc
           $ oivokprjsm
           $ pbwasqroua
           $ rixilelhrs
           $ wolcqlirpc
           $ fortranftw
           $ alxhpburyi
           $ jalaycalmp
           $ clojurermt
Words    ← {"fortran" "clojure"}
Expected ← map Words {[7_1 7_7] [10_1 10_7]}
⍤⤙≍ Expected Search Words Grid

# Should locate a single word written right to left
Grid     ← $ rixilelhrs
Words    ← {"elixir"}
Expected ← map Words {[1_6 1_1]}
⍤⤙≍ Expected Search Words Grid

# Should locate multiple words written in different horizontal directions
Grid     ← $ jefblpepre
           $ camdcimgtc
           $ oivokprjsm
           $ pbwasqroua
           $ rixilelhrs
           $ wolcqlirpc
           $ screeaumgr
           $ alxhpburyi
           $ jalaycalmp
           $ clojurermt
Words    ← {"elixir" "clojure"}
Expected ← map Words {[5_6 5_1] [10_1 10_7]}
⍤⤙≍ Expected Search Words Grid

# Should locate words written top to bottom
Grid     ← $ jefblpepre
           $ camdcimgtc
           $ oivokprjsm
           $ pbwasqroua
           $ rixilelhrs
           $ wolcqlirpc
           $ screeaumgr
           $ alxhpburyi
           $ jalaycalmp
           $ clojurermt
Words    ← {"clojure" "elixir" "ecmascript"}
Expected ← map Words {[10_1 10_7] [5_6 5_1] [1_10 10_10]}
⍤⤙≍ Expected Search Words Grid

# Should locate words written bottom to top
Grid     ← $ jefblpepre
           $ camdcimgtc
           $ oivokprjsm
           $ pbwasqroua
           $ rixilelhrs
           $ wolcqlirpc
           $ screeaumgr
           $ alxhpburyi
           $ jalaycalmp
           $ clojurermt
Words    ← {"clojure" "elixir" "ecmascript" "rust"}
Expected ← map Words {[10_1 10_7] [5_6 5_1] [1_10 10_10] [5_9 2_9]}
⍤⤙≍ Expected Search Words Grid

# Should locate words written top left to bottom right
Grid     ← $ jefblpepre
           $ camdcimgtc
           $ oivokprjsm
           $ pbwasqroua
           $ rixilelhrs
           $ wolcqlirpc
           $ screeaumgr
           $ alxhpburyi
           $ jalaycalmp
           $ clojurermt
Words    ← {"clojure" "elixir" "ecmascript" "rust" "java"}
Expected ← map Words {[10_1 10_7] [5_6 5_1] [1_10 10_10] [5_9 2_9] [1_1 4_4]}
⍤⤙≍ Expected Search Words Grid

# Should locate words written bottom right to top left
Grid     ← $ jefblpepre
           $ camdcimgtc
           $ oivokprjsm
           $ pbwasqroua
           $ rixilelhrs
           $ wolcqlirpc
           $ screeaumgr
           $ alxhpburyi
           $ jalaycalmp
           $ clojurermt
Words    ← {"clojure" "elixir" "ecmascript" "rust" "java" "lua"}
Expected ← map Words {[10_1 10_7] [5_6 5_1] [1_10 10_10] [5_9 2_9] [1_1 4_4] [9_8 7_6]}
⍤⤙≍ Expected Search Words Grid

# Should locate words written bottom left to top right
Grid     ← $ jefblpepre
           $ camdcimgtc
           $ oivokprjsm
           $ pbwasqroua
           $ rixilelhrs
           $ wolcqlirpc
           $ screeaumgr
           $ alxhpburyi
           $ jalaycalmp
           $ clojurermt
Words    ← {"clojure" "elixir" "ecmascript" "rust" "java" "lua" "lisp"}
Expected ← map Words {[10_1 10_7] [5_6 5_1] [1_10 10_10] [5_9 2_9] [1_1 4_4] [9_8 7_6] [6_3 3_6]}
⍤⤙≍ Expected Search Words Grid

# Should locate words written top right to bottom left
Grid     ← $ jefblpepre
           $ camdcimgtc
           $ oivokprjsm
           $ pbwasqroua
           $ rixilelhrs
           $ wolcqlirpc
           $ screeaumgr
           $ alxhpburyi
           $ jalaycalmp
           $ clojurermt
Words    ← {"clojure" "elixir" "ecmascript" "java" "rust" "lua" "lisp" "ruby"}
Expected ← map Words {[10_1 10_7] [5_6 5_1] [1_10 10_10] [1_1 4_4] [5_9 2_9] [9_8 7_6] [6_3 3_6] [6_8 9_5]}
⍤⤙≍ Expected Search Words Grid

# Should fail to locate a word that is not in the puzzle
Grid     ← $ jefblpepre
           $ camdcimgtc
           $ oivokprjsm
           $ pbwasqroua
           $ rixilelhrs
           $ wolcqlirpc
           $ screeaumgr
           $ alxhpburyi
           $ jalaycalmp
           $ clojurermt
Words    ← {"clojure" "elixir" "ecmascript" "rust" "java" "lua" "lisp" "ruby" "haskell"}
Expected ← map Words {[10_1 10_7] [5_6 5_1] [1_10 10_10] [5_9 2_9] [1_1 4_4] [9_8 7_6] [6_3 3_6] [6_8 9_5] []}
⍤⤙≍ Expected Search Words Grid

# Should fail to locate words that are not on horizontal, vertical, or diagonal lines
Grid     ← $ abc
           $ def
Words    ← {"aef" "ced" "abf" "cbd"}
Expected ← map Words {...[]}
⍤⤙≍ Expected Search Words Grid

# Should not concatenate different lines to find a horizontal word
Grid     ← $ abceli
           $ xirdfg
Words    ← {"elixir"}
Expected ← map Words {[]}
⍤⤙≍ Expected Search Words Grid

# Should not wrap around horizontally to find a word
Grid     ← $ silabcdefp
Words    ← {"lisp"}
Expected ← map Words {[]}
⍤⤙≍ Expected Search Words Grid

# Should not wrap around vertically to find a word
Grid     ← $ s
           $ u
           $ r
           $ a
           $ b
           $ c
           $ t
Words    ← {"rust"}
Expected ← map Words {[]}
⍤⤙≍ Expected Search Words Grid
