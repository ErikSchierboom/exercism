Colors     ← {"black" "brown" "red" "orange" "yellow" "green" "blue" "violet" "grey" "white"}
Units      ← {"gigaohms" "megaohms" "kiloohms" "ohms"}
Thresholds ← [1e9 1e6 1e3 0]

ColorCode ← ⊗□: Colors
Ohms      ← ×⊃(/+×10_1↙2|ⁿ:10⊢↘2) ≡◇ColorCode

Index     ← ⊗1⊸≥Thresholds
LabelOhms ← °⋕÷↥1⊡:Thresholds
LabelUnit ← °□⊡:Units
Label     ← $"_ _" ⊃(LabelOhms|LabelUnit) Index Ohms
