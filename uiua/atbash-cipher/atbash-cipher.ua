Letters   ← +@a⇡26
Digits    ← +@0⇡10
Alnum     ← ⊂Letters Digits
Reversed  ← ⊂⇌Letters Digits
Sanitize  ← ▽∈Alnum.
Groups    ← ⊜(□∘)\+=0◿5°⊏
Translate ← ⊏ ⟜Reversed ⊗ ⟜Alnum Sanitize ¯⌵
Encode    ← /$"_ _" Groups Translate
Decode    ← Translate Sanitize
