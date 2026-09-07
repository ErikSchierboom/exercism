Colors     ← {"black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white"}
Units      ← {"gigaohms" "megaohms" "kiloohms" "ohms"}
Thresholds ← 1e9_1e6_1e3_0

ColorCode ← ⊗Colors
Ohms      ← ×⊃(/+×10_1↙₂|˜ⁿ10⊢⊡₂) ≡ColorCode
Index     ← ˜⊗1≥Thresholds

LabelOhms ← ÷↥1˜⊡Thresholds
LabelUnit ← ˜⊡ Units
Label     ← $"_ _" ⊃(LabelOhms|LabelUnit) ⊸Index Ohms