Coprime  ← ¬/↥≡⌕ ∩(°/×)
MMI      ← ⊗1◿:×⇡,
Validate ← ⍤"a and m must be coprime" (Coprime :26)
Groups   ← ⊜(□∘)\+=0◿5°⊏
Sanitize ← ▽+⊃(⌵±|×⊃(≥@0|≤@9)).¯⌵
Encrypt  ← ⍜(-@a▽)(◿26+×)⌵±.
Encode   ← /$"_ _" Groups Encrypt Sanitize ⊃(⊙Validate|⋅∘)
Decrypt  ← ◿26×⊃(⋅(MMI:26)|-:⊙⋅∘)
Decode   ← ⍜(-@a▽|Decrypt)⌵±. ▽≠@\s. ⊃(⊙Validate|⋅∘)
