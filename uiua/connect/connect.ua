Parse     ← ⊜∘≠@\n. ▽≠@ .
Neighbors ← +[¯1_0 ¯1_1 0_¯1 0_1 1_¯1 1_0]¤
Step      ← ▽⊸∊⊃(⋅Neighbors|⊚=⊙⋅)
Start!    ← ▽≡(=0^0).⊚=
End!      ← =∩^0⊙(-1△)
Wins‼!    ← ±⧻♭≡(path(^1|^2)) ⊙¤ ⊸^0
XWins     ← Wins‼!(Start!⊣ @X|Step @X|End!⊣)
OWins     ← Wins‼!(Start!⊢ @O|Step @O|End!⊢)
Winner    ← ⨬("None"|"Black"|"White") +⊃(XWins|×2OWins) Parse
