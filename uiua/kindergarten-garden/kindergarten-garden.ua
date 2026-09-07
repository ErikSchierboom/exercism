ChildNames ← {"Alice" "Bob" "Charlie" "David" "Eve" "Fred" "Ginny" "Harriet" "Ileana" "Joseph" "Kincaid" "Larry"}
PlantNames ← {"grass" "clover" "radishes" "violets"}

Rows    ← ⊜∘⊸(≠@\n)
Indices ← ⊟⟜+₁×2⊗ChildNames□
Plant   ← ˜⊡PlantNames⊗"GCRV"
Plants  ← ≡Plant ♭≡˜⊏⊓(Rows|¤Indices)
