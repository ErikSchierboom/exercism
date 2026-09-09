Guessed           ← /×∊
MaskedWord        ← $"@_" ⨬@_∘ ⊸∊
DuplicateGuesses  ← /+↧1⧆
InvalidGuesses    ← /+¬˜∊
Failures          ← +⊃(InvalidGuesses|DuplicateGuesses)
RemainingFailures ← ↥0˜-9 Failures
State             ← ⨬("Lose"|"Ongoing"|"Win") +⊃(≤9Failures|Guessed)
Guess             ← {⊃(State|MaskedWord|RemainingFailures)}
