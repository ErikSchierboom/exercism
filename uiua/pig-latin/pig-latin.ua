Latinify!      ← ◇(/$"__ay")^0↘₁⊢regex
VowelSound     ← Latinify!∘ "^([aeiou]|xr|yt)(\\w+)$"
ConsonantSound ← Latinify!⇌ "^([^aeiou]?qu|[^aeiou]+)([aeiouy]\\w*)$"
TranslateWord  ← ⍣(VowelSound|ConsonantSound)

Words     ← ⌅(⊜□⊸≠@ |/$"_ _")
Translate ← ⍜(Words|⍚TranslateWord)
