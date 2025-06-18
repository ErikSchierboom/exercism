Latinify!      ← ◇(/$"__ay")^0↘₁⊢regex
VowelSound     ← Latinify!∘ "^([aeiou]|xr|yt)(\\w+)$"
ConsonantSound ← Latinify!⇌ "^([^aeiou]?qu|[^aeiou]+)([aeiouy]\\w*)$"
TranslateWord  ← ⍣(VowelSound|ConsonantSound)
Unwords        ← /$"_ _"
Translate      ← ⍜(°Unwords|⍚TranslateWord)
