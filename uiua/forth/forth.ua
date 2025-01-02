Words  ← {"+" "-" "*" "/" "dup" "swap" "over" "drop"}
Parse  ← ⊜□≠@\s.
Number ← ⊂◇⋕
UnaryOp! ← |2 ⨬(
  ⍤"empty stack"
| ⍜(↙1|^0)
) ↧1⧻.
BinaryOp! ← |2 ⨬(
  ⍤"empty stack"
| ⍤ "only one value on the stack"
| ⍜(↙2|^0°⊟)
) ↧2⧻.
Op ← ⨬(
  BinaryOp!+◌
| BinaryOp!-◌
| BinaryOp!×◌
| BinaryOp!(⨬(⌊÷|⍤"divide by zero") =0.)◌
| UnaryOp!(⊂.)◌
| BinaryOp!(⊂:)◌
| BinaryOp!(⊂⊂,)◌
| UnaryOp!([]◌)◌
| Number
) ⊸(⊗⊙Words)
Evaluate ← ⇌ ∧Op ⊙[] Parse ¯⌵
